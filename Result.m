//
//  Result.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/28/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "Result.h"

@implementation Result

@synthesize word, path, board;

-(id)initWithWord:(NSString *)aWord andPath:(NSArray *)aPath andBoard:(Board *)aBoard {
    
    word = aWord;
    path = aPath;
    board = aBoard;
    
    return self;
}

//Does an array of results contain a given word?
+(BOOL)doResults:(NSArray *)results containWord:(NSString *)word {
    
    for (Result *compareWith in results) {
        
        if ([compareWith.word isEqualToString:word]) {
            return YES;
        }
    }
    return NO;
}

//Given a word, find the corresponding result object from an array (result arrays should not have duplicates).
+(Result *)resultFromWord:(NSString *)word inResults:(NSArray *)results {
    
    for (Result *result in results) {
        
        if ([result.word isEqualToString:word]) {
            
            return result;
        }
    }
    return nil;
}

@end
