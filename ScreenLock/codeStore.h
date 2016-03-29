//
//  codeStore.h
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface codeStore : NSObject
{
    NSString* code;
}

+(instancetype) sharedStore;
-(void) setCode:(NSString*)array;
-(NSString*) getCode;
-(BOOL) verifyTheCode:(NSString*) code;
-(BOOL) hasCode;

@end
