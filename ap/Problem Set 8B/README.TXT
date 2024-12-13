1. In addition to the required methods, you should also implement a main method 
and a printMatrix() method that will allow you to test your CharMatrix class
separately from the rest of the Chomp program.

2. When the Chomp program calls fillRect and clearRect, it will send numbers that
are friendly to array subscripts.  For example, if it wants to fill the entire
4x7 CharMatrix with 'P', it would call

fillRect(0,0,3,6,'P');

Think about how this will affect your conditional statement in your for loop.