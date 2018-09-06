//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.deliveredPizzas = [[NSMutableArray alloc] init];
        self.deliveryCar= [[DeliveryCar alloc] init];
    }
    return self;
}

- (void)deliverPizza:(Pizza *)pizza {
    [self.deliveredPizzas addObject:pizza];
    [self.deliveryCar deliverPizza:pizza];
}

- (void) displayDeliveredPizzas {
    NSLog(@"\nHISTORY OF DELIVERED PIZZAS\n");
    for(Pizza *pizza in self.deliveredPizzas)
        NSLog(@"%@\n", pizza);
}

@end
