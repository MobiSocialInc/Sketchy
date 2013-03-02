//
//  ViewController.m
//  Sketchy
//
//  Created by Ben Dodson on 3/2/13.
//  Copyright (c) 2013 MobiSocial Inc. All rights reserved.
//

#import "ViewController.h"
#import "DrawViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDrawing:(id)sender {
    DrawViewController* draw = [[DrawViewController alloc] init];
    [self presentViewController:draw animated:YES completion:nil];
}

@end
