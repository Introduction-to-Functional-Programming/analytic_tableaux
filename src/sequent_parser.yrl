Nonterminals sequent formula formulas.
Terminals atom '|-' ','.
Rootsymbol sequent.

sequent    ->  '|-' formula           : ['$2'].
sequent    ->  formulas '|-' formula  : append('$1', ['$3']).
formulas   ->  formula                : ['$1'].
formulas   ->  formula ',' formulas   : ['$1'|'$3'].
formula    ->  atom                   : extract_token('$1').


Erlang code.

extract_token({_Token, _Line, Value}) -> Value.

append([H|T], Tail) ->
    [H|append(T, Tail)];
append([], Tail) ->
    Tail.