/*

Binary trees

      1 root
     / \	
    /	\
   2     3
  / \   /
 4   5 6
 
 t(1, t(), t()).
 
 t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, t(), nil)).

      1 root
     / \	
    /	\
   2     3 <-node

t(Label, LeftTree, RightTree)

t(1, t(2, nil, nil), t(3, nil, nil)).

    1  2 3 4
     \/  \/
	  \  /
	   \/

 Index and Hashes in databases
	   
 Algorithm eficiency
 Order
 
 O(n) -> n=1M -> You need 1 second to each
               compare operation
			   1M * 1 second  = 11 days

 Binary Tree
 O(log n) ->  n = 1M -> 6 seconds
 
 
 Binary Search Tree
 
          10
         /  \		  
        /    \
       5      15
     /   \	 /  \  
    3     7 11   17
	
t(10, t(5, t(3, nil, nil), t(7,nil,nil)), t(15, t(11,nil,nil), t(17,nil,nil))).	
 */
 
 /*
 find(Element, Tree)
   it is true if Element is included in Tree.
 
Induction
1. P(n0)
2. n > n0, P(n-1) -> P(n)
   P(N) :- N2 is N-1, P(N2).
   
 We will use LeftTree and RihgtTree 
 to create induction.
 
 if LeftTree and RightTree -> Full Tree is true.
 
*/

find(E, t(E, _, _)).

% 
% a -> b v c
%
% a-> b
% a-> c

find(E, t(_, LT, _)) :-
  find(E, LT).
  
find(E, t(_, _, RT)):-
  find(E, RT).
  
tree1(t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, t(), nil))).
tree2(t(1, t(2, nil, nil), t(3, nil, nil))).  
tree3(t(10, t(5, t(3, nil, nil), t(7,nil,nil)), t(15, t(11,nil,nil), t(17,nil,nil)))).	


/* 
  find_bst(E, BST)
  it is true if E is inside the
  binary search tree BST.
*/

  find_bst(E, t(E,_, _)).
  
  find_bst(E, t(Root, LT, _)):-
     E < Root,
     find_bst(E, LT).
	 
  find_bst(E, t(Root, _, RT)):-
     E > Root,
     find(E, RT).	 
  
 
 /* create(+List, -Tree)
    it is true if Tree represent a valid binary
    tree with all elements included in List
    
	create([1,2,3], T).
	t(1, t(2,nil,nil), t(3,nil,nil))
	
*/
   create([], nil).
   
   create([Head|Tail], t(Head, T, nil)):-
	  create(Tail, T).
	  
/*	  
	    1
	   /
      2
	 /
	3
   /
  4
 /
5 

Balanced Tree
     1
    / \
   2   3
  / \
 4   5
 
 The difference between left and right 
 sons deep is a maximum of 1 for 
 all nodes in tree.
 
*/

/* create2(+List, -T)
   it is true if T is a binary balance tree
   with all elements of List
*/

   create2([], nil).
   
   create2([Head|List], t(Head, T1, T2)):-
     length(List, Length),
	 Mid is Length div 2,
	 length(L1, Mid),
	 append(L1, L2, List),
	 create2(L1, T1),
	 create2(L2, T2).
	 
	 
 create_bst([], nil).
   
   create_bst(List, t(M, T1, T2)):-
     length(List, Length),
	 Mid is Length div 2,
	 length(L1, Mid),
	 append(L1, [M|L2], List),
	 create_bst(L1, T1),
	 create_bst(L2, T2).	 
	 
	 
 
