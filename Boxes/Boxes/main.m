//
//  main.m
//  Boxes
//
//  Created by hunkar lule on 2018-08-14.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box * outsideBox = [[Box alloc] initWithLength:12 andWidth:5 andHeight:3];
        float volumeOfOutsideBox = [outsideBox calculateBoxVolume];
        NSLog(@"Volume of Outside Box : %f", volumeOfOutsideBox);
        
        Box * insideBox = [[Box alloc] initWithLength:12 andWidth:5 andHeight:3];
        float volumeOfInsideBox = [insideBox calculateBoxVolume];
        NSLog(@"Volume of Inside Box : %f", volumeOfInsideBox);
        
        int numberOfInsideBox = [outsideBox calculateNumberOfBoxes:insideBox];
        NSLog(@" # of inside boxes in outside box : %d", numberOfInsideBox);
    }
    return 0;
}
