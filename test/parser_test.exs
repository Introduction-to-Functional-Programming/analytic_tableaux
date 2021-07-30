defmodule ParserTest do
  use ExUnit.Case

  describe "should parse sequent with no premise and atomic conclusion:" do
    table = [
      {"|- q", [:q]},
      {"|- p", [:p]}
    ]

    for {sequent, expected_result} <- table do
      test sequent do
        assert AnalyticTableaux.Parser.parse(unquote(sequent)) == unquote(expected_result)
      end
    end
  end

  test "parses sequent with single atomic premise and conclusion: p |- q" do
    assert AnalyticTableaux.Parser.parse("p |- q") == [:p, :q]
  end

  test "parses sequent with multiple atomic premises and conclusions: p,r |- q" do
    assert AnalyticTableaux.Parser.parse("p,r |- q") == [:p, :r, :q]
  end

  test "parse fails if no conclusion" do
    assert_raise MatchError, fn ->
      AnalyticTableaux.Parser.parse("p,r |-")
    end
  end

end
