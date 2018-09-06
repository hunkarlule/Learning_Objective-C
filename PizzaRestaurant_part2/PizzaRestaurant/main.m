//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "Manager1.h"
#import "Manager2.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        //NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Manager1 *firstManager ;
        Manager2 *secondManager ;
        
        
        //[restaurantKitchen setDelegate:firstManager];
        //[restaurantKitchen setDelegate:secondManager];
        
        while (TRUE) {
            // Loop forever
            Pizza *newPizza;
            int managerType;
            SEL selector = @selector(kitchenDidMakePizza:);
            BOOL respond = NO;
            BOOL decisionToMakePizza = YES;
            [restaurantKitchen setDelegate:nil];
            
            NSLog(@"Please pick your manager type(1 for Manager1, 2 for Manager2, press any key for no manager):>");
            scanf("%d",&managerType);
            
            switch (managerType) {
                case 1:
                    if (!firstManager) {
                        firstManager = [Manager1 new];
                    }
                    [restaurantKitchen setDelegate:firstManager];
                    respond = [firstManager respondsToSelector:selector];
                    break;
                case 2:
                    if (!secondManager) {
                        secondManager = [Manager2 new];
                    }
                    [restaurantKitchen setDelegate:secondManager];
                    respond = [secondManager respondsToSelector:selector];
                    break;
                default:
                    break;
            }
            
            
            char manager[100];
            fgets (manager, 100, stdin);
            
            NSLog(@"Please pick your pizza size and toppings: >\n");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            NSString *pizzaSize =  commandWords[0];
            PizzaSize size = small;
            if([[pizzaSize uppercaseString] isEqualToString:@"SMALL"])
                size = small;
            else if([[pizzaSize uppercaseString] isEqualToString:@"MEDIUM"])
                size = medium;
            else if([[pizzaSize uppercaseString] isEqualToString:@"LARGE"])
                size = large;
            else {
                if(![[pizzaSize uppercaseString] isEqualToString:@"PEPPERONI"]) {
                    NSLog(@"Invalid pizza size. please enter small, medium or large as size");
                    continue;
                }
            }
            NSArray *pizzaToppings = [commandWords subarrayWithRange:NSMakeRange(1, ([commandWords count] -1 ))];
            
            if(restaurantKitchen.delegate != nil) {
                decisionToMakePizza = [restaurantKitchen.delegate kitchen:restaurantKitchen shouldMakePizzaOfSize:large andToppings:pizzaToppings];
                
                if([restaurantKitchen.delegate kitchenShouldUpgradeOrder:restaurantKitchen])
                    size = large;
            }
            
            if(decisionToMakePizza) {
                if([[inputString uppercaseString] isEqualToString:@"PEPPERONI"]) {
                    Pizza *newPizza = [restaurantKitchen makeLargePepperoni];
                    if(respond)
                        [restaurantKitchen.delegate kitchenDidMakePizza:newPizza];
                    [restaurantKitchen servePizza:newPizza];
                    continue;
                }
                
                if([pizzaToppings count] == 0) {
                    NSLog(@"Toppings not found. Please enter toppings for your pizza");
                    continue;
                }
                else if ([[pizzaToppings[0] uppercaseString] isEqualToString:@"MEATLOVER"]) {
                    newPizza = [restaurantKitchen makeMeatPizzaWithSize:size];
                }
                else {
                    newPizza = [restaurantKitchen makePizzaWithSize:size  toppings:pizzaToppings];
                    if(respond)
                        [restaurantKitchen.delegate kitchenDidMakePizza:newPizza];
                    [restaurantKitchen servePizza:newPizza];
                }
            }
        }
    }
    return 0;
}

