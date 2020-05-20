# Next up are generic trees

```prolog
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```
 
We start with a widthpath, this is:
/*
widthPath(+Tree, -List) 
 it is true if List unify with the width path of Tree including only labels
                    
              
                    1
               /    |   \
             2      3     4 
         /  |  \          |
       5   6   7         8
     /  \      |
    9   10     11
  

The idea is, if you want to resolve this tree. Lets put the focus on the list of 2, 3, 4, which are the branches at the trunk of the tree, which is the beginning. So, we need to take all the branches underneath and put them on the same level. 
First we need to take 5 to the first level, and when we take 5 to the same level, the branches which are connected to 5 will go with 5 to the other level. In the following example we will take the branches 5, 6 and 7 and bring them to the same level as 2, 3 and 4. This will be as follows:

                    1
               /    |   \
             2      3     4       5      6     7 
                             |      / \        |
                            8    9   10       11 
     
Now we have a new tree. However, we still have a extra level, a extra level of branches which we need to take out and put on the same level. We need to bring the branches of the level 8, 9, 10 and 11 to the same level, this goes as follows

                    1
               /    |   \
             2      3     4       5      6     7    8    9   10  11 

Now we have the list we want. We now made from 3 separated lists, one usable list. 


           [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]


Lets put the focus on the list of the tree
Next, you need to create a predicate.

       /* Predicate of list of trees */

You will have a widthpath with a level and the list of trees

      1. widthPath( [ t (L, List] ) | Tail] ),    ) :-

Now we have the list and the tail. Now we need to use append. 
So we will write that as follows

       append(List, Tail, R) 
       widthPath(R, R2).
 
And now we need a case for the empty list, so we need to add the label of the empty root so you will write it as follows:

       widthPath([] ,  []) .
       widthPath( [ t (Label, List) ) | Tail] ),  [Label|R2]   ) :-
       
This means, it is number two which will be followed by all the other numbers on the same level of the tree. Now you will have the following list created. 

       /* Predicate of list of trees */

       widthPath( [] ,  [] ) .
       widthPath( [ t (Label, List) ) | Tail] ),  [Label|R2]   ) :-
       append(List, Tail, R) 
       widthPath(R, R2).

Next thing what we need to do is to make another predicate. This will be different because we will use other data. So we start again with a title

/* Predicate of trees */
Now we need to use the original tree we made in order to make another code. 

                     1
               /    |   \
             2      3     4 
         /  |  \          |
       5   6   7         8
     /  \        |
   9   10     11

At the beginning of the code you will start with number 1. Which will be called t:

          */
          Tree5( t(1, 

But then we need to see how many branches number 1 has. As you can see in the tree that begins in line 81, we count 3 branches. Which means we need to add them within the code like this:

               */
              Tree5( t(1, [t (2, ), t(3, []), t(4,  [] ). 

Within the new lists we made (2, 3, 4) we need to do the same thing. This means, we need to look at the branches what branches will follow. For 2, we can see that it is followed by 3 branches, while 3 has 0 branches and 4 only 1. Furthermore, the branches in 2 for example need to be checked as well in order if they have any more branches what needs to be put in the code. As you can see, number 5 has 2 extra branches, 9 and 10. These will need to be put in the code as well, we need to do that as follows.

         */
              Tree5( t(1, [t (2, [t(5, [t(), t()]), t(6, []t), t(7, [t()]) (3, []), t(4, []). 
              
 As you can see, number 5 has 2 extra branches, 9 and 10. And number 7 has 1 extra branch These will need to be put in the code as well, we need to do that as follows.

                
         */
              Tree5( t(1, [t (2, [t(5, [t(9, []), t(10, [])]), t(6, []t), t(7, [t(11, [])]) (3, []), t(4,  [t(8, [] ). 
              
              
Now, you can put it into Prolog, to check if the code is working. If you as the program for example, 
   
         ?- tree5(T).
The program will show you the code you made in line 108. 
If you ask prolog:
       
       ?- listing(widthPath).
       
The program will show the widhPath coding we made in line 70. 

              
 
 
