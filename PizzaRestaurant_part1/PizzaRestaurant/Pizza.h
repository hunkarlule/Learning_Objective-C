//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by hunkar lule on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#define myValueString(enum) [@[@"small",@"medium",@"large"] objectAtIndex:enum]
typedef enum {
    small,
    medium,
    large,
} PizzaSize;


@interface Pizza : NSObject

@property PizzaSize size;
@property NSArray<NSString*> *toppings;

-(PizzaSize) getSize;
-(NSArray<NSString*> *) getToppings;
- (instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings;
+(Pizza *)largePepperoni;
+(Pizza *)meatLoversWithSize:(PizzaSize)size;

@end
