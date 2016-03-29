//
//  ViewController.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "ViewController.h"
#import "baseView.h"
#import "codeStore.h"
#import "setCodeViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@property(nonatomic,strong) UIView* baseView;
- (IBAction)setTheCode:(id)sender;
- (IBAction)verifyTheCode:(id)sender;
- (IBAction)modifyCode:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _setCodeViewController=[[setCodeViewController alloc] init];
    _verifyCodeViewController=[[verifyCodeViewController alloc] init];
    _modifyCodeViewController=[[modifyCodeViewController alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setTheCode:(id)sender {
    
    if ([[codeStore sharedStore] hasCode]) {
        
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"alert" message:@"already has code" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [self.navigationController pushViewController:_setCodeViewController animated:YES];
}

- (IBAction)verifyTheCode:(id)sender {
    
    codeStore* store=[codeStore sharedStore];
    
    if (![store hasCode]) {
        
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"alert" message:@"has NO code" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    };
    
    [self.navigationController pushViewController:_verifyCodeViewController animated:YES];
    
}

- (IBAction)modifyCode:(id)sender {
    
    codeStore*store=[codeStore sharedStore];
    
    if (![store hasCode]) {
        
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"alert" message:@"please set code frist" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        
        [alert show];
        return;
    }
    [self.navigationController pushViewController:_modifyCodeViewController animated:YES];
}

-(instancetype)init
{
    self=[super init];
    return self;
}

@end
















