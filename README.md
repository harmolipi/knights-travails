# Knights Travails
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/harmolipi/knights-travails)

## Functionality

This is the [Knights Travails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails) project, in which I create an algorithm to calculate and print the shortest path for the Knight chess piece to get from any square on the board to any other square.

## Thoughts

This project was initially quite challenging, since I was thinking about the previous (binary trees) project, and was attempting to implement as many of those techniques as possible. My approach changed a few times, until I finally settled on creating Knight objects for each position we check on the board. It wasn't so bad once I had settled on this approach.

I searched for a solution by creating knights for each move, and iterating through each possible move in a breadth-first manner. As each knight was created, it contained both its own location and the knight that led to it. Once the target square was found, I simply went up the chain until I got to the top, and that was my list of moves.

I finally completed this, but wasn't satisfied. After spending so much time trying to wrap my mind around recursion - and especially in order to traverse data structures - I was disappointed that recursion didn't factor into this one at all. So I added a recursive version of the method that iterates through all of the moves leading to the target square, and added a "recursive" boolean to allow users to easily switch between using the recursive and iterative versions of that method.

I have a feeling that I could probably approach the main #knight_moves method in a recursive manner, but how exactly I could do that without getting overwhelmingly complex escaped me. It might be a challenge to revisit in the future.

God bless.

-Niko Birbilis
