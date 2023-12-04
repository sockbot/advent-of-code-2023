defmodule Advent do
  @input File.read!("./day02.txt")
    |> String.split("\n", trim: true)

  def part1 do
    @input
      |> Enum.map(&parse_game/1)
      |> Enum.with_index(1)
      |> Enum.filter(fn {el, _} -> round_is_valid(el) end)
      |> Enum.map(fn {_, idx} -> idx end)
      |> Enum.sum()
  end

  defp parse_game(line) do
    Regex.scan(~r/(\d+) (red|green|blue)/, line, capture: :all_but_first)
    |> Enum.map(fn [value, key] -> [String.to_integer(value), key] end)
    |> Enum.reduce(%{}, fn [value, key], acc -> Map.update(acc, key, value, &(max(value, &1))) end)
  end

  defp round_is_valid(round) do
    round["red"] <= 12 and round["green"] <= 13 and round["blue"] <= 14
  end
end
