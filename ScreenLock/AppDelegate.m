//
//  AppDelegate.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/4.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController*vc=[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    UINavigationController* nav=[[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController=nav;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    }

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
