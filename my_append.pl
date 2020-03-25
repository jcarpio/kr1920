/*
my_append(?Lis1, ?List2, ?Result)
it is true if Result unify with a list that
have the elements of List1 followed by
elements in List2.

my_append([1,2,3], [4,5], R).
R=[1,2,3,4,5]

Induction:
1) P(n0)  -> []
2) P(n-1) -> P(n)
   P(N):- N2 is N-1, P(N2).
          N-1 is the Tail of the List  
*/

my_append([], List2,  List2).

my_append([Head|Tail], List2, [Head|Result]):-
    
	my_append(Tail, List2, Result).
	

