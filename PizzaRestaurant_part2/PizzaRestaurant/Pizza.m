//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

-(PizzaSize)getSize {
    return self.size;
}

-(NSArray *)getToppings {
    return self.toppings;
}

- (instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    self = [super init];
    if (self) {
        self.size = size;
        self.toppings = toppings;
    }
    return self;
}


+ (Pizza *)largePepperoni {
    NSArray *toppings = @[@"pepperoni"];
    Pizza *p = [[Pizza alloc] initWithSize:large andToppings:toppings];
    return p;
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size {
    NSArray *toppings = @[@"meat"];
    Pizza *p = [[Pizza alloc] initWithSize:size andToppings:toppings];
    return p;
}

- (NSString *)description
{
    NSString* toppingsString = [self.toppings componentsJoinedByString:@","];
    return [NSString stringWithFormat:@"{Size:%@ Toppings:%@}", myValueString(self.size), toppingsString];
}
@end
