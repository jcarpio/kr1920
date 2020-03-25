
/*
my_reverse(?List, ?Result)
it is true if Result unify with a list 
with same elements of List in reverse order

my_reverse([1,2,3,4], R).
R=4,3,2,1

R=4,3,2

*/

my_reverse([], []).

my_reverse([Head|Tail], R2):-

  my_reverse(Tail, R),
  append(R, [Head], R2).
