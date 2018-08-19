//
//  Contact.h
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"
@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableArray *contactPhones;

- (instancetype) initWithName:(NSString *)name andEmail:(NSString *)email;
@end
