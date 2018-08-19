//
//  Contact.m
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:self.name];
    [result appendString:@" - "];
    [result appendString:self.email];
    return result;
}

- (instancetype)initWithName:(NSString *)name andEmail:(NSString *)email {
    self = [super init];
    if(self) {
        self.name = name;
        self.email = email;
        self.contactPhones = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
