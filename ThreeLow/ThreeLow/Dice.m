//
//  Dice.m
//  ThreeLow
//
//  Created by hunkar lule on 2018-08-20.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (int)rollDice {
    int value = arc4random_uniform(6) + 1;
    self.faceValue = value;

    return value;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.faceValue = 6;
        self.isHold = NO;
    }
    return self;
}

@end
