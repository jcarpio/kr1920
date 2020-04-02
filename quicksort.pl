/*
 quicksort(-List, +R)
 it is true if R unify with a list with
 elements of List sorted from less to more high values.
*/

quicksort([], []).
quicksort([Head|Tail], R):-
        divide(Tail, Head, L, H),
        quicksort(L, RL),
        quicksort(H, RH),
        append(RL, [Head|RH], R).
    
/* divide(-List, -Pivot, +Less, +High)
   it if true if Less unify with a list with
   the elements of List that are less or equal than 
   Pivot and High unify with a list of elements of List
   that are higher than Pivot.

   1. P(n0)
   2. n > n0, P(n-1) -> P(n)
      P(N) :- N2 is N-1, P(N2)

*/

divide([], _, [], []).

divide([Head|Tail], P, [Head|L], H):- divide(Tail, P, L, H),
   Head =< P.
   
divide([Head|Tail], P, L, [Head|H]):- divide(Tail, P, L, H),
   Head > P.
