//
//  WordHelper.h
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

//This class will handle all interaction with the word list files. On initialization, it will read the settings and determine which word list to load.

#import <Foundation/Foundation.h>

@interface WordHelper : NSObject {
    
    NSString *wordsString; //The word list text file read as an NSString. Looking at it now, this can just be a local variable in the method in which it is used.
    
    NSArray *wordsArray; //An NSArray containing each individual word in the list
}

-(BOOL)isAWord:(NSString *)word; //Is the given string in the word list?
-(BOOL)beginsAWord:(NSString *)word; //Does the given string begin a word in the word list?

@end
