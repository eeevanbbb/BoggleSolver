//
//  Board.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "Board.h"

@implementation Board

@synthesize tiles, name;

//The following two methods are necessary for storing board data in the system.
-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.tiles = [aDecoder decodeObjectForKey:@"tiles"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aEncoder {
    [aEncoder encodeObject:tiles forKey:@"tiles"];
    [aEncoder encodeObject:name forKey:@"name"];
}


//Boards should have one and only one tile for each position. The tiles should be ordered left to right, top to bottom.
-(id)initWithTiles:(NSArray *)theTiles {
    
    tiles = theTiles;
    
    return self;
}

//String must be 16 characters long. The string is read into the board from left to right, top to bottom.
-(id)initWithString:(NSString *)string {
    
    NSMutableArray *mutTiles = [[NSMutableArray alloc] init];
    
    NSArray *allPositions = [Position allPositions];
    
    //Create a new tile for each letter and give it a position. For this to work, the allPositions array is ordered from left to right, top to bottom.
    for (int i = 0; i<allPositions.count; i++) {
        
        char letter = [string characterAtIndex:i];
                
        Tile *newTile = [[Tile alloc] initWithPosition:[allPositions objectAtIndex:i] andLetter:letter];
        
        [mutTiles addObject:newTile];
    }
    
    tiles = mutTiles;
    
    return self;
}


-(char)letterForPosition:(Position *)pos {
    
    for (Tile *tile in tiles) {
        
        if ([tile.position isEqualToPosition:pos]) {
            
            return tile.letter;
        }
    }
    
    return '#'; //This is just to make the compiler happy. If the implicit conditions for this class are met, this should never run.
}

-(Tile *)tileForPosition:(Position *)pos {
    
    for (Tile *tile in tiles) {
        
        if ([tile.position isEqualToPosition:pos]) {
            
            return tile;
        }
    }
    
    return nil;
}

@end
