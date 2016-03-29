//
//  setCodeViewController.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "setCodeViewController.h"

@interface setCodeViewController ()<touchEnded>

@end

@implementation setCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _baseView=[[baseView alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.width)];
    _baseView.operation=set;
    _baseView.touchView.delegate=self;
        
    self.view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_baseView];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)touchEnded
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
