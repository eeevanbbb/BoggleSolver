//This code is contained within the ViewController class which controls the main window of the app. Including the whole file would require much more cleaning/comments, and it’s not relevant to the puzzle solving aspect anyway, so I’ve left it out for now. Except for this. This is new code. The following method is based on Sam’s program to generate random Boggle grids. This is better than what I was doing before because it stays true to the Boggle game by rolling virtual dice and placing them randomly in the grid. (Before, I was just taking a random letter for each position, all probabilities equal. Obviously, this is better.) From there, my method which assigns letters to Boggle tiles rolls each die once and assigns it to a random position, making sure to assign each die once and only once to each position.

-(NSString *)rollBoggleDie:(int)die {
    
    NSString *letters = @"";
    
    switch (die) {
        case 1:
            letters=@"aaeegn";
            break;
        case 2:
            letters=@"elrtty";
            break;
        case 3:
            letters=@"aoottw";
            break;
        case 4:
            letters=@"abbjoo";
            break;
        case 5:
            letters=@"ehrtvw";
            break;
        case 6:
            letters=@"cimotu";
            break;
        case 7:
            letters=@"distty";
            break;
        case 8:
            letters=@"eiosst";
            break;
        case 9:
            letters=@"delrvy";
            break;
        case 10:
            letters=@"achops";
            break;
        case 11:
            letters=@"himnqu";
            break;
        case 12:
            letters=@"eeinsu";
            break;
        case 13:
            letters=@"eeghnw";
            break;
        case 14:
            letters=@"affkps";
            break;
        case 15:
            letters=@"hlnnrz";
            break;
        case 16:
            letters=@"deilrx";
            break;
            
        default:
            break;
    }
    
    int index = arc4random() % 6;
    
    NSString *letter = [letters substringWithRange:NSMakeRange(index, 1)];
    
    if ([letter isEqualToString:@"q"]) {
        letter = @"qu";
    }
    
    return letter;
}