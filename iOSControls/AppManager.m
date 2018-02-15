//
//  AppManager.m
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 9/12/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager

+ (instancetype)sharedInstance
{
    static AppManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppManager alloc] init];
    });
    return sharedInstance;
}

@end
