//
//  Position.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This object is a simple position object for a 2D grid. It contains row and column information, in addition to some helpful methods for implementing path logic.

#import <Foundation/Foundation.h>

@interface Position : NSObject {
    
    int row;
    int col;
}

@property int row;
@property int col;

//Although unnecessary for the path logic itself, this simple enumeration helps with implementing the arrow graphics which relay path information to the user.
typedef enum directions
{
    UP_LEFT,
    UP,
    UP_RIGHT,
    RIGHT,
    DOWN_RIGHT,
    DOWN,
    DOWN_LEFT,
    LEFT
} Direction;

-(BOOL)isEqualToPosition:(Position *)aPos; //Simple positional equality
-(NSArray *)allPossibleNeighbors; //Finds all valid neighbors for the position
+(NSArray *)allPositions; //An array containing all the positions in a 4x4 grid
+(Position *)positionWithRow:(int)aRow andCol:(int)aCol; //A class method to quickly create new positions
-(Direction)directionToPosition:(Position *)pos; //Returns the direction to a given position


@end
