//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager1.h"
#import "Manager2.h"
#import "DeliveryCar.h"




@interface DeliveryService : NSObject <ManagerDelegate>

@property DeliveryCar *deliveryCar;
@property NSMutableArray<Pizza *> *deliveredPizzas;

- (void) displayDeliveredPizzas;
@end


