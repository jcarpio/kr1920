
/*
Last three concepts: 
- generic trees
- graphs -> paths
- State problems
*/

/*

  Binary Tree
    1
   / \	
  2   3
  
  Generic Tree
  
        1
      / | \ \
     2  3  4 5 
   / | \
  6  7  8 
  
       1
	/ / \ \
  2  3  4  5
  
  t(1, [t(2,[]), t(3, []), t(4,[]), t(5,[])]).
  
  */

  tree1(
      t(1, [t(2, [t(6, []), t(7, []), t(8, [])]), t(3, []), t(4, []	), t(5, [])])
      ).
/*
    1
   /|\
  2 3 4 
*/

  tree2(
      t(1,[t(2,[]), t(3, []), t(4, [])])
  ).

    tree4(
      t(1,[])
  ).
  /*

  In binary trees "nil" was a valid tree but in generic trees we
  dont't have something similar

  t(_, []).

  t( )  -> Tree
  
  []    -> List 
  */

  /*
  member(+E, +Tree)
  it is true if element E is a member of 
  generic tree Tree.
  */

  /* one predicate for the tree */

    member(E, t(E,_)).
    member(E, t(Label, ListOfTrees)):-
    E \= Label, member(E, ListOfTrees).

  /* one predicate for the list */

/* member(E, []):- false! */

member(E, [HeadTree|_]):-
    member(E, HeadTree).

member(E, [_|TailofTrees]):-
   member(E,TailofTrees).

/* Head = t(Label, [...]) */
/* Tail = [] or [t(Label, [...], t( , [..], ..]))] */


/*
leavesInTree(+Tree, -ListOfLeaves)
it is true if ListOfLeaves unify with the list of labels in Tree leafs.
*/

/* one predicate for the tree */

leavesInTree(t(E, []), [E]).
leavesInTree(t(_, ListOfTrees), R) :-  
    ListOfTrees \= [],
	leavesInListOfTrees(ListOfTrees, R ).
	
/*	

leafs(t(1,[]), [1]).

False!! -> leafs(t(1,[]), []).

	1
   / \
*/	
	

/* one predicate for the list */

leavesInListOfTrees([],[]).
leavesInListOfTrees([Head|Tail], R3 ):- 
    leavesInTree(Head, R), 
	leavesInListOfTrees(Tail, R2), 
	append(R, R2, R3).

/* count(Tree, N)
    it is tre if N unify with the number
	of elements in Tree
*/

/* predicate for trees */
countInTree(t(_, ListOfTree), R2) :- 
    countInListOfTrees(ListOfTree, R),
	  R2 is R + 1.
	
/* predicate for list of trees */
countInListOfTrees([], 0).
countInListOfTrees([Head|Tail], R3):-
   countInTree(Head, R),
   countInListOfTrees(Tail, R2),
   R3 is R + R2. 

/* add(+Tree, -R)
   it is true if R unify with the result
   of adding all values in Tree labels.
   All labels in Tree are numbers.
*/

/* predicate for trees */

/*
  
 5 -> 4 -> 3 -> 2 -> 1 -> 0 -> -1 -> -2 ....
 
*/

addInTree(t(E, ListOfTree), R2) :-  
    addInListOfTrees(ListOfTree, R),  /* [ .. ] */
    R2 is R + E.
	  
/* predicate for list of trees */

addInListOfTrees([], 0).
addInListOfTrees([Head|Tail], R3):-
   addInTree(Head, R),
   addInListOfTrees(Tail, R2),
   R3 is R + R2. 

/*
widthPath(+Tree, -List)
  it is true if List unify with the witdh
  path of Tree including only labels.
  
             1        
		   / | \ 
          2  3  4   
		 /|\    |  
        5 6 7   8
       / \  | 
      9	 10 11 
	  
	  
	         1        
		   / | \ 
          2  3  4   5   6  7  8 9 10  11
		           / \     |
	  
	  [1,2,3,4,5,6,7,8,9,10,11]


             1        
		   / | \ 
          2  3  4   
		 /|\    |  
        5 6 7   8
       / \  | 
      9	 10 11
*/
tree5(
   t(1, [t(2, [t(5, [t(9, []), t(10, [])]), t(6,[]), t(7,[t(11,[])])]), t(3, []), t(4, [t(8, [])])])
).


/* predicate for trees */

widthPath(t(Label, List), [Label|R]):-
  widthPath(List, R).

/* predicate of list of trees */
widthPath([], []).
widthPath([t(Label, List)|Tail], [Label|R2]):-
  append(Tail, List, R),
  widthPath(R, R2).
