run:- writeln("Input List length: "), read(N),
      writeln("Input List: "), readList(L, N),
      noRepeatDivList(L, NRL),
      writeln("Result: "), writeList(NRL).

readList(L, N):- readList(L, [], N).
readList(L, L, 0):- !.
readList(L, TL, N):- read(H), N1 is N - 1, readList(L, [H|TL], N1).

noRepeatDivList(L, NRL):- noRepeatDivList(L, [], NRL).
noRepeatDivList([], NRL, NRL):- !.
noRepeatDivList([H|T], TNRL, NRL):- buildAllDivs(H, DL), findNewDivs(DL, TNRL, NTNRL), noRepeatDivList(T, NTNRL, NRL).
noRepeatDivList([_|T], TNRL, NRL):- noRepeatDivList(T, TNRL, NRL).

buildAllDivs(1, [1]):- !.
buildAllDivs(2, [1,2]):- !.
buildAllDivs(H, DL):- buildAllDivs(H, [H], 1, DL).
buildAllDivs(H, DL, I, DL):- I is H div 2 + 1.
buildAllDivs(H, TDL, I, DL):- Mod is H mod I, Mod is 0, I1 is I + 1, buildAllDivs(H, [I|TDL], I1, DL).
buildAllDivs(H, TDL, I, DL):- I1 is I + 1, buildAllDivs(H, TDL, I1, DL).

findNewDivs(DL, TNRL, NTNRL):- findNewDivs(DL, TNRL, TNRL, NTNRL).
findNewDivs([], _, NTNRL, NTNRL):- !.
findNewDivs([H|T], _, TNRL, NTNRL):- not(inList(H, TNRL)), findNewDivs(T, _, [H|TNRL], NTNRL).
findNewDivs([_|T], _, TNRL, NTNRL):- findNewDivs(T, _, TNRL, NTNRL).

inList(H, [H|_]).
inList(X, [_|T]):- inList(X, T).

writeList([]):- !.
writeList([H|T]):- write(H), write(" "), writeList(T).




