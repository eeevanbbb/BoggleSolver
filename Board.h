//
//  Board.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This object represents a Boggle board. It contains an ordered list of tiles and a name for the board. (The name is only used when saving boards.)

#import <Foundation/Foundation.h>
#import "Tile.h"

//This object conforms the NSCoding protocol so that it can be stored in the system.
@interface Board : NSObject <NSCoding> {
    
    NSArray *tiles;
    
    NSString *name;
}

@property NSArray *tiles;
@property NSString *name;

-(Tile *)tileForPosition:(Position *)pos; //Given a position, return the corresponding tile on the board
-(id)initWithString:(NSString *)string; //An easy way to create a new board given a string of 16 letters that represent the tiles in order

@end
