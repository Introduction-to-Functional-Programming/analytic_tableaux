defmodule ProblemGeneratorTest do
  use ExUnit.Case

  test "PHP1 is (p1_1&p2_1) |- (p1_1 & p2_1)" do
    assert ProblemGenerator.generate(:php, 1) ==
             "(p1_1&p2_1) |- (p1_1&p2_1)"
  end

  test "PHP2 is ..." do
    assert ProblemGenerator.generate(:php, 2) ==
             "((p1_1|p1_2)&(p2_1|p2_2)&(p3_1|p3_2)) |- ((p1_1&p2_1)|(p1_1&p3_1)|(p2_1&p3_1)|(p1_2&p2_2)|(p1_2&p3_2)|(p2_2&p3_2))"
  end

  test "PHP3 is ..." do
    assert ProblemGenerator.generate(:php, 3) ==
             "((p1_1|p1_2|p1_3)&(p2_1|p2_2|p2_3)&(p3_1|p3_2|p3_3)&(p4_1|p4_2|p4_3)) |- ((p1_1&p2_1)|(p1_1&p3_1)|(p2_1&p3_1)|(p2_1&p4_1)|(p3_1&p4_1)|(p1_2&p2_2)|(p1_2&p3_2)|(p2_2&p3_2)|(p2_2&p4_2)|(p3_2&p4_2)|(p1_3&p2_3)|(p1_3&p3_3)|(p2_3&p3_3)|(p2_3&p4_3)|(p3_3&p4_3))"
  end
end
