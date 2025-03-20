defmodule Vita49Test do
  use ExUnit.Case
  doctest Vita49

  test "it turns a valid slice into JSON" do
    res =
      "af|slice 3 tx=1 txant=ANT2 RF_frequency=3.12"
      |> Vita49.parse_slice()

    expected = [%{"RF_frequency" => "3.12", "tx" => "1", "txant" => "ANT2"}]

    assert res == expected
  end

  test "it returns an empty list with an invalid slice" do
    res =
      "3 tx=1 txant=ANT2 RF_frequency=3.12"
      |> Vita49.parse_slice()

    assert res == []
  end

  test "it can parse on the fly" do
    [
      "af|slice 3 tx=1 txant=ANT2 RF_frequency=3.12",
      "3 tx=1 txant=ANT2 RF_frequency=3.12",
      "af|slice 3 tx=1 txant=ANT2 RF_frequency=3.12",
      "3 tx=1 txant=ANT2 RF_frequency=3.12"
    ]
    |> Enum.map(&Vita49.parse_slice(&1))
    |> Enum.each(fn slice ->
      case slice do
        [result] ->
          assert result["tx"] == "1"

        no_match ->
          assert no_match == []
      end
    end)
  end
end
