//
//  ContactList.h
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contactList;

- (void) addContact: (Contact *) newContact;
- (void) showContact: (int) index;
- (void) listContacts;
- (void) findContacts: (NSString *)textToSearch;
- (int) checkDuplictateContact: (NSString *)email;
- (Contact *) getContactByEmail: (NSString *)email;
- (void)listContactPhones:(Contact *)contact;
@end
