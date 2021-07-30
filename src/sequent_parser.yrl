Nonterminals sequent formula formulas binary_op unary_op.
Terminals atom '|-' ',' '(' ')' binary unary.
Rootsymbol sequent.

sequent    ->  '|-' formula           : ['$2'].
sequent    ->  formulas '|-' formula  : append('$1', ['$3']).

formulas   ->  formula                : ['$1'].
formulas   ->  formula ',' formulas   : ['$1'|'$3'].

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