//
//  Manager2.h
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-03.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "ManagerDelegate.h"

@interface Manager2 : NSObject <KitchenDelegate>

@property (weak) id <ManagerDelegate> delegate;

@end
