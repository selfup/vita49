defmodule Vita49 do
  def parse_slice(str) do
    if valid_slice?(str) do
      check_and_build_slice_map(str)
    else
      []
    end
  end

  defp valid_slice?(str) do
    String.starts_with?(str, ["af|slice ", "slice "])
  end

  defp check_and_build_slice_map(str) do
    str
    |> String.split()
    |> Enum.filter(&String.contains?(&1, "="))
    |> Enum.map(fn kv ->
      [key, value] = String.split(kv, "=", parts: 2)

      {key, value}
    end)
    |> Enum.into(%{})
    |> List.wrap()
  end
end
