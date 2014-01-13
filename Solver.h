//
//  Solver.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This object will act as the interface between the graphical view controllers and the puzzle logic. It should be initialized with a board, and will have a single method that returns an array of results for that board.

#import <Foundation/Foundation.h>
#import "Board.h"
#import "WordHelper.h"

@interface Solver : NSObject {
    
    Board *board;
    
    NSMutableArray *results;
    
    WordHelper *wordHelper; //This instance of the WordHelper class will provide interaction with the word list
}

@property Board *board;

-(id)initWithBoard:(Board *)aBoard;
-(NSArray *)allResultsForBoard;

@end
