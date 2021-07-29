Definitions.

ATOM       = [a-z]
WHITESPACE = [\s\t\n\r]
ARROW      = \->
TURNSTILE  = \|\-
PIPE       = \|
AMPERSAND  = \&
TILDE      = \~

Rules.

{ATOM}        : {token, {atom,   TokenLine, list_to_atom(TokenChars)}}.
\(            : {token, {'(',    TokenLine}}.
\)            : {token, {')',    TokenLine}}.
,             : {token, {',',    TokenLine}}.
{TURNSTILE}   : {token, {'|-',   TokenLine}}.
{TILDE}       : {token, {unary,  TokenLine, 'not'}}.
{PIPE}        : {token, {binary, TokenLine, 'or'}}.
{AMPERSAND}   : {token, {binary, TokenLine, 'and'}}.
{ARROW}       : {token, {binary, TokenLine, 'implies'}}.
{WHITESPACE}+ : skip_token.

Erlang code.
