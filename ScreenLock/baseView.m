//
//  baseView.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "baseView.h"

@interface baseView ()
{
    CGFloat radius;
}

@end

@implementation baseView

-(instancetype) initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        radius=frame.size.width/9.5;
        CGFloat mariginUpDown=(frame.size.height-7.5*radius)/2.0;
        
        _rects=[[NSMutableArray alloc] init];
        
        //确定九个rect的位置，为后面绘制底层图案做准备。
        for (int i=0; i<9; i++) {
            
            int shang=i/3;
            int yu=i%3;
            
            CGRect rect=CGRectMake(radius+yu*2.75*radius, mariginUpDown+shang*2.75*radius, 2*radius, 2*radius);
            
            NSValue* value=[NSValue valueWithCGRect:rect];
            
            [_rects addObject:value];
        }
    }
    
    //touchView作为绘制层，baseView作为底层，两层构成底层白底高亮绿色效果。
    _touchView=[[touchView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _touchView.radius=radius;
    _touchView.rects=[_rects copy];
    [self addSubview:_touchView];
    
    return self;
}

//绘制底层白圈
-(void) drawRect:(CGRect)rect
{
    UIBezierPath* path=[[UIBezierPath alloc] init];
    
    for (int i=0; i<9; i++) {
        
        NSValue* value=_rects[i];
        CGRect rect=[value CGRectValue];
        
        //里外两层圈，用不同的线宽
        [path moveToPoint:CGPointMake(rect.origin.x+2*radius, rect.origin.y+radius)];
        
        [path addArcWithCenter:CGPointMake(rect.origin.x+radius, rect.origin.y+radius) radius:radius startAngle:0
                      endAngle:M_PI*2 clockwise:YES];
        
        [path moveToPoint:CGPointMake(rect.origin.x+radius+3, rect.origin.y+radius)];
        [path addArcWithCenter:CGPointMake(rect.origin.x+radius, rect.origin.y+radius) radius:3 startAngle:0
                      endAngle:M_PI*2 clockwise:YES];
    }
    
    [[UIColor whiteColor] setStroke];
    path.lineWidth=6.0;
    
    [path stroke];
}


-(NSString*) theCode
{
    if (self.operation!=set) {
        
        return [[_touchView theCode] copy];
    }
    return nil;
}
@end





















