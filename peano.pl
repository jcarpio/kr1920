/*

Peano Arithmetic:

One symbol = 0
One operator (Next) n(_)

0
1 n(0)
2 n(n(0))
3 n(n(n(0)))

add(N1, N2, R).

add(N1, N2, 5).
N1= 0
N2= 5;
N1=1
N2=4;
...

*/

/*
add(?N1, ?N2, ?R)
  it is true if R unify with the addition of 
N1 and N2.
*/

% Mathematic Induction
% 1. P(n0)
% 2. P(n-1) -> P(n)
%    P(N):- N2 is N-1, P(N2).

add(0, N2, N2).
add(n(N1), N2, n(R)):-  add(N1, N2, R).


/* sub(?N1, ?N2, ?R)
 it is true if R is the substraction of N1 
 minus N2.
*/

sub(N1, 0, N1).
sub(N1, n(N2), R):-  sub(N1, N2, n(R)). 

/* mult(?N1, ?N2, ?R)
it is true if R unify with the multiple
addition of N1, N2 times.

2 * 4 = 8
2+2+2+2  = 8
4 + 4 = 8
 
*/
mult(_, 0, 0).
mult(N1, n(N2), R2):- mult(N1, N2, R),
  add(N1, R, R2).






