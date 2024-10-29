defmodule Bench do
  @moduledoc """
  Documentation for `Bench`.
  """

  def duckdbex_fetch_all(%{result: result}) do
    _rows = Duckdbex.fetch_all(result)
  end

  def duckdbex_fetch_chunks(%{result: result}) do
    duckdbex_fetch_all_chunks(result)
  end

  defp duckdbex_fetch_all_chunks(result) do
    case Duckdbex.fetch_chunk(result) do
      [] -> :ok
      _rows -> duckdbex_fetch_all_chunks(result)
    end
  end

  def duxdb_fetch_all(%{result: result}) do
    duxdb_fetch_all(result, DuxDB.column_count(result))
  end

  defp duxdb_fetch_all(result, cols) do
    case DuxDB.fetch_chunk(result) do
      chunk when is_reference(chunk) ->
        duxdb_fetch_all_vectors(chunk, 0, cols)
        duxdb_fetch_all(result, cols)

      nil ->
        :done
    end
  end

  defp duxdb_fetch_all_vectors(chunk, col, cols) when col < cols do
    _vector = DuxDB.data_chunk_get_vector(chunk, col)
    duxdb_fetch_all_vectors(chunk, col + 1, cols)
  end

  defp duxdb_fetch_all_vectors(_chunk, c, c), do: :done
end
