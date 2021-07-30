defmodule ParserTest do
  use ExUnit.Case

  test "|- q" do
    assert AnalyticTableaux.Parser.parse("|- q") == [:q]
  end

  test "p |- q" do
    assert AnalyticTableaux.Parser.parse("p |- q") == [:p, :q]
  end

end
