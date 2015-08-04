//
//  ViewController.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "ViewController.h"
#import "baseView.h"

@interface ViewController ()

@property(nonatomic,strong) UIView* baseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _baseView=[[baseView alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.width)];
    
    self.view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
