%% Brian Dones
%% Professor Labouseur
%% Theory of Programming Languages
%% March 29, 2014

-module(caesarCipher).
-export([caesar/0]).

caesar() ->
%%  	encrypt("Wow, I should probably get to bed soon :,(!", 3).
%%  	decrypt("Jgtokr Ixgom oy znk cuxyk Pgsky Hutj!", 6).
    solve("Well, this was painful !!!",0).

    
encrypt(S, OFFSET) ->
    ENCRYPTED = lists:map(fun(C) -> 
        shift(C,OFFSET rem 26) end, S),
	io:format("~s~n", [ENCRYPTED]).

decrypt(S, OFFSET) ->
    if (S - OFFSET) > 65 ->
        if (((S - OFFSET) > 91) and ((S - OFFSET) < 97)) ->
            encrypt(S, 26 - OFFSET);
        true ->
            encrypt(S, - OFFSET)
        end;
    true ->
        encrypt(S, 26 - OFFSET)
    end.
    

solve(S, OFFSET)     when OFFSET < 26 -> encrypt(S,OFFSET), solve(S, OFFSET + 1);
solve(S, OFFSET)     when OFFSET == 26 -> encrypt(S,OFFSET).

shift(S, _)     	when  S == 32 -> S;
shift(S, _)     	when S < 65 -> S;
shift(S, OFFSET)    when S > 64, S < 91, S + OFFSET >= 91 -> (S + OFFSET) - 26;
shift(S, OFFSET)    when S > 64, S < 91, S + OFFSET < 91 -> S + OFFSET;
shift(S, _)     	when S < 97 -> S;
shift(S, OFFSET)    when S > 96, S < 123, S + OFFSET >= 123 -> (S + OFFSET) - 26;
shift(S, OFFSET)    when S > 96, S < 122, S + OFFSET < 123 -> S + OFFSET.
	
	
	