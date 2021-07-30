defmodule ParserTest do
  use ExUnit.Case

  test "|- q" do
    assert AnalyticTableaux.Parser.parse("|- q") == [:q]
  end

end
