defmodule TreeTest do
  use ExUnit.Case

  test "A new tree with one node p is not nil" do
    assert Tree.new("p") != nil
  end

  test "You cannot create new tree with one node for a number" do
    assert Tree.new("p") != nil

    assert_raise FunctionClauseError, fn ->
      Tree.new(1)
    end
  end
end
