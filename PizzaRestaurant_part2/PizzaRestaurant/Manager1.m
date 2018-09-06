//
//  Manager1.m
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-03.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Manager1.h"

@implementation Manager1

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings { 
    for( NSString *topping in toppings)
        if([[topping uppercaseString] isEqualToString:@"ANCHOVIES"]) {
            NSLog(@"\nMANAGER1==>Sorry no pizza with ANCHOVIES\n");
            return NO;
        }
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen { 
    return NO;
}

@end
