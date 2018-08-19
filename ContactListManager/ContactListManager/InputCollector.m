//
//  InputCollector.m
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commandHistory = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    NSLog(@"%@", promptString);
    char inputChars[255];
    printf(">>");
    fgets(inputChars, 255, stdin);
    //printf("Your string is %s\n", inputChars);
    NSString *inputStringRaw = [NSString stringWithUTF8String:inputChars];
    inputStringRaw = [inputStringRaw stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return inputStringRaw;
}

- (void)printCommandHistory {
    NSLog(@"Last 3 commands are:\n");
    for(unsigned long i = [self.commandHistory count] <= 3 ? 0: [self.commandHistory count] -  3; i < [self.commandHistory count]; i++) {
        NSLog(@"%@\n", self.commandHistory[i]);
    }
}

-(void)printPrompt:(NSString *)inputString {
    NSLog(@"%@", inputString);
}
@end
