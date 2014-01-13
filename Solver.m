//
//  Solver.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "Solver.h"
#import "Result.h"

@implementation Solver

@synthesize board;

//On initialization, the Solver instance will instantiate a results array and initialize an instance of the WordHelper class.
-(id)initWithBoard:(Board *)aBoard {
    
    board = aBoard;
    
    results = [[NSMutableArray alloc] init];
    
    wordHelper = [[WordHelper alloc] init];
    
    return self;
}


//This method will take an array of tiles and extend it by one in each valid direction. It will then check to see if each new tile chain represents a valid word. If so, it will add it to the results array. It will then check to see if each tile chain represents the start of a word. If so, it will call itself recursively on each new chain. If not, it will terminate on that strand so as to not pursue paths that cannot yield a word.
-(void)extendChain:(NSArray *)startChain {
    
    //The last tile in the chain (chains must be at least lenght 1)
    Tile *lastTile = [startChain lastObject];
    
    //All the possible neighbors (positions) of that last tile
    NSArray *neighbors = [lastTile.position allPossibleNeighbors];
    
    //Array for all the neighbors (positions) that are not duplicate tiles of those already in the path.
    NSMutableArray *validNeighbors = [[NSMutableArray alloc] init];
    
    for (Position *pos in neighbors) {
        
        if (![Tile doesTileChain:startChain containPosition:pos]) {
            
            [validNeighbors addObject:pos];
        }
    }
    
    //An array that will contain all the valid options (tiles) for the next tile in the chain
    NSMutableArray *nextTileOptions = [[NSMutableArray alloc] init];
    
    //Populate the nextTileOptions array with the corresponding tiles for the positions in validNeighbors
    for (Position *pos in validNeighbors) {
        
        Tile *correspondingTile = [board tileForPosition:pos];
        
        [nextTileOptions addObject:correspondingTile];
    }
    
    //Check each possible new chain
    for (Tile *newTile in nextTileOptions) {
        
        NSArray *possibleNewChain = [startChain arrayByAddingObject:newTile];
        
        NSString *word = [Tile tileChainToString:possibleNewChain];
        
        if ([wordHelper isAWord:word]) {
            
            //Do not bother adding duplicates
            if (![Result doResults:results containWord:word]) {
            
                Result *result = [[Result alloc] initWithWord:word andPath:possibleNewChain andBoard:board];
                [results addObject:result];
                
            }
        }
        
        if ([wordHelper beginsAWord:word]) {
                        
            [self extendChain:possibleNewChain];
        }
    }
}

//This method runs the above method once for each tile in the board, thus trying all that paths that begin at each tile.
-(NSArray *)allResultsForBoard {
    
    for (Position *pos in [Position allPositions]) {
        
        Tile *tile = [board tileForPosition:pos];
        
        [self extendChain:@[tile]];
    }
    
    //Sort the results by length, then alphabetically
    NSArray *sortedResults = [results sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        
        //They're all going to be of the Result class, but this is a fallback
        if (![a isKindOfClass:[Result class]] || ![b isKindOfClass:[Result class]]) {
            return ([a compare:b]);
        }
        else {
            NSString *aString = [(Result *)a word];
            NSString *bString = [(Result *)b word];
            NSUInteger aInt = aString.length;
            NSUInteger bInt = bString.length;
            if (aInt > bInt) {
                return NSOrderedAscending;
            }
            if (aInt < bInt) {
                return NSOrderedDescending;
            }
            else {
                //If they're the same length, fallback to the default compare, which is alphabetical
                return ([aString compare:bString]);;
            }
        }
    }];
    
    return sortedResults;
}

@end
