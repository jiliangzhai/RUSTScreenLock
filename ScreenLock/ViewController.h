//
//  ViewController.h
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "setCodeViewController.h"
#import "verifyCodeViewController.h"
#import "modifyCodeViewController.h"

@interface ViewController : UIViewController

@property(nonatomic,strong) setCodeViewController* setCodeViewController;
@property(nonatomic,strong) verifyCodeViewController* verifyCodeViewController;
@property(nonatomic,strong) modifyCodeViewController* modifyCodeViewController;

@end

