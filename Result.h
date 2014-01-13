//
//  Result.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/28/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This object will represent one found word, and it will include information about the board and an array of tiles representing the path of the word.

#import <Foundation/Foundation.h>
#import "Board.h"

@interface Result : NSObject {
    
    NSString *word;
    NSArray *path;
    Board *board;
}

@property NSString *word;
@property NSArray *path;
@property Board *board;

-(id)initWithWord:(NSString *)aWord andPath:(NSArray *)aPath andBoard:(Board *)aBoard;

//These class methods are helpful for creating a searchable database of results.
+(BOOL)doResults:(NSArray *)results containWord:(NSString *)word;
+(Result *)resultFromWord:(NSString *)word inResults:(NSArray *)results;

@end
