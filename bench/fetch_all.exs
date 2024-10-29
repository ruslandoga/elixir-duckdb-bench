sql = fn rows ->
  """
  select
    i as integer,
    i / 1.0 as float,
    'hello' || i as text,
    null
  from range(1, #{rows}) as t(i)
  """
end

Benchee.run(
  %{
    "0_duxdb" =>
      {&Bench.duxdb_fetch_all/1,
       before_scenario: fn rows ->
         config = DuxDB.create_config()
         db = DuxDB.open_ext(":memory:", config)
         DuxDB.destroy_config(config)
         conn = DuxDB.connect(db)
         result = DuxDB.query_dirty_cpu(conn, sql.(rows))
         %{db: db, conn: conn, result: result}
       end,
       after_scenario: fn %{db: db, conn: conn, result: result} ->
         DuxDB.destroy_result(result)
         DuxDB.disconnect(conn)
         DuxDB.close(db)
       end},
    "1_duckdbex_fetch_all" =>
      {&Bench.duckdbex_fetch_all/1,
       before_scenario: fn rows ->
         {:ok, db} = Duckdbex.open()
         {:ok, conn} = Duckdbex.connection(db)
         {:ok, result} = Duckdbex.query(conn, sql.(rows))
         %{db: db, conn: conn, result: result}
       end},
    "1_duckdbex_fetch_chunks" =>
      {&Bench.duckdbex_fetch_chunks/1,
       before_scenario: fn rows ->
         {:ok, db} = Duckdbex.open()
         {:ok, conn} = Duckdbex.connection(db)
         {:ok, result} = Duckdbex.query(conn, sql.(rows))
         %{db: db, conn: conn, result: result}
       end}
  },
  inputs: %{
    "100 rows" => 100,
    "100000 rows" => 100_000,
    "100000000 rows" => 100_000_000
  }
)
