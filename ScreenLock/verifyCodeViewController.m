//
//  verifyCodeViewController.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "verifyCodeViewController.h"
#import "baseView.h"
#import "codeStore.h"

@interface verifyCodeViewController ()<touchEnded,UIAlertViewDelegate>

@end

@implementation verifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _baseView=[[baseView alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.width)];
    _baseView.operation=verify;
    _baseView.touchView.delegate=self;
    
    self.view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void) touchEnded

{
    NSString* code=[NSString stringWithString:[_baseView theCode]];
    
    codeStore* store=[codeStore sharedStore];
    
    if ([store verifyTheCode:code]) {
        
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"Ok" message:@"successed" delegate:set cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        
        return;
    }

    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"failed" message:@"please try again" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    
    [alert show];
    
}

@end










