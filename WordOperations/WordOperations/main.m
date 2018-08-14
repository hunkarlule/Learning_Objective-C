//
//  main.m
//  WordOperations
//
//  Created by hunkar lule on 2018-08-13.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

void upperCase(NSString *);
void lowerCase(NSString *);
void convertToNumber(NSString *);
BOOL isNumeric(NSString *);
void makeCanadianize(NSString *);
void respondToText(NSString *);
void deSpaceText(NSString *);
NSString * getStringFromUser(void);
void makeWordOperations(NSString *);
void showOperationOptions(void);

enum operationOptions {
    toUpperCase = 1,
    toLowerCase = 2,
    toConvertNumber = 3,
    toMakeCanadianize = 4,
    toRespondToText = 5,
    toDeSpaceText = 6,
    toExit = 0
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString = getStringFromUser();
        makeWordOperations(inputString);
    }
    return 0;
}

void makeWordOperations(NSString *inputString) {
    BOOL isUserAction = YES;
    char ch = EOF;
    // ch = getchar();
    while(isUserAction) {
        showOperationOptions();
        while (ch != EOF && (ch = getchar()) != '\n' ) {; }
        ch = getchar();
        
        switch (ch) {
            case '1':
                upperCase(inputString);
                break;
            case '2':
                lowerCase(inputString);
                break;
            case '3':
                convertToNumber(inputString);
                break;
                
            case '4':
                makeCanadianize(inputString);
                break;
            case '5':
                respondToText(inputString);
                break;
            case '6':
                deSpaceText(inputString);
                break;
            case '0':
                isUserAction = NO;
                break;
            default:
                NSLog(@"Invalid operation, try again!");
                break;
        }
    }
}

NSString * getStringFromUser() {
    char inputChars[255];
    printf("Input a string: ");
    fgets(inputChars, 255, stdin);
    printf("Your string is %s\n", inputChars);
    NSString *inputStringRaw = [NSString stringWithUTF8String:inputChars];
    NSString *inputString = [inputStringRaw substringWithRange:NSMakeRange(0, inputStringRaw.length - 1)];
    return inputString;
}

void upperCase(NSString * str) {
    NSString *newString = [str uppercaseString];
    NSLog(@"%@",newString);
}

void lowerCase(NSString * str) {
    NSString *newString = [str lowercaseString];
    NSLog(@"%@",newString);
}

void convertToNumber(NSString * str) {
    if(isNumeric(str)) {
        NSInteger convertedInteger =[str integerValue];
        NSLog(@"%ld",(long)convertedInteger);
    }
    else
        NSLog(@"'%@' is not valid string to convert integer!",str);
}

BOOL isNumeric(NSString *str){
    NSScanner *sc = [NSScanner scannerWithString: str];
    if ( [sc scanInt:NULL] ){
        return [sc isAtEnd];
    }
    return NO;
}

void makeCanadianize(NSString * str) {
    // NSString *newStr;
    str = [str stringByAppendingString:@", eh?"];
    NSLog(@"%@",str);
}


void respondToText(NSString * str) {
    NSString *lastCharacter = [str substringWithRange:NSMakeRange(str.length - 1, 1)];
    if([lastCharacter isEqualToString:@"?"])
        NSLog(@"I don't know!");
    else if ([lastCharacter isEqualToString:@"!"])
        NSLog(@"Whoa, calm down!");
    else
        NSLog(@"No comment!");
}


void deSpaceText(NSString * str) {
    NSString *newString = [str stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    NSLog(@"%@", newString);
}

void showOperationOptions() {
    NSLog(@"\n************************\n");
    NSLog(@"\nTo make uppercase press %d\nTo make lowercase press %d\nTo convert to number press %d\nTo make Canadianize press %d\nTo respond to text press %d\nTo despace press %d\nTo exit press %d\n", toUpperCase, toLowerCase, toConvertNumber, toMakeCanadianize, toRespondToText, toDeSpaceText, toExit);
    NSLog(@"\n************************\n");
}
