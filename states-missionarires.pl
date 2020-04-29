
/*
  State Problem
  
  Missionaries and Cannibals
  
  1. Tree Missionaires and 3 cannibales in right side
     of the river
  2. Only one boat with capacity for two people
  3. At any side of the river, the number of Cannibals
     can not be higher than the number of Missionaires
	  
	Solution: 	
  [move(1,1,left),
   move(1,0,right),
   move(0,2,left),
   move(0,1,right),
   move(2,0,left),
   move(1,1,right),
   move(2,0,left),
   move(0,1,right),
   move(0,2,left),
   move(1,0,right),
   move(1,1,left)]
   
   
	 #Cannibals =< #Missionaries 
	 
	 Otherwise Cannibals can eat the Missionaries
	
    State Problem
	
	1. State
	
	First approach
	state(ML, CL, MR, CR, Boat).
	
	Second approach
	state(ML, CL, Boat).
	
	MR = 3 - ML
    CR = 3 - CL	
	
	2. Movements
	  2.1. Move one missionaire to the left
	  2.2. Move one cannibal to the left
	  2.3. Move one missionaire to the right
	  2.4. Move one cannibal to the right
	  2.5. Move two missionaire to the left
	  2.6. Move two cannibals to the left
      2.7. Move two missionaire to the right
	  2.8. Move two cannibals to the right
      2.9. Move one mis and one cannibals to the right
      2.10. Move one mis and one cannibals to the left
	  
	  state(ML, CL, Boat).
	  
	First approach  
mov(oneMisLeft, state(ML, CL, right), state(ML2, CL)):-
   MR is 3 - ML,
   MR > 0,
   ML2 is ML + 1. 

   Second approach
*/

   mov(move(M, C, left), state(ML, CL, right), 
     state(ML2, CL2, left)):-
     ML2 is ML + M, ML2 >= 0, ML2 =< 3,
     CL2 is CL + C, CL2 >= 0, CL2 =< 3.

   mov(move(M, C, right), state(ML, CL, left), 
     state(ML2, CL2, right)):-
     ML2 is ML - M, ML2 >= 0, ML2 =< 3, 
     CL2 is CL - C, CL2 >= 0, CL2 =< 3.	 
	 
   move(1,1,_).
   move(2,0,_).
   move(0,2,_).
   move(1,0,_).
   move(0,1,_).

   not_valid(state(2,3, _)).
   not_valid(state(1,3, _)).
   not_valid(state(1,2, _)).
   not_valid(state(2,1, _)). 
   not_valid(state(1,0, _)).
   not_valid(state(2,0, _)).
  
	
/*	
   3. Path to the solution

   path(+InitialState, +FinalState, +Visited, -Path)
   this is true if Path unify with the listh of
   movements to go from InitialState to FinalState
   witout repeating visited states.
   
   Path = [move(1,0,left), move(1,0, right), ...]
   
   
   Ini  -----------------------> Final
              Path
			  
   Ini -> mov -> Aux
                   ------------> Final
	                    Path
                        N-1
   */
   
   path(Ini, Ini, _, []).
   
   path(Ini, Fin, Visited, [move(M, C, Dir)|Path]):-
     move(M, C, Dir),
     mov(move(M, C, Dir), Ini, Aux),
     \+ not_valid(Aux),
	   \+ member(Aux, Visited),
     path(Aux, Fin, [Aux|Visited], Path).	 
	 
   
