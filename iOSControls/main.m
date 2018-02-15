//
//  main.m
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 8/8/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *tealeafSDK = NSStringFromClass([TLFApplication class]);
        return UIApplicationMain(argc, argv, tealeafSDK, NSStringFromClass([AppDelegate
                                                                            class]));
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
