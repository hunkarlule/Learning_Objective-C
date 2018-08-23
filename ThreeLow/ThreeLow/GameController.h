//
//  GameController.h
//  ThreeLow
//
//  Created by hunkar lule on 2018-08-20.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray *dices;
@property int numberOfRolls;
@property int lowestScore;

- (BOOL) holdDie;
- (void) resetDice;
- (NSString *) inputForPrompt:(NSString *)promptString;
- (void) showDices;
- (BOOL) checkEndOfGame;
- (void) showScore;
- (void) cheatToWin;
- (void) rollAllDices;
- (GameController *) setGame;
- (int) calculatePlayerScore;
- (GameController *) newGame;
@end
