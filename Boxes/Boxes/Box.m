//
//  Box.m
//  Boxes
//
//  Created by hunkar lule on 2018-08-14.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import "Box.h"

@implementation Box
# pragma mark - Initializer
- (instancetype) initWithLength:(float)length andWidth:(float)width andHeight:(float)height {
    self = [super init];
    if(self) {
        self.length = length;
        self.width = width;
        self.height = height;
    }
    return self;
}

# pragma mark - Methods
- (float) calculateBoxVolume {
    float volume = 0;
    volume = self.length * self.width * self.height;
    return volume;
}

- (int)calculateNumberOfBoxes:(Box *)insideBox {
    float volumeOfOutsideBox = [self calculateBoxVolume];
    float volumeOfInsideBox = [insideBox calculateBoxVolume];
    return (int)(volumeOfOutsideBox / volumeOfInsideBox);
}

@end
