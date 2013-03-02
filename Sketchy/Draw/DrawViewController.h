//
//  TouchDrawViewController.h
//  TouchTracker
//
//  Created by Rıfat Ordulu on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchDrawView.h"
#import "ColorPicker.h"


@class DrawViewController;

@protocol DrawViewControllerDelegate <NSObject>
- (void)drawController:(DrawViewController*)drawController didSaveDrawing:(UIImage*)drawing;
@end

@interface DrawViewController : UIViewController <ColorPickerDelegate>
{
    BOOL isCleared;
    BOOL isSelectedColor;
}

@property (nonatomic, retain) UIImage* initialImage;
@property (nonatomic, strong) NSURL* appCallbackURL;

@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector1;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector2;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector3;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector4;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector5;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector6;

@property (retain, nonatomic) IBOutlet TouchDrawView *drawArea;
@property (retain, nonatomic) IBOutlet UIButton* saveButton;
@end
