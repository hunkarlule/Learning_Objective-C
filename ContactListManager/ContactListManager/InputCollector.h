//
//  InputCollector.h
//  ContactListManager
//
//  Created by hunkar lule on 2018-08-17.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject
@property NSMutableArray *commandHistory;
-(NSString *)inputForPrompt:(NSString *)promptString;
-(void)printCommandHistory;
-(void)printPrompt:(NSString *)inputString;
@end
