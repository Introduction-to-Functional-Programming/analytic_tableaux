defmodule TestHelpers.SequentExamples do

  def valid() do
    "./valid.problems"
    |> Path.expand(__DIR__)
    |> read_problem_file()
  end

  def invalid() do
    "./invalid.problems"
    |> Path.expand(__DIR__)
    |> read_problem_file()
  end

  defp read_problem_file(path) do
    path
    |> File.read!
    |> String.split("\n")
  end

end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)
