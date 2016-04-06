//
//  MyPassworeSettingController.m
//  TalkToSelf
//
//  Created by rust_33 on 16/3/28.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "MyPassworeSettingController.h"
#import "baseView.h"
#import "MySecretManager.h"

@interface MyPassworeSettingController ()<touchEnded>
{
    NSString *password;
    UILabel *label;
}

@end

@implementation MyPassworeSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor grayColor];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, CGRectGetWidth([UIScreen mainScreen].bounds), 30)];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"请绘制密码";
    [self.view addSubview:label];
    
    baseView *MyBaseView = [[baseView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-80-self.view.frame.size.width, self.view.frame.size.width, self.view.frame.size.width)];
    MyBaseView.touchView.delegate = self;
    [self.view addSubview:MyBaseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma delegate
- (void)touchEndedWithCode:(NSString *)code
{

    if (code) {
        if (!password) {
            password = code;
            label.text = @"请再次绘制密码";
        }else
        {
            if ([password isEqualToString:code]) {
                label.text = @"密码设置成功！";
                [MySecretManager savePassword:password];
                    
                [self dismissViewControllerAnimated:YES completion:nil];
            }else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"密码设置失败" message:@"请绘制相同的密码" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [alert show];
                label.text = @"请绘制密码";
                password = nil;
            }
        }
    }
        
}
@end







