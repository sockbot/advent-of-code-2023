# Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11


defmodule Advent do
  @input File.read!("./day04.txt")
    |> String.split("\n", trim: true)

  def part1 do
    @input
      |> Enum.map(fn line -> String.split(line, [":", "|"], trim: true) end)
      |> Enum.map(fn [_, winning_nums, my_nums] -> [String.split(winning_nums, " ", trim: true), String.split(my_nums, " ", trim: true)] end)
      |> Enum.map(fn [winning_nums, my_nums] ->
        [
          MapSet.new(winning_nums |> Enum.map(&(String.to_integer(&1)))),
          MapSet.new(my_nums |> Enum.map(&(String.to_integer(&1))))
        ]
      end)
      |> Enum.map(fn [winning_nums, my_nums] -> MapSet.size(MapSet.intersection(winning_nums, my_nums)) end)
      |> Enum.map(fn x -> if x > 0, do: 2**(x-1), else: 0 end)
      |> Enum.sum
  end
end
