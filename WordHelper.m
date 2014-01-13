//
//  WordHelper.m
//  Descrambler
//
//  Created by Evan Bernstein on 12/27/13.
//  Copyright (c) 2013 Evan Bernstein. All rights reserved.
//

#import "WordHelper.h"

@implementation WordHelper


-(id)init {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"2of12" ofType:@"txt"]; //2of12 is the default word list
    
    NSString *fileName = [[NSUserDefaults standardUserDefaults] stringForKey:@"Filename"]; //Read the settings to see if there is a preferred list chosen
    
    if (fileName) {
        filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    }
    
    wordsString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]; //The files are all UTF8
    
    wordsArray = [wordsString componentsSeparatedByString:@", "]; //The files are all alphabetized and each word is separated by a comma and a space
    
    return self;
}


-(BOOL)isAWord:(NSString *)word {
    
    return [self binarySearchForWord:word withRange:NSMakeRange(0, wordsArray.count)];
}

-(BOOL)beginsAWord:(NSString *)word {
    
    return [self binarySearchForWordBeginning:word withRange:NSMakeRange(0, wordsArray.count)];
}

//Theses method perform binary searches of the word list array. This is much faster than a standard lookup operation, and it needs to be because it will be likely called hundreds of times in a given run. Both methods take a range so that they can be run recursively on different portions of the word list array.

//This method returns a boolean value representing whether or not the given word exists in the given range.
-(BOOL)binarySearchForWord:(NSString *)word withRange:(NSRange)range {
    
    //If there is only one word in the range (we have drilled down to the final word), check to see if it's the word we're looking for and return the result.
    if (range.length == 1) {
        return [word isEqualToString:[wordsArray objectAtIndex:range.location]];
    }
    
    //Otherwise find the middle word in the array to compare against.
    NSString *compareWith = [wordsArray objectAtIndex:range.location+range.length/2];
    
    NSComparisonResult result = [word compare:compareWith];
    
    NSRange newRange;
    
    switch (result) {
        case NSOrderedSame:
            return YES; //That was lucky! We found the word!
            break;
        case NSOrderedAscending:
            //The word we chose to compare with is later in the alphabet, so we should choose the first half of the range and recurse from there.
            newRange = NSMakeRange(range.location, range.length/2);
            return [self binarySearchForWord:word withRange:newRange];
            break;
        case NSOrderedDescending:
            //The word we chose to compare with is earlier in the alphabet, so we should choose the second half of the range and recurse from there. We have the problem now of the even-numbered word list, in which case we have to correct for there not being an exact middle. Beware OB1 errors!!!
            if (range.length % 2) {
                newRange = NSMakeRange(range.location+range.length/2, 1+range.length/2);
            }
            else {
                newRange = NSMakeRange(range.location+range.length/2, range.length/2);
            }
            return [self binarySearchForWord:word withRange:newRange];
            break;
            
        default:
            break;
    }
}

//This method performs a similar task to the above, the difference being that this one returns YES as long as the given string begins a word in the list. At some point a large portion of these methods should be abstracted out, to make maintainance easier.
-(BOOL)binarySearchForWordBeginning:(NSString *)word withRange:(NSRange)range {
    
    //Same deal as the first one, except that we return YES as long as the final word in the list contains all the letters that the given word does. This could mean that it is, in fact, the word, or it could mean that it is an extension of the word. Either way we want to return YES.
    if (range.length == 1) {
        return [(NSString *)[wordsArray objectAtIndex:range.location] rangeOfString:word].length == word.length;
    }
    
    //The rest of this method is the same as the first, with the exception of the comment below.
    
    NSString *compareWith = [wordsArray objectAtIndex:range.location+range.length/2];
    
    NSComparisonResult result = [word compare:compareWith];
    
    NSRange newRange;
    
    switch (result) {
        case NSOrderedSame:
            return YES;
            break;
        case NSOrderedAscending:
            //Check to see if the compareWith word is actually an extension of the given word, and if so return YES.
            if ([compareWith rangeOfString:word].length == word.length) {
                return YES;
            }
            newRange = NSMakeRange(range.location, range.length/2);
            return [self binarySearchForWordBeginning:word withRange:newRange];
            break;
        case NSOrderedDescending:
            if (range.length % 2) {
                newRange = NSMakeRange(range.location+range.length/2, 1+range.length/2);
            }
            else {
                newRange = NSMakeRange(range.location+range.length/2, range.length/2);
            }
            return [self binarySearchForWordBeginning:word withRange:newRange];
            break;
            
        default:
            break;
    }
}

@end
