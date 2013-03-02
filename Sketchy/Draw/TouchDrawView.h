//
//  TouchDrawView.h
//  TouchTracker
//
//  Created by Rıfat Ordulu on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Line.h"
@interface TouchDrawView : UIView {
    BOOL isCleared;
}

@property (nonatomic, retain) UIImage* initialImage;

@property (nonatomic) Line * currentLine;
@property (nonatomic) NSMutableArray * linesCompleted;
@property (nonatomic) UIColor *drawColor;
- (void)clearAll;
@end