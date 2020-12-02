run:- read(N), getDivisorMap(N, Map), search(N, Map, CL), listLength(CL, L), L1 is L div 2, write(L1).

getDivisorMap(N, Map):- getDivisorMap(N, 1, [], Map).
getDivisorMap(N, N, Map, Map):- !.
getDivisorMap(N, Key, TMap, Map):- Key1 is Key + 1, sumDivisors(Key1, Value), getDivisorMap(N, Key1, [[Key1|[Value]]|TMap], Map).

sumDivisors(2, 1).
sumDivisors(N, 0):- N < 2, !.
sumDivisors(N, S):- sumDivisors(N, 1, 0, S).
sumDivisors(N, D, S, S):- D > N div 2, !.
sumDivisors(N, D, TS, S):- Mod is N mod D, Mod is 0, S1 is TS + D, D1 is D + 1, sumDivisors(N, D1, S1, S), !.
sumDivisors(N, D, TS, S):- D1 is D + 1, sumDivisors(N, D1, TS, S), !.

search(N, FM, CL):- search(N, FM, 1, [], CL).
search(N, _, N, CL, CL):- !.
search(N, FM, I, TCL, CL):- I1 is I + 1, getValue(FM, I1, [Val1]), getValue(FM, Val1, [I1]), not(I1 is Val1), search(N, FM, I1, [I1|TCL], CL).
search(N, FM, I, TCL, CL):- I1 is I + 1, search(N, FM, I1, TCL, CL).

getValue([[Key|Value]|_], Key, Value):- !.
getValue([_|T], Key, Value):- getValue(T, Key, Value).

listLength([], 0):- !.
listLength([_|T], L):- listLength(T, L1), L is L1 + 1.







