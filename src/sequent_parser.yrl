Nonterminals sequent formula.
Terminals atom '|-'.
Rootsymbol sequent.

sequent -> '|-' formula : ['$2'].
formula    -> atom : extract_token('$1').


Erlang code.

extract_token({_Token, _Line, Value}) -> Value.