//
//  Box.h
//  Boxes
//
//  Created by hunkar lule on 2018-08-14.
//  Copyright © 2018 hunkar lule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

# pragma mark - Public properties
@property float height;
@property float length;
@property float width;

# pragma mark - Public Methods
- (instancetype) initWithLength:(float) length andWidth:(float) width andHeight:(float) height;
- (float) calculateBoxVolume;
- (int) calculateNumberOfBoxes:(Box *) insideBox;

@end


