defmodule Advent do
  @input File.read!("./day01.txt") |> String.split("\n", trim: true)

  def part1 do
    @input
    |> Enum.map(fn x -> String.replace(x, ~r/(\D)/, "") end)
    |> Enum.map(fn x -> String.graphemes(x) end)
    |> Enum.map(fn x -> List.first(x) <> List.last(x) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.reduce(0, &Kernel.+/2)
  end
end
