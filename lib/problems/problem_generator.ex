defmodule ProblemGenerator do
  #  https://github.com/adolfont/KEMS/tree/master/kems.problems

  def generate(problem, n) do
    generate_left_side(problem, n) <>
      "|-" <>
      generate_right_side(problem, n)
  end

  defp generate_left_side(_, n) do
    1..(n + 1)
    |> Enum.map(fn x -> generate_left_side_subformula(x, n) end)
    |> Enum.join("&")
    |> add_external_parentheses()
  end

  defp add_external_parentheses(string) do
    "(#{string})"
  end

  defp generate_left_side_subformula(i, n) do
    1..n
    |> Enum.map(fn x -> "p#{i}_#{x}" end)
    |> Enum.join("|")
    |> add_external_parentheses()
  end

  defp generate_right_side(:php, n) do
    1..n
    |> Enum.map(fn x -> generate_right_side_aux(:php, x, n) end)
    |> Enum.join("|")
    |> add_external_parentheses()
  end

  defp generate_right_side_aux(:php, i, n) do
    "p#{n}_#{i}"
  end
end
