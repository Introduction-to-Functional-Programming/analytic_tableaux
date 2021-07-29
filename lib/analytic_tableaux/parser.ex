defmodule AnalyticTableaux.Parser do

  def tokenize(str) do
    {:ok, tokens, _} = str |> to_charlist() |> :sequent_lexer.string()
    tokens
  end

end
