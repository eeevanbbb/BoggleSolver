//
//  Tile.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This object represents a tile on the board. It contains information about the letter on the tile and its position on the board, and contains some helpful methods for chaining tiles together to form paths (or words).

#import <Foundation/Foundation.h>
#import "Position.h"

@interface Tile : NSObject {
    
    Position *position;
    
    char letter; //To allow for the 'Qu' tile, this should be changed to an NSString*.
}

@property Position *position;
@property char letter;

+(NSString *)tileChainToString:(NSArray *)chain; //Given an array of tiles, return the string their letters form
+(BOOL)doesTileChain:(NSArray *)chain containPosition:(Position *)position; //Does an array of tiles contain one at the given position
-(id)initWithPosition:(Position *)aPosition andLetter:(int)aLetter;
-(id)initWithPosition:(Position *)aPosition; //Allow for path logic independent of letters.

@end
