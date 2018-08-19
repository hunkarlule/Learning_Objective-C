//
//  Phone.m
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-18.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (instancetype)initWithLabel:(NSString *)label andNumber:(NSString *)number {
    self = [super init];
    if(self) {
        self.phoneLabel = label;
        self.phoneNumber = number;
    }
    return self;
}
@end
