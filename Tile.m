//
//  Tile.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize position;
@synthesize letter;

//The following two methods are necessary for storing board data in the system.
-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.position = [aDecoder decodeObjectForKey:@"position"];
        self.letter = [aDecoder decodeObjectForKey:@"letter"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aEncoder {
    [aEncoder encodeObject:position forKey:@"position"];
    [aEncoder encodeObject:letter forKey:@"letter"];
}


-(id)initWithPosition:(Position *)aPosition andLetter:(NSString *)aLetter {
    
    position = aPosition;
    letter = aLetter;
    
    return self;
}

-(id)initWithPosition:(Position *)aPosition {
    
    position = aPosition;
    
    return self;
}

//This will be useful in determining if an array of tiles makes a word, or if it makes the beginning of a word (and we should therefor continue pursuing possible continuations of the path).
+(NSString *)tileChainToString:(NSArray *)chain {
    
    NSString *word = @"";
    
    for (int i = 0; i<chain.count; i++) {
        
        word = [word stringByAppendingString:[(Tile *)[chain objectAtIndex:i] letter]];
    }
    
    return word;
}

//This will help ensure that each tile is only used once per path.
+(BOOL)doesTileChain:(NSArray *)chain containPosition:(Position *)position {
    
    for (Tile *tile in chain) {
        
        if ([tile.position isEqualToPosition:position]) {
            
            return YES;
        }
    }
    
    return NO;
}

@end
