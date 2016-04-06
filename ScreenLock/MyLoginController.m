//
//  MyLoginController.m
//  TalkToSelf
//
//  Created by rust_33 on 16/3/25.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "MyLoginController.h"
#import "baseView.h"
#import "MySecretManager.h"
#import "MyPassworeSettingController.h"

@interface MyLoginController ()<touchEnded>

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerButtonBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginButtonBottom;
- (IBAction)userRegister:(id)sender;
- (IBAction)login:(id)sender;


@end

@implementation MyLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationController.navigationBarHidden = YES;
    
    _registerButton.layer.cornerRadius = 10.0;
    _registerButton.layer.masksToBounds = YES;
    //_registerButton.layer.borderWidth = 2.0;
    //_registerButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //_forgetButton.layer.borderWidth = 2.0;
    //_forgetButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _loginButton.layer.cornerRadius = 10.0;
    _loginButton.layer.masksToBounds = YES;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)userRegister:(id)sender {
    
    if (![MySecretManager getPassword]) {
        MyPassworeSettingController *rc = [[MyPassworeSettingController alloc] init];
        [self presentViewController:rc animated:YES completion:nil];
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"已存在账户" message:@"账户已存在！" delegate:self cancelButtonTitle:@"知道啦！" otherButtonTitles:nil];
        [alertView show];
    }

}

- (IBAction)login:(id)sender {
    
    _loginButton.hidden = YES;
    _registerButtonBottom.constant = 20;

    baseView *MyBaseView = [[baseView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-80-self.view.frame.size.width, self.view.frame.size.width, self.view.frame.size.width)];
    MyBaseView.touchView.delegate = self;
    [self.view addSubview:MyBaseView];
    
    [self.view layoutIfNeeded];
}

#pragma delegate
- (void)touchEndedWithCode:(NSString *)code
{
    NSString *rightCode = [MySecretManager getPassword];
    if (rightCode) {
        if ([code isEqualToString:rightCode]) {
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"密码正确" message:@"" delegate:self cancelButtonTitle:@"知道啦！" otherButtonTitles: nil];
            [alert show];
        }else
        {
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"密码错误" message:@"请输入正确的密码" delegate:self cancelButtonTitle:@"知道啦！" otherButtonTitles: nil];
            [alert show];
        }
    }else
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"密码不存在" message:@"请先设置密码" delegate:self cancelButtonTitle:@"知道啦！" otherButtonTitles: nil];
        [alert show];
    }
}

@end





