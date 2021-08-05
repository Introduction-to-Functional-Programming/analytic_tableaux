defmodule ProblemGeneratorTest do
  use ExUnit.Case

  test "PHP1 is (p1_1&p2_1) |- (p1_1 & p2_1)" do
    assert ProblemGenerator.generate(:php, 1) == "(p1_1 & p2_1) |- (p1_1 & p2_1)"
  end

  test "PHP2 is ..." do
    assert ProblemGenerator.generate(:php, 2) ==
             "((p1_1|p1_2)&(p2_1|p2_2)&(p3_1|p3_2)) |- (p1,1&p2,1)|(p1,1&p3,1)|(p2,1&p3,1)|(p1,2&p2,2)|(p1,2&p3,2)|(p2,2&p3,2)"
  end
end
