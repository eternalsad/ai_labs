domains
list=integer*
predicates
nondeterm min(list,integer,list).
nondeterm sorted(list,list).
clauses
% In this clause, the list has a single element.
min([H], H, []).

% In this clause, the head is not the minimal element of the list.
min([H|L], M, [H|R]) :- min(L, M, R), H >= M.

% In this clause, the head is the minimal element of the list.
min([H|L], H, [M|R]) :- min(L, M, R), H < M.

sorted([], []).
sorted(L,[M|S]) :- min(L,M,R), sorted(R,S).
goal
L=[68,23,1,2,3,4],sorted(L,L2),write(L2),nl.