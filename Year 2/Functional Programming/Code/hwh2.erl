-module(hwh2).
-compile(export_all).

% Question 1
%I'm not sure if this is done properly
%If perhaps doesnt matter then X must be true
%Thus it should return true (X value), otherwise it should return perhaps?

xor3(perhaps,X) when X == true -> X;
xor3(perhaps,X) when X == false -> perhaps;
xor3(false,false)->false;
xor3(false,true)->true;
xor3(true,false)->true;
xor3(true,true)->false.

% Question 2
countperhaps([]) -> 0;
countperhaps([X|Xs]) when X == perhaps -> 1 + countperhaps(Xs);
countperhaps([_|Xs]) -> countperhaps(Xs).

% Question 3
getmaybe(X, nothing) -> X;
getmaybe(_,{just, nothing}) -> nothing;
getmaybe(_,{just, Y}) -> Y.

% Question 4
pingpong(V,P) ->
    receive
        {ping,V,VAL} -> P!{pong,VAL}
    end.

% Question 5
countervalue(X) ->
    receive
        {inc,P} -> P!{X+1}, countervalue(X)
    end.