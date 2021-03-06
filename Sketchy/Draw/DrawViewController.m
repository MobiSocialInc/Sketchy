//
//  TouchDrawViewController.m
//  TouchTracker
//
//  Created by Rıfat Ordulu on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AppDelegate.h"
#import "DrawViewController.h"
#import "GlueStick.h"

#import "Line.h"
#import "TouchDrawView.h"

@implementation DrawViewController

- (id)init {
    self = [super initWithNibName:@"DrawViewController" bundle:nil];
    if (self) {
        isSelectedColor = NO;
        isCleared = NO;
    }
    return self;
}
// This method gets called automatically when the view is created
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_selector1 setDelegate:self];
    [_selector2 setDelegate:self];
    [_selector3 setDelegate:self];
    [_selector4 setDelegate:self];
    [_selector5 setDelegate:self];
    [_selector6 setDelegate:self];
    
    [_saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.drawArea.initialImage = self.initialImage;
    self.initialImage = nil;
}

-(void) aColorPickerIsSelected:(UIColor *)color
{
    [_drawArea setDrawColor:color];
}

-(void)save {
    [self dismissViewControllerAnimated:YES completion:nil];

    _saveButton.hidden = YES;
    _backButton.hidden = YES;
    UIGraphicsBeginImageContextWithOptions(self.drawArea.bounds.size, self.drawArea.opaque, 0.0);
    [self.drawArea.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    if (GlueStick.callbackURL) {
        // Returning data to host via Data Selection API.

        // Share an image:
        [self preparePasteboardWithImage:image];
        
        // Share rich app data:
        //[self preparePasteboardWithData:image];

        // Return to the host application:
        [[UIApplication sharedApplication] openURL:[GlueStick callbackURL]];
    } else {
        // Send to 2Plus
        UIPasteboard* pasteboard = [GlueStick getPlatformPasteboard];
        [pasteboard setPersistent:YES];
        pasteboard.images = [NSArray arrayWithObjects:image, nil];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twoplus://app/content"]];
    }
}

-(void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([GlueStick callbackURL]) {
        UIPasteboard* pasteboard = [GlueStick getPlatformPasteboard];
        [pasteboard setPersistent:YES];
        [pasteboard setItems:nil];
        [[UIApplication sharedApplication] openURL:[GlueStick callbackURL]];
    }
}

-(void) preparePasteboardWithImage:(UIImage*)image {
    UIPasteboard* pasteboard = [GlueStick getPlatformPasteboard];
    pasteboard.image = image;
}

-(void) preparePasteboardWithData:(UIImage*)image {
    UIPasteboard* pasteboard = [GlueStick getPlatformPasteboard];

    RichDeepLink* obj = [[RichDeepLink alloc] init];
    [obj setCallback:kSketchyAppProtocol];
    //[obj setWebCallback:@"http://myapp.com/webhandler/for/image"];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Yayooo" forKey:@"key"];
    [dict setObject:[NSNumber numberWithInt:1337] forKey:@"w00t"];
    [obj setJson:dict];
    [obj setDisplayNoun:@"Sketch" withTitle:@"Sketchy Sketch" withThumbnail:image withCaption:@"Hello, this is a sample post from Sketchy, you can make your own by clicking here. If you dont want to click here, then just ignore this paragraph and do something else."];
    [GlueStick putPasteboardRDL:obj];
}

@end