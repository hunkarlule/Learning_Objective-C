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

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            Pizza *newPizza;
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
        
            if([[inputString uppercaseString] isEqualToString:@"PEPPERONI"]) {
                Pizza *newPizza = [restaurantKitchen makeLargePepperoni];
                [restaurantKitchen servePizza:newPizza];
                continue;
            }
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
   
            // And then send some message to the kitchen...
            NSString *pizzaSize =  commandWords[0];
            PizzaSize size;
            if([[pizzaSize uppercaseString] isEqualToString:@"SMALL"])
                size = small;
            else if([[pizzaSize uppercaseString] isEqualToString:@"MEDIUM"])
                size = medium;
            else if([[pizzaSize uppercaseString] isEqualToString:@"LARGE"])
                size = large;
            else {
                NSLog(@"Invalid pizza size. please enter small, medium or large as size");
                continue;
            }
            NSArray *pizzaToppings = [commandWords subarrayWithRange:NSMakeRange(1, ([commandWords count] -1 ))];
            
            if([pizzaToppings count] == 0) {
                NSLog(@"Toppings not found. Please enter toppings for your pizza");
                continue;
            }
            else if ([[pizzaToppings[0] uppercaseString] isEqualToString:@"MEATLOVER"]) {
                newPizza = [restaurantKitchen makeMeatPizzaWithSize:size];
            }
            else
                newPizza = [restaurantKitchen makePizzaWithSize:size  toppings:pizzaToppings];
            [restaurantKitchen servePizza:newPizza];
        }
    }
    return 0;
}

