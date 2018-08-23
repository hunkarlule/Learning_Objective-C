//
//  main.m
//  ThreeLow
//
//  Created by hunkar lule on 2018-08-20.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameController *gameController = [[GameController alloc] init];
        [gameController setGame];
    
        BOOL isGameContinue = YES;
        
        while(isGameContinue) {
            NSString *myString = [gameController inputForPrompt:@"Please enter a command:\nroll\nreset\nquit\nnewgame"];
            if([[myString uppercaseString] isEqualToString:@"ROLL"]) {
                if(gameController.numberOfRolls == 5) {
                    NSLog(@"maximum roll limit is reached, please RESET to continue!");
                    continue;
                }
                
                gameController.numberOfRolls++;
                [gameController rollAllDices];
                
                [gameController showDices];
                BOOL realIndexChosen = NO;
                while(!realIndexChosen) {
                    realIndexChosen = [gameController holdDie];
                }
                    
                [gameController showDices];
                NSLog(@"# of rolls taken since last reset: %d",gameController.numberOfRolls);
                [gameController showScore];
                isGameContinue = [gameController checkEndOfGame];
            }
            else if([[myString uppercaseString] isEqualToString:@"RESET"]) {
                [gameController setNumberOfRolls:0];
                [gameController resetDice];
                [gameController showDices];
                [gameController showScore];
            }
            else if([[myString uppercaseString] isEqualToString:@"ROLLL"]) {
                
                if(gameController.numberOfRolls == 5) {
                    NSLog(@"maximum roll limit is reached, please RESET to continue!");
                    continue;
                }
                
                gameController.numberOfRolls++;
                [gameController cheatToWin];
                [gameController showDices];
                BOOL realIndexChosen = NO;
                while(!realIndexChosen) {
                    realIndexChosen = [gameController holdDie];
                }
                
                [gameController showDices];
                NSLog(@"# of rolls taken since last reset: %d",gameController.numberOfRolls);
                [gameController showScore];
                isGameContinue = [gameController checkEndOfGame];
            }
            else if([[myString uppercaseString] isEqualToString:@"NEWGAME"]) {
                gameController = [gameController newGame];
                //isGameContinue = NO;
            }
            else if([[myString uppercaseString] isEqualToString:@"QUIT"]) {
                NSLog(@"Unfinished, Game is closing");
                isGameContinue = NO;
            }
            else {
                NSLog(@"Invalid command, please try again.");
            }
        }
    }
    return 0;
}
