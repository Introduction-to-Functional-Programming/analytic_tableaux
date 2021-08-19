defmodule ProblemGenerator do
  # Inspiration: https://math.stackexchange.com/questions/1527273/pigeonhole-principle-formula-using-propositonal-logic

  def generate(:php, n) do
    left_list(n) <> " |- " <> right_list(n)
  end

  def left_list(n) do
    Enum.map_join(0..n, "&", fn i ->
      Enum.map_join(0..(n - 1), "|", fn j -> "p#{i + 1}_#{j + 1}" end) |> (&"(#{&1})").()
    end)
  end

  def right_list(n) do
    for(i <- 0..n, j <- 0..(n - 1), k <- 0..n, do: {i, j, k})
    |> Enum.filter(fn {i, _j, k} -> i < k end)
    |> Enum.map_join("|", fn {i, j, k} -> "(p#{i + 1}_#{j + 1}&p#{k + 1}_#{j + 1})" end)
  end
end
