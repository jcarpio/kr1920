/*

num_elements(+List, -Number)

it is true if Number unify whith
the number of elements of List

?- num_elements([1,2,3], N).
N = 3

?- num_elements([1,2,3], 3).
yes

?- num_elements(List, 3).

*/

num_elements([], 0).

num_elements([Head|Tail], R):- 
      num_elements(Tail, N), R is N+1.
