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
        self.letter = [aDecoder decodeIntegerForKey:@"letter"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aEncoder {
    [aEncoder encodeObject:position forKey:@"position"];
    [aEncoder encodeInteger:letter forKey:@"letter"];
}


-(id)initWithPosition:(Position *)aPosition andLetter:(int)aLetter {
    
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
    
    char letters[chain.count];
    
    for (int i = 0; i<chain.count; i++) {
        
        letters[i] = [(Tile *)[chain objectAtIndex:i] letter];
    }
    
    //The char array needs a terminating char.
    letters[chain.count] = '\0';
    
    return [NSString stringWithCString:letters encoding:NSASCIIStringEncoding];
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
