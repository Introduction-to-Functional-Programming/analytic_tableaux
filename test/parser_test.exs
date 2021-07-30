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

  test "should parse binary formulas with atomic children" do
    assert AnalyticTableaux.Parser.parse("|- (p & q)") == [{:and, :p, :q}]
    assert AnalyticTableaux.Parser.parse("|- (p | q)") == [{:or, :p, :q}]
    assert AnalyticTableaux.Parser.parse("(a&b), (b&c),b|- (p & q)") == [{:and, :a, :b}, {:and, :b, :c}, :b, {:and, :p, :q}]
    assert AnalyticTableaux.Parser.parse("(a&b), (b|c),b|- (p -> q)") == [{:and, :a, :b}, {:or, :b, :c}, :b, {:implies, :p, :q}]
  end

  test "should parse binary formulas with complex binary children" do
    assert AnalyticTableaux.Parser.parse("|- (p & (q | r))") == [{:and, :p, {:or, :q, :r}}]
    assert AnalyticTableaux.Parser.parse("p, ((q|r)|(a|(b&c)))|- (p & (q | r))") == [
      :p,
      {:or, {:or, :q, :r}, {:or, :a, {:and, :b, :c}}},
      {:and, :p, {:or, :q, :r}}
    ]
  end

  test "should parse unary formulas with atomic children" do
    assert AnalyticTableaux.Parser.parse("|- ~q") == [{:not, :q}]
    assert AnalyticTableaux.Parser.parse("|- ~a") == [{:not, :a}]
    assert AnalyticTableaux.Parser.parse("~b |- a") == [{:not, :b}, :a]
    assert AnalyticTableaux.Parser.parse("~b,~c |- a") == [{:not, :b}, {:not, :c}, :a]
  end

  test "should parse unary formulas with complex children" do
    assert AnalyticTableaux.Parser.parse("|- ~~q") == [{:not, {:not, :q}}]
    assert AnalyticTableaux.Parser.parse("|- ~(q&r)") == [{:not, {:and, :q, :r}}]
    assert AnalyticTableaux.Parser.parse("|- ~~(q&r)") == [{:not, {:not, {:and, :q, :r}}}]
    assert AnalyticTableaux.Parser.parse("p, ~d, (~(q|~r)|(a|~(b&c)))|- (p & (q | r))") == [
      :p,
      {:not, :d},
      {:or, {:not, {:or, :q, {:not, :r}}}, {:or, :a, {:not, {:and, :b, :c}}}},
      {:and, :p, {:or, :q, :r}}
    ]
  end

  test "overbracketing is allowed" do
    assert AnalyticTableaux.Parser.parse("|- (q)") == [:q]
    assert AnalyticTableaux.Parser.parse("|- (~(~(q)))") == [{:not, {:not, :q}}]
    assert AnalyticTableaux.Parser.parse("((a)) |- (q)") == [:a, :q]
    assert AnalyticTableaux.Parser.parse("((a & b)) |- (q)") == [{:and, :a, :b}, :q]
  end

end
