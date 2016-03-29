//
//  modifyCodeViewController.h
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseView.h"

enum  verifyOrModify
{
    step1,
    step2
    
};

@interface modifyCodeViewController : UIViewController

@property(nonatomic,strong)baseView* baseView;
@property(nonatomic,strong) UILabel* label;
@property(nonatomic) enum verifyOrModify step;

@end
