/* insert_sort(List, R)

   it is true if R unify with a list 
   with same elements of List ordered
   from smaller to greater.
   
   [5,3,1,2,7,4]
   [5]
   
   [5,3,1,2,7,4]
   [3,5]
   
   [5,3,1,2,7,4]
   [1,3,5]
   
   [5,3,1,2,7,4]
   [1,2,3,5]
    ...
  
*/

insert_sort([], []).
insert_sort([Head|Tail], R2):-
  insert_sort(Tail, R), 
  insert_sorted_list(Head, R, R2).
  
/*
 insert_sorted_list(E, List, R)
 it is true if R unify with a list
 with elment E inserted in right position
 of List. Elements in List are sorted
 from smaller to greater.

*/

insert_sorted_list(E, [], [E]).
insert_sorted_list(E, [Head|Tail], [E,Head|Tail]):-
  E =< Head.
insert_sorted_list(E, [Head|Tail], [Head|R]):-
  E > Head, insert_sorted_list(E, Tail, R). 
