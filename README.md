BoggleSolver
============

This is the puzzle code from my iOS app Descrambler. It solves Boggle boards. Here is a link:

https://itunes.apple.com/us/app/descrambler/id789589023?ls=1&mt=8

The code in this folder comes in the form of 12 files which represent 6 children of the NSObject class, and one text file that is the word list referenced in WordHelper.m. 

The access point for the rest of the app is Solver.h. The rest is imported from there. The Solver object can be initialized with a board, which can be initialized with a String, or, alternatively, with an array of Tiles. The code for generating a random board is nothing special and, since it doesn’t meet the stated needs of the problem, I haven’t included it. Once I (or somebody) adds appropriate distribution of the letters, I will include that code.

The one other big issue I see at this point is the lack of a ‘Qu’ tile. I’ll work on that.


I’m new to GitHub, so I don’t quite understand all of the nuances, but I’ll learn. If you have any questions (or if I’ve left something important out), email me at eeevanbbb@me.com.

Enjoy the yummy codes!