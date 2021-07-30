Nonterminals sequent outer_formula outer_formulas formula binary_op unary_op.
Terminals atom '|-' ',' '(' ')' binary unary.
Rootsymbol sequent.

sequent    ->  '|-' outer_formula                 : ['$2'].
sequent    ->  outer_formulas '|-' outer_formula  : append('$1', ['$3']).

outer_formulas   ->  outer_formula                     : ['$1'].
outer_formulas   ->  outer_formula ',' outer_formulas  : ['$1'|'$3'].

% distinguish outer formula from formula to allow top-level formulas
% without surrounding parentheses
outer_formula    ->  formula                         : '$1'.
outer_formula    ->  formula binary_op formula       : {'$2', '$1', '$3'}.

formula    ->  atom                             : extract_token('$1').
formula    -> '(' formula binary_op formula ')' : {'$3', '$2', '$4'}.
formula    -> unary_op formula                  : {'$1', '$2'}.
% overbracketing
formula    -> '(' formula ')'                   : '$2'.

binary_op  ->  binary   : extract_token('$1').
unary_op   ->  unary    : extract_token('$1').



Erlang code.

extract_token({_Token, _Line, Value}) -> Value.

append([H|T], Tail) ->
    [H|append(T, Tail)];
append([], Tail) ->
    Tail.