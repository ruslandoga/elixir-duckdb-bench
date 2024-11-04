sql = """
select
  i as integer,
  i / 1.0 as float,
  'hello' || i as text,
  null
from range(1, $1) as t(i)
"""

interpolate_sql = fn rows ->
  String.replace(sql, "$1", Integer.to_string(rows))
end

Benchee.run(
  %{
    "duxdb" =>
      {&Bench.duxdb_fetch_all/1,
       before_scenario: fn rows ->
         db = DuxDB.open(":memory:")
         conn = DuxDB.connect(db)
         stmt = DuxDB.prepare(conn, interpolate_sql.(rows))
         # see below
         # stmt = DuxDB.prepare(conn, sql)
         # DuxDB.bind_int64(stmt, 1, rows)
         %{db: db, conn: conn, stmt: stmt}
       end,
       after_scenario: fn %{db: db, conn: conn, stmt: stmt} ->
         DuxDB.destroy_prepare(stmt)
         DuxDB.disconnect(conn)
         DuxDB.close(db)
       end},
    "duckdbex.fetch_all" =>
      {&Bench.duckdbex_fetch_all/1,
       before_scenario: fn rows ->
         {:ok, db} = Duckdbex.open()
         {:ok, conn} = Duckdbex.connection(db)
         # TODO how to bind parameters to prepared statements in Duckdbex?
         # the README example doesn't work
         {:ok, stmt} = Duckdbex.prepare_statement(conn, interpolate_sql.(rows))
         %{db: db, conn: conn, stmt: stmt}
       end},
    "duckdbex.fetch_chunk (all)" =>
      {&Bench.duckdbex_fetch_chunks/1,
       before_scenario: fn rows ->
         {:ok, db} = Duckdbex.open()
         {:ok, conn} = Duckdbex.connection(db)
         # TODO how to bind parameters to prepared statements in Duckdbex?
         # the README example doesn't work
         {:ok, stmt} = Duckdbex.prepare_statement(conn, interpolate_sql.(rows))
         %{db: db, conn: conn, stmt: stmt}
       end}
  },
  inputs: %{
    "100 rows" => 100,
    "100000 rows" => 100_000
    # "100000000 rows" => 100_000_000
  },
  memory_time: 2
)
