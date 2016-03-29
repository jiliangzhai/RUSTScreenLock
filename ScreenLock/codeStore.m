//
//  codeStore.m
//  ScreenLock
//
//  Created by rust_33 on 15/8/11.
//  Copyright (c) 2015年 rust_33. All rights reserved.
//

#import "codeStore.h"

@implementation codeStore

+(instancetype) sharedStore
{
    static codeStore* sharedStore;
    
    if (!sharedStore) {
        sharedStore=[[self alloc] initPrivate];
    }
    return sharedStore;
}


-(instancetype) initPrivate
{
    self=[super init];
    
    if (self) {
        
         NSString* storedCode=[NSKeyedUnarchiver unarchiveObjectWithFile:[self codePath]];
        
        if (storedCode) {
            
            code=[NSString stringWithString:storedCode];
        }
    }
    
    return self;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"singleton" reason:@"use [codeStore sharedStore]" userInfo:nil];
    return nil;
}

-(NSString*) getCode
{
    return [code copy];
}

-(void) setCode:(NSString *)MyCode
{
    if (code==nil) {
        code=[[NSString alloc] init];
    }
    code=[MyCode copy];
   
    NSString* path=[self codePath];
    
    [NSKeyedArchiver archiveRootObject:code toFile:path];
}

-(BOOL) verifyTheCode:(NSString *)MyCode
{
    if ([code isEqualToString:MyCode]) {
        return YES;
    }
    return NO;
}

-(BOOL) hasCode
{
    if (code!=nil) {
        return YES;
    }
    return NO;
}

-(NSString*) codePath
{
    NSArray* paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString* path=[paths firstObject];
    
    return [path stringByAppendingString:@"code.archive"];
}

@end


































