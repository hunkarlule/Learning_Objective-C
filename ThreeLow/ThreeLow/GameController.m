//
//  GameController.m
//  ThreeLow
//
//  Created by hunkar lule on 2018-08-20.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dices =[[NSMutableArray alloc] init];
        self.numberOfRolls = 0;
        self.lowestScore = 31;
    }
    return self;
}

- (BOOL)holdDie {
    
    NSString *indexes = [self inputForPrompt:@"Enter dice numbers to hold/unhold"];
    NSArray<NSString *> *indexArray = [indexes componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    indexArray = [indexArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    BOOL trueIndexCounter = NO;
    for(NSString *s in indexArray) {
        //if ([s integerValue] > 0 && [s integerValue] < 6) {
        BOOL test = [s rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound;
        if (test && [s integerValue] > 0 && [s integerValue] < 6) {
            trueIndexCounter = YES;
            if([self.dices[[s integerValue] - 1] isHold])
                [self.dices[[s integerValue] - 1] setIsHold:NO];
            else
                [self.dices[[s integerValue] - 1] setIsHold:YES];
        }
    }
    if(!trueIndexCounter) {
        NSLog(@"Invalid selection, please try again!");
    }
    return trueIndexCounter;
}

- (void)resetDice {
    for(Dice * d in self.dices) {
        [d setIsHold:NO];
        [d setFaceValue:6];
    }
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    NSLog(@"%@", promptString);
    char inputChars[255];
    printf(">>");
    fgets(inputChars, 255, stdin);
    //printf("Your string is %s\n", inputChars);
    NSString *inputStringRaw = [NSString stringWithUTF8String:inputChars];
    inputStringRaw = [inputStringRaw stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return inputStringRaw;
}

- (void)showDices {
    NSMutableString *string =[[NSMutableString alloc] initWithString:@"{"];
    for(int i = 0; i < 5; i++) {
        //NSLog(@"==>%d", d.faceValue);
        switch ([self.dices[i] faceValue]) {
            case 1:
                [self.dices[i] isHold] ? [string appendString:@"[1️⃣],"] : [string appendString:@"1️⃣,"];
                break;
            case 2:
                [self.dices[i] isHold] ? [string appendString:@"[2️⃣],"] : [string appendString:@"2️⃣,"];
                
                break;
            case 3:
                [self.dices[i] isHold] ? [string appendString:@"[3️⃣],"] : [string appendString:@"3️⃣,"];
                
                break;
            case 4:
                [self.dices[i] isHold] ? [string appendString:@"[4️⃣],"] : [string appendString:@"4️⃣,"];
                break;
            case 5:
                [self.dices[i] isHold] ? [string appendString:@"[5️⃣],"] : [string appendString:@"5️⃣,"];
                break;
            case 6:
                [self.dices[i] isHold] ? [string appendString:@"[6️⃣],"] : [string appendString:@"6️⃣,"];
                break;
            default:
                NSLog(@"Invalid face Value!");
                break;
        }
    }
    NSRange lastComma = [string rangeOfString:@"," options:NSBackwardsSearch];
    NSString* lastString = [string stringByReplacingCharactersInRange:lastComma
                                                           withString: @"}"];
    NSLog(@"%@", lastString);
}

- (BOOL)checkEndOfGame{
    for(Dice *d in self.dices) {
        if(!d.isHold)
            return YES;
    }
    NSLog(@"All Dices are HOLD!");
    int playerScore = [self calculatePlayerScore];
    if(playerScore < self.lowestScore) {
        NSLog(@"Congrats, you beat the minimum score! New record is %d", playerScore);
        [self setLowestScore:playerScore];
    }
    //[self showScore];
    NSString *decisonToPlayAgain = [self inputForPrompt:@"Do you want to play again?(press'Y' for yes / press any other key for'No'"];
    if([[decisonToPlayAgain uppercaseString] isEqualToString:@"Y"]) {
        [self resetDice];
        NSLog(@"Minumum score to beat is: %d", self.lowestScore);
        self.numberOfRolls = 0;
        return YES;
    }
    return NO;
}

- (void)showScore {
    NSLog(@"Your Score is %d", [self calculatePlayerScore]);
}

- (int) calculatePlayerScore {
    int playerScore = 0;
    for(Dice * d in self.dices)
        if(d.isHold && d.faceValue != 3)
            playerScore += d.faceValue;
    return playerScore;
}

- (void)cheatToWin {
    for(Dice *d in self.dices) {
        if(d.isHold == NO)
            [d setFaceValue:3];
    }
}

- (void) rollAllDices {
    for(Dice *d in self.dices) {
        if(d.isHold == NO)
            [d rollDice];
    }
}

- (GameController *) setGame {
    NSLog(@"Minumum score to beat is: %d", self.lowestScore);
    for(int i = 0; i < 5; i++)
        [self.dices addObject:[[Dice alloc] init]];
    return self;
}

- (GameController *) newGame {
    GameController *newController = [[GameController alloc] init];
    newController = [newController setGame];
    return newController;
}

@end
