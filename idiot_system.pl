% rules
:- dynamic answer/2.

% facts
cause(no_documentation,    'You do not read documentation even if your life depended on it.').
cause(no_sleep,            'Coding without sleep reduces IQ to fork-level.').
cause(copy_chatgpt,        'Copying ChatGPT code pretending you understand. You do not.').
cause(use_windows,         'Programming on Windows automatically removes 20 IQ points.').
cause(trust_gamer,         'Trusting a gamer for tech advice was your first mistake.').
cause(forget_semicolon,    'Forgot the semicolon again. Impressive.').

% inference
idiot_level(high) :-
    evidence(no_documentation),
    evidence(copy_chatgpt).

idiot_level(medium) :-
    evidence(no_sleep),
    evidence(use_windows).

idiot_level(low) :-
    evidence(forget_semicolon).

idiot_level(extreme) :-
    evidence(trust_gamer),
    evidence(copy_chatgpt),
    evidence(use_windows).

% prompt
evidence(Cause) :-
    answer(Cause, yes), !.

evidence(Cause) :-
    answer(Cause, no), !, fail.

evidence(Cause) :-
    format('\nDid you do this? -> ~w (yes/no): ', [Cause]),
    read(Resp),
    asserta(answer(Cause, Resp)),
    Resp == yes.

% main
diagnose :-
    writeln('\n===== Idiot Diagnosis System ====='),
    retractall(answer(_,_)),
    ( idiot_level(Level) ->
        format('\nResult: Your stupidity level is: ~w~n', [Level]),
        explain(Level)
    ; writeln('\nCould not determine. Either you are smart or lying.')
    ).

% output
explain(extreme) :-
    writeln("You are beyond salvation. A cosmic-level dumbass.").

explain(high) :-
    writeln("High stupidity detected. Brain might be overheating.").

explain(medium) :-
    writeln("Moderately stupid. A bit of hope remains.").

explain(low) :-
    writeln("Only mildly dumb. Respectable.").

