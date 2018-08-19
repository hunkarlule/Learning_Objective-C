//
//  ContactList.m
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addContact:(Contact *)newContact {
    [self.contactList addObject:newContact];
}

- (void)listContacts {
    int contactId = 0;
    for( Contact *contact in self.contactList) {
        NSLog(@"%03d: %-20@ %@\n", contactId, contact.name, contact.email);
        contactId++;
        if([contact.contactPhones count]) {
            NSLog(@"   Contact phones are:");
            [self listContactPhones:contact];
        }
    }
}

- (void)showContact:(int)index {
    if((index < [self.contactList count]) && (index >= 0))
        NSLog(@"%@",[self.contactList objectAtIndex:index]);
    else
        NSLog(@"There is no contact for given index, please try another index.!");
}

- (void)findContacts:(NSString *)textToSearch {
    int contactCounter = 0;
    for (Contact *contact in self.contactList) {
        if([contact.name containsString:textToSearch] || [contact.email containsString:textToSearch]) {
            NSLog(@"%-20@ %@\n", contact.name, contact.email);
            contactCounter++;
        }
    }
    
    if(!contactCounter) {
        NSLog(@"No contact found for '%@'", textToSearch);
    }
}

- (int)checkDuplictateContact:(NSString *)email {
    int presentContactCounter = 0;
    for( Contact *contact in self.contactList) {
        if([[contact.email uppercaseString] isEqualToString:[email uppercaseString]]) {
            presentContactCounter++;
            break;
        }
    }
    if(presentContactCounter) {
        NSLog(@"'%@' is alread in your contact list!", email);
        return -1;
    }
    return 0;
}

- (Contact *)getContactByEmail:(NSString *)email {
    for(Contact *contact in self.contactList) {
        if([[contact.email uppercaseString] isEqualToString:[email uppercaseString]])
            return contact;
    }
    return nil;
}

- (void)listContactPhones:(Contact *)contact {
    // Contact *contact = [self getContactByEmail:contactEmail];
    for(Phone *phone in contact.contactPhones) {
        NSLog(@"   %-10@ - %@\n", phone.phoneLabel, phone.phoneNumber);
    }
}

@end
