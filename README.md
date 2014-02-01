BoggleSolver
============

UPDATE 1.1:

If you haven’t read the rest of this README before, read that, then come back up here. In this update I’ve added functionality for the ‘Qu’ tile (replacing the ‘Q’ tile). I’ve also integrated Sam’s approach to generating a random boggle board by rolling virtual dice. The method that handles that is in a separate file, out of context, because the rest of the file is not ready for display. I’ve yet to package this update for the App Store (it will be version 1.1), but I will once it’s been adequately tested.

============

This is the puzzle code from my iOS app Descrambler. It solves Boggle boards. Here is a link:

https://itunes.apple.com/us/app/descrambler/id789589023?ls=1&mt=8

The code in this folder comes in the form of 12 (UPDATE: now 13) files which represent 6 children of the NSObject class, and one text file that is the word list referenced in WordHelper.m. 

The access point for the rest of the app is Solver.h. The rest is imported from there. The Solver object can be initialized with a board, which can be initialized with a String, or, alternatively, with an array of Tiles. The code for generating a random board is nothing special and, since it doesn’t meet the stated needs of the problem, I haven’t included it. Once I (or somebody) adds appropriate distribution of the letters, I will include that code. (UPDATE: Added)

The one other big issue I see at this point is the lack of a ‘Qu’ tile. I’ll work on that. (UPDATE: Fixed)


I’m new to GitHub, so I don’t quite understand all of the nuances, but I’ll learn. If you have any questions (or if I’ve left something important out), email me at eeevanbbb@me.com.

Enjoy the yummy codes!