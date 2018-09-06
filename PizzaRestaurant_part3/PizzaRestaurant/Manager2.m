//
//  Manager2.m
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-03.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Manager2.h"

@implementation Manager2

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"\nMANAGER2==>Your UPGRADED pizza is being prepared. Hava a nice meal!");
}

@end
