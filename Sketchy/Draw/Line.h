//
//  Line.h
//  CaplessPaint
//
//  Created by Rıfat Ordulu on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Line : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic, retain) UIColor *color;

@end
