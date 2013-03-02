//
//  ColorPicker.h
//  CaplessPaint
//
//  Created by Rıfat Ordulu on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorPickerDelegate <NSObject>
@optional
-(void) aColorPickerIsSelected: (UIColor *) color;
@end

@interface ColorPicker : UIView

@property (nonatomic, assign) id <ColorPickerDelegate> delegate;

@end
