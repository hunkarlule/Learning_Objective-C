//
//  main.m
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"
#import "Phone.h"

static void createNewContact(ContactList *contactList, InputCollector *input) {
    
    NSString *contactEmail = [input inputForPrompt:@"enter user email"];
    if([contactList checkDuplictateContact:contactEmail])
        return ;
    NSString *contactName = [input inputForPrompt:@"enter user name"];
    
    Contact *newContact = [[Contact alloc] initWithName:contactName andEmail:contactEmail];
    [contactList addContact:newContact];
    
    NSLog(@"%@ has been added successfully  into your contacts", newContact);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *input = [[InputCollector alloc] init];
        ContactList *contactList = [[ContactList alloc] init];
        
        //////////adding some contacts and phones//////////////
        [contactList addContact: [[Contact alloc] initWithName:@"hunkar xxxxxx" andEmail:@"hunkar@gmail.com"]];
        [contactList addContact: [[Contact alloc] initWithName:@"rodrigo yyyyyy" andEmail:@"rodrigo@gmail.com"]];
        [contactList addContact: [[Contact alloc] initWithName:@"anil zzzzzzzz" andEmail:@"anil@gmail.com"]];
        [contactList addContact: [[Contact alloc] initWithName:@"mert qqqqqqq" andEmail:@"mert@gmail.com"]];
        Contact *c = contactList.contactList[0];
        [c.contactPhones addObject: [[Phone alloc] initWithLabel:@"Mobile" andNumber:@"804-604-9955"]];
        [c.contactPhones addObject: [[Phone alloc] initWithLabel:@"Work" andNumber:@"804-604-9956"]];
        [c.contactPhones addObject: [[Phone alloc] initWithLabel:@"Home" andNumber:@"804-604-9957"]];
        Contact *c1 = contactList.contactList[1];
        [c1.contactPhones addObject: [[Phone alloc] initWithLabel:@"Mobile" andNumber:@"805-604-9950"]];
        [c1.contactPhones addObject: [[Phone alloc] initWithLabel:@"Home" andNumber:@"805-604-9951"]];
        
        while(true) {
            NSString *myString = [input inputForPrompt:@"\nnew       - To Add New Contact\nlist      - To List Cotacts\nshow      - To Show a Contact\nfind      - To Find a Contact\nhistory   - To See command history\nphone     - To Add phone to a contact\nphonelist - To List a contact's phone\nexit      - To Exit"];
            [input.commandHistory addObject:myString];
            if ([[myString uppercaseString] isEqualToString: @"NEW"]) {
                createNewContact(contactList, input);
                
            }
            else if ([[myString uppercaseString] isEqualToString: @"LIST"]){
                [contactList listContacts];
            }
            else if ([[myString uppercaseString] isEqualToString: @"EXIT"]){
                [input printPrompt:@"App is closing, please wait!"];
                [NSThread sleepForTimeInterval:3.0f];
                //exit(0);
                break;
            }
            else if ([[myString uppercaseString] isEqualToString: @"SHOW"]){
                NSString *index = [input inputForPrompt:@"enter contact index"];
                if([index isEqualToString:@"0"] || [index intValue] != 0)
                    [contactList showContact:[index intValue]];
                else
                    NSLog(@"Index is invalid, please try again!");
            }
            else if ([[myString uppercaseString] isEqualToString: @"FIND"]){
                NSString *searchText = [input inputForPrompt:@"enter text to search in contacts"];
                [contactList findContacts:searchText];
            }
            else if ([[myString uppercaseString] isEqualToString: @"HISTORY"]){
                [input printCommandHistory];
            }
            else if ([[myString uppercaseString] isEqualToString: @"PHONE"]){
                NSString *contactEmail = [input inputForPrompt:@"enter contact e-mail to add phone"];
                NSString *phoneLabel = [input inputForPrompt:@"enter phone label"];
                NSString *phoneNumber = [input inputForPrompt:@"enter phone number"];
                Contact *contact = [contactList getContactByEmail:contactEmail];
                Phone *newPhone = [[Phone alloc] initWithLabel:phoneLabel andNumber:phoneNumber];
                [contact.contactPhones addObject:newPhone];
            }
            else if ([[myString uppercaseString] isEqualToString: @"PHONELIST"]){
                NSString *contactEmail = [input inputForPrompt:@"enter contantac e-mail to list phones"];
                Contact *contact = [contactList getContactByEmail:contactEmail];
                [contactList listContactPhones:contact];
            }
            else {
                [input printPrompt:@"Wrong command, please try again!"];
            }
        }
    }
    return 0;
}
