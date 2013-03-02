//
//  ViewController.h
//  Sketchy
//
//  Created by Ben Dodson on 3/2/13.
//  Copyright (c) 2013 MobiSocial Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *drawButton;
- (IBAction)startDrawing:(id)sender;
@end
