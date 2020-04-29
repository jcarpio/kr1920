
/*
  State Problems
   
  - Missionaires and Cannabals
  - Problem of water gallons
     3 gallons 
	 5 gallons
  - Chess
  
	 How to obtain exactly 4 gallons of water

	            
	  |   |    
	  |   |    |   |
	  -----    |---|
	    G5      G3  
		4       0

[fillG5,fillG3,emptyG5,putG3inG5,fillG3,putG3inG5,
   emptyG5,putG3inG5,fillG3,putG3inG5]

	
	           |   |G3+G5 
	  |   |    |   |_ 3
	  |   |    |   |
	  -----    |---|
	    G5      G3    T is G5 + G3

	
    1. G5 + G3 =< 3	
	2. G5 + G3 > 3
	    -> G3 = 3
		-> G5 = (G3 + G5) - 3 
		
		   T
	  |	  |_      
	  |   |   
	  |   |    |   |
	  -----    |---|
	    G5      G3   

     1. T is G3 + G5, T =< 5.
     2. T is G3 + G5, T > 5.	 
		
    1. Represent the state
	   (minumum information that I need to
	    represent one picture of the problem)

	   state( G5, G3 ).
	   
	   state(0, 0). % Initial state
	   
	   after fill G5 the state will be
	   
	   state(5, 0).
	   
	   G5 represents the number of gallons in
	   5 gallons bottle.
	   G3 represents the number of gallons in
	   3 gallons bottle.
	   
	2. Initial State: Using state definition we need to
       define what is the initial state. 
       Final State: State at the goal	   

    3. Define movements
         Which possible movements can I do? 	
		 1. Fill G5
		 2. Fill G3
		 3. Empty G5
		 4. Empty G3
		 5. Put G5 content in G3
		 6. Put G3 content in G5

        Final state:
		
		state(_, 4).
		The goal is obtain exactly 4 gallons
		
    4. Create a path to the solution
*/

/* Initial state */
state(0,0).

/* Define movements 

   mov(MovName, StateBefore, StateAfter).

  The solution for this problem will be
  a list of movements
  
  [fillG5, putG5inG3, emptyG5, ...]
 
 */

/* 	 1. Fill G5 */

mov(fillG5, state(_, G3), state(5, G3) ).

/* 2. Fill G3 */
mov(fillG3, state(G5, _),  state(G5, 3) ).

/* 3. Empty G5 */
mov(emptyG5, state(_, G3), state(0, G3) ).

/* 4. Empty G3 */
mov(emptyG3, state(G5, _), state(G5, 0) ).

/* 5. Put G5 content in G3 */
/*   5.1 G5 + G3 =< 3 */	
	
mov(putG5inG3, state(G5, G3), state(0, T) ):-
  T is G3 + G5, 
  T =< 3.

/* 5.2 G5 + G3 > 3 
   G5 = (G3 + G5) - 3
*/

mov(putG5inG3, state(G5, G3), state(G52, 3) ):-
  T is G3 + G5,
  T > 3,
  G52 is T - 3.


/* 6. Put G3 content in G5 */
/*   6.1 G5 + G3 =< 5 */
mov(putG3inG5, state(G5, G3), state(T, 0) ):-
  T is G3 + G5,
  T =< 5.
	

/*   6.2 G5 + G3 > 5 */
mov(putG3inG5, state(G5, G3), state(5, G32) ):-
  T is G3 + G5,
  T > 5,
  G32 is T - 5.
  
 
/* Path to the solution 


   Initial State                    Final State
    
      |- mov -> New State -> mov ... --- -> |
	  
	Induction:
	
   path(+InitialState, +FinalState, +Visited, -Path)	
    it is true if Path unify with a list of movements
	that we need to go from InitialState to
	finalState without repeat states in Visited states.
	Visited is a list of visited states.
	
	Path = [fillG5, putG5inG3, emptyG5, ...]
*/

path(FinalState, FinalState, _, []).
path(InitialState, FinalState, Visited, [Mov|Path] ):-
   mov(Mov, InitialState, NewState),
   \+ member(NewState, Visited), /* \+ = not */
   path(NewState, FinalState, [NewState|Visited], Path).
  
