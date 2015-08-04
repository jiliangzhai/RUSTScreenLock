//
//  baseView.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "baseView.h"
#import "touchView.h"

@implementation baseView

-(instancetype) initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        radius=frame.size.width/9.5;
        CGFloat mariginUpDown=(frame.size.height-7.5*radius)/2.0;
        
        _rects=[[NSMutableArray alloc] init];
        
        for (int i=0; i<9; i++) {
            
            int shang=i/3;
            int yu=i%3;
            
            CGRect rect=CGRectMake(radius+yu*2.75*radius, mariginUpDown+shang*2.75*radius, 2*radius, 2*radius);
            
            NSValue* value=[NSValue valueWithCGRect:rect];
            
            [_rects addObject:value];
            
            self.backgroundColor=[UIColor clearColor];
            
            //NSLog(@"%f %f",radius,frame.size.width);
        }
        
    }
    
    touchView* View=[[touchView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    View.radius=radius;
    View.rects=[_rects copy];
    [self addSubview:View];
    
    return self;
}


-(void) drawRect:(CGRect)rect
{
    
    UIBezierPath* path=[[UIBezierPath alloc] init];
    
    for (int i=0; i<9; i++) {
        
        NSValue* value=_rects[i];
        CGRect rect=[value CGRectValue];
        
        [path moveToPoint:CGPointMake(rect.origin.x+2*radius, rect.origin.y+radius)];
        
        [path addArcWithCenter:CGPointMake(rect.origin.x+radius, rect.origin.y+radius) radius:radius startAngle:0
                      endAngle:M_PI*2 clockwise:YES];
        
        
    }
    
    [[UIColor whiteColor] setStroke];
    path.lineWidth=1.5;
    
    [path stroke];
    
    
}


@end





















