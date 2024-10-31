defmodule Bench do
  @moduledoc """
  Documentation for `Bench`.
  """

  def duckdbex_fetch_all(%{stmt: stmt}) do
    {:ok, result} = Duckdbex.execute_statement(stmt)
    Duckdbex.fetch_all(result)
  end

  def duckdbex_fetch_chunks(%{stmt: stmt}) do
    {:ok, result} = Duckdbex.execute_statement(stmt)
    duckdbex_fetch_all_chunks(result)
  end

  defp duckdbex_fetch_all_chunks(result) do
    case Duckdbex.fetch_chunk(result) do
      [] -> :ok
      _rows -> duckdbex_fetch_all_chunks(result)
    end
  end

  def duxdb_fetch_all(%{stmt: stmt}) do
    result = DuxDB.execute_prepared_dirty_cpu(stmt)
    chunks = duxdb_fetch_all(result, DuxDB.column_count(result), _acc = [])
    DuxDB.destroy_result(result)
    chunks
  end

  defp duxdb_fetch_all(result, cols, acc) do
    case DuxDB.fetch_chunk(result) do
      chunk when is_reference(chunk) ->
        duxdb_fetch_all(result, cols, [duxdb_fetch_all_vectors(chunk, 0, cols) | acc])

      nil ->
        :lists.reverse(acc)
    end
  end

  defp duxdb_fetch_all_vectors(chunk, col, cols) when col < cols do
    vector = DuxDB.data_chunk_get_vector(chunk, col)
    [vector | duxdb_fetch_all_vectors(chunk, col + 1, cols)]
  end

  defp duxdb_fetch_all_vectors(_chunk, c, c), do: []
end
