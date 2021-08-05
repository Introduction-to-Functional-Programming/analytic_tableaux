defmodule AnalyticTableauxTest do
  use ExUnit.Case

  @tag :pending
  test "The sequent p, p->q |- q is valid" do
    sequent = "p, p->q |- q"

    # signed_formulas = generate_signed_formulas(sequent)
    # """
    # T p
    # T p->q
    # F q
    # """

    # Parser.parse(signed_formulas)

    assert Prover.prove(sequent).status == :valid
  end

  @tag :pending
  test "The sequent p, p->r |- q is NOT valid" do
    sequent = "p, p->r |- q"
    assert Prover.prove(sequent).status == :not_valid
  end
end
