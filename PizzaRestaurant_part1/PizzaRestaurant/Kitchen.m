//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    return ([[Pizza alloc] initWithSize:size andToppings:toppings]);
}

- (Pizza *)makeLargePepperoni
{
    return ([Pizza largePepperoni]);
}

- (Pizza *)makeMeatPizzaWithSize:(PizzaSize)size {
    return ([Pizza meatLoversWithSize:size]);
}

- (void)servePizza :(Pizza *) pizza {
    NSLog(@"\nPizza==>%@ is ready", pizza);
}
@end
