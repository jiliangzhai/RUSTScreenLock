//
//  modifyCodeViewController.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "modifyCodeViewController.h"
#import "codeStore.h"

@interface modifyCodeViewController ()<touchEnded,UIAlertViewDelegate>

@end

@implementation modifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _baseView=[[baseView alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.width)];
    _baseView.operation=modify;
    _baseView.touchView.delegate=self;
    
    CGRect rect=self.view.bounds;
    _label=[[UILabel alloc] initWithFrame:CGRectMake(0, 100, rect.size.width, 20)];
    _label.text=@"please verify the code frist";
    _label.textAlignment=NSTextAlignmentCenter;
    _step=step1;
    
    self.view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_baseView];
    [self.view addSubview:_label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void) touchEnded
{
    NSString* code=[_baseView theCode];
    
    codeStore* store=[codeStore sharedStore];
    
    if (_step==step1) {
        
        if ([store verifyTheCode:code]) {
            
            _label.text=@"please set new code";
            
            _step=step2;
            
            return;
        
    }
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"alert" message:@"the wrong code" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    [store setCode:code];
    
    _label.text=@"please verify the code frist";
    _step=step1;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end

















