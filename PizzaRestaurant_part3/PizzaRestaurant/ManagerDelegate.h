//
//  ManagerDelegate.h
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ManagerDelegate <NSObject>

- (void)deliverPizza:(Pizza *)pizza;

@end

