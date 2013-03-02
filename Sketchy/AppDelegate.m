//
//  AppDelegate.m
//  Sketchy
//
//  Created by Ben Dodson on 3/2/13.
//  Copyright (c) 2013 MobiSocial Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "PasteboardObjUtil.h"
#import "DrawViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[url absoluteString] hasPrefix:kSketchyAppProtocol]) {
        DrawViewController *draw = [[DrawViewController alloc] init];

        UIPasteboard* pasteboard = [UIPasteboard pasteboardWithName:kMobisocialPasteboard create:NO];
        draw.appCallbackURL = [PasteboardObjUtil callbackURLFromPasteboardURL:url];
        // if we were launched to edit a picture, pull it from the pasteboard:
        draw.initialImage = pasteboard.image;
        [pasteboard setItems:nil];

        [self.window.rootViewController presentViewController:draw animated:YES completion:nil];
        return YES;
    }

    return NO;
}

@end
