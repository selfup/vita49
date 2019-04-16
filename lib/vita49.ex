defmodule Vita49 do
  @moduledoc """
  Documentation for Vita49.
  """

  def parse_slice(str) do
    case str =~ "|slice" do
      true ->
        check_and_build_slice_map(str)

      false ->
        []
    end
  end

  defp check_and_build_slice_map(str) do
    result =
      String.split(str, " ")
      |> Enum.filter(&(&1 =~ "="))
      |> Enum.map(fn kv ->
        kvs = String.split(kv, "=")

        k = :"#{Enum.at(kvs, 0)}"
        v = Enum.at(kvs, 1)

        {k, v}
      end)
      |> Enum.into(%{})

    [result]
  end
end
