defmodule ParserTest do
  use ExUnit.Case

  test "parses sequent with no premise and atomic conclusion: |- q" do
    assert AnalyticTableaux.Parser.parse("|- q") == [:q]
  end

  test "parses sequent with single atomic premise and conclusion: p |- q" do
    assert AnalyticTableaux.Parser.parse("p |- q") == [:p, :q]
  end

  test "parses sequent with multiple atomic premises and conclusions: p,r |- q" do
    assert AnalyticTableaux.Parser.parse("p,r |- q") == [:p, :r, :q]
  end

end
