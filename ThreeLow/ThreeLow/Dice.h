//
//  Dice.h
//  ThreeLow
//
//  Created by hunkar lule on 2018-08-20.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int faceValue;
@property BOOL isHold;

- (int) rollDice;
- (instancetype)init;

@end
