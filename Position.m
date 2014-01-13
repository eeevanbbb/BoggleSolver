//
//  Position.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "Position.h"

@implementation Position

@synthesize row, col;

//The following two methods are necessary for storing board data in the system.
-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.row = [aDecoder decodeIntForKey:@"row"];
        self.col = [aDecoder decodeIntForKey:@"col"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aEncoder {
    [aEncoder encodeInt:row forKey:@"row"];
    [aEncoder encodeInt:col forKey:@"col"];
}


-(id)initWithRow:(int)aRow andCol:(int)aCol {
    
    row = aRow;
    col = aCol;
    
    return self;
}

+(Position *)positionWithRow:(int)aRow andCol:(int)aCol {
    
    return [[Position alloc] initWithRow:aRow andCol:aCol];
}

//A helper method to eliminate positions which extend beyond the board
-(BOOL)isValidPosition {
    
    return row >= 1 && row <= 4 && col >= 1 && col <= 4;
}

-(NSArray *)allPossibleNeighbors {
    
    //An array of all valid AND invalid neighbors
    NSArray *prelim = @[[Position positionWithRow:row-1 andCol:col-1],
                        [Position positionWithRow:row-1 andCol:col],
                        [Position positionWithRow:row-1 andCol:col+1],
                        [Position positionWithRow:row andCol:col-1],
                        [Position positionWithRow:row andCol:col+1],
                        [Position positionWithRow:row+1 andCol:col-1],
                        [Position positionWithRow:row+1 andCol:col],
                        [Position positionWithRow:row+1 andCol:col+1]];
    
    NSMutableArray *neighbors = [prelim mutableCopy];
    
    for (Position *pos in prelim) {
        
        if (![pos isValidPosition]) {
            
            [neighbors removeObject:pos]; //Remove invalid neighbors
        }
    }
    
    return neighbors;
}

-(BOOL)isEqualToPosition:(Position *)aPos {
    
    return row == aPos.row && col == aPos.col;
}

//This can (and should) be abstracted out to allow for different sized boards.
+(NSArray *)allPositions {
    
    NSMutableArray *positions = [[NSMutableArray alloc] init];
    
    for (int r = 1; r<=4; r++) {
        
        for (int c = 1; c<=4; c++) {
            
            [positions addObject:[Position positionWithRow:r andCol:c]];
        }
    }
    
    return positions;
}


-(Direction)directionToPosition:(Position *)pos {
    
    if (row>pos.row) {
        if (col>pos.col) {
            return UP_LEFT;
        }
        else if (col<pos.col) {
            return UP_RIGHT;
        }
        return UP;
    }
    else if (row<pos.row) {
        if (col>pos.col) {
            return DOWN_LEFT;
        }
        else if (col<pos.col) {
            return DOWN_RIGHT;
        }
        return DOWN;
    }
    else if (col>pos.col) {
        return LEFT;
    }
    return RIGHT;
}



@end
