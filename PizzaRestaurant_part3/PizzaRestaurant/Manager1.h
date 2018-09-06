//
//  Manager1.h
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-03.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "ManagerDelegate.h"

@interface Manager1 : NSObject <KitchenDelegate>

@property (weak) id <ManagerDelegate> delegate;

@end
