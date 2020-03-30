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

/*
  peano_div(?N1, ?N2, ?Result, ?Rest)
  
  it is true if R is the number if times 
  we can delete N2 to N1 and Rest is the
  rest of integer division.

  p2d(N1, 5), p2d(N2, 2), 
  peano_div(N1, N2, R, Rest),
  p2d(R, RD), p2d(Rest, RestD).
  RD=2
  RestD=1
  
  Peano Arithmetic
  0 - 0 
  1 - n(0)
  2 - n(n(0))

5 div 2   ->  3 div 2   ->   1 div 2
R=2, Rest=1  R=1, Rest=1   R=0, Rest=1
*/

peano_div(N1, N2, 0, N1):- peano_smaller(N1, N2).
peano_div(N1, N2, n(R), Rest):- sub(N1, N2, N12), 
  peano_div(N12, N2, R, Rest).

/*
 peano_smaller(?N1, ?N2) 
 it is true if N1 is smaller than N2.
*/

peano_smaller(0, n(_)).
peano_smaller(n(N1), n(N2)) :- 
  peano_smaller(N1, N2).
  
/* 
  p2d(?P, ?D)
  it is true if D represent the decimal
  number of peano number P.
*/

p2d(0,0).
p2d(n(P), D2):- p2d(P, D), D2 is D+1.
