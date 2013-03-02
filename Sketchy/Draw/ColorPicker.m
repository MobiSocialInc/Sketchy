//
//  ColorPicker.m
//  TouchTracker
//
//  Created by Rıfat Ordulu on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorPicker.h"

@implementation ColorPicker
@synthesize delegate;

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    if([delegate respondsToSelector:@selector(aColorPickerIsSelected:)])
        [delegate aColorPickerIsSelected:[self backgroundColor]];
}

@end