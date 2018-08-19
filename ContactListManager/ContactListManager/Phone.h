//
//  Phone.h
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-18.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject

@property NSString *phoneLabel;
@property NSString *phoneNumber;

- (instancetype)initWithLabel:(NSString *)label andNumber:(NSString *)number;
@end
