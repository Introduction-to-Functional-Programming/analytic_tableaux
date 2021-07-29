Definitions.

ATOM       = [a-z]
WHITESPACE = [\s\t\n\r]
ARROW      = \->
TURNSTILE  = \|\-
PIPE       = \|
AMPERSAND  = \&
TILDE      = \~

Rules.

{ATOM}        : {token, {atom, TokenLine, list_to_atom(TokenChars)}}.
\(            : {token, {'(',  TokenLine}}.
\)            : {token, {')',  TokenLine}}.
,             : {token, {',',  TokenLine}}.
{TURNSTILE}   : {token, {'|-',  TokenLine}}.
{PIPE}        : {token, {'|',  TokenLine}}.
{AMPERSAND}   : {token, {'&',  TokenLine}}.
{TILDE}       : {token, {'~',  TokenLine}}.
{WHITESPACE}+ : skip_token.
{ARROW}       : {token, {'->',  TokenLine}}.

Erlang code.
