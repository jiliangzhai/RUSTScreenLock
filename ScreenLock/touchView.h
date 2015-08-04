//
//  touchView.h
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "touchLine.h"

@interface touchView : UIView
{
    CGPoint currentPoint;
    CGRect currentRect;
    BOOL selected;
}

@property(nonatomic,strong) NSMutableArray* lines;
@property(nonatomic,strong) NSMutableArray* circles;
@property(nonatomic,strong) NSArray* rects;
@property(nonatomic,strong) touchLine* currentLine;
@property(nonatomic) CGFloat radius;

@end
