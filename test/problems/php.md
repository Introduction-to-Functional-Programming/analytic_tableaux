# PHP

## Sources of truth

Multiple formulas: 
https://github.com/adolfont/KEMS/tree/master/kems.problems/problems/generated/cpl/php_several_formulas

One formula: https://github.com/adolfont/KEMS/tree/master/kems.problems/problems/generated/classicFamilies/php_one_formula

But now we want to start with 1.

And we want a sequent.

https://github.com/adolfont/KEMS

PHP N means N+1 balls and N boxes.

## PHP 1

When you have two balls and one box, and you have to put each ball in a box, you can be sure that at least one box will have two balls.

pi_j means "ball i is in box j".

(p1_1&p2_1) |- (p1_1&p2_1)


## PHP 2

When you have *three* balls and *two* boxes, and you have to put each ball in a box, you can be sure that at least one box will have two balls.

pi_j means "ball i is in box j".

(p1_1&p2_1) |- (p1_1&p2_1)


(p1_1|p1_2)
|
(p2_1|p2_2)
|
(p3_1|p3_2)
|-
(p1_1&p2_1)
&
(p1_1&p3_1)
&
(p2_1&p3_1)
&
(p1_2&p2_2)
&
(p1_2&p3_2)
&
(p2_2&p3_2)

# PHP 3

T ((p0,0|p0,1)|p0,2)
T ((p1,0|p1,1)|p1,2)
T ((p2,0|p2,1)|p2,2)
T ((p3,0|p3,1)|p3,2)
F (p0,0&p1,0)
F (p0,0&p2,0)
F (p0,0&p3,0)
F (p1,0&p2,0)
F (p1,0&p3,0)
F (p2,0&p3,0)
F (p0,1&p1,1)
F (p0,1&p2,1)
F (p0,1&p3,1)
F (p1,1&p2,1)
F (p1,1&p3,1)
F (p2,1&p3,1)
F (p0,2&p1,2)
F (p0,2&p2,2)
F (p0,2&p3,2)
F (p1,2&p2,2)
F (p1,2&p3,2)
F (p2,2&p3,2)

## Pietro's solution

pi_j means "ball i is in box j".

The left side 
means
each ball is in one of the boxes.

The right side 
means that
at least one box will have two (or more) balls.

(p1_1|p1_2|p1_3)& // first ball is in one of the boxes
(p2_1|p2_2|p2_3)& // second ball
(p3_1|p3_2|p3_3)&
(p4_1|p4_2|p4_3)  // fourth ball
|- 
(p1_1&p2_1)|
(p1_1&p3_1)|
(p1_1&p4_1)|
(p1_2&p2_2)|
(p1_2&p3_2)|
(p1_2&p4_2)|
(p1_3&p2_3)|
(p1_3&p3_3)|
(p1_3&p4_3)|
(p2_1&p3_1)|
(p2_1&p4_1)|
(p2_2&p3_2)|
(p2_2&p4_2)|
(p2_3&p3_3)|
(p2_3&p4_3)|
(p3_1&p4_1)|
(p3_2&p4_2)|
(p3_3&p4_3)