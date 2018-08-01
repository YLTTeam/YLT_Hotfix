//
//  YLTAppDelegate.m
//  YLT_Hotfix
//
//  Created by xphaijj0305@126.com on 07/11/2018.
//  Copyright (c) 2018 xphaijj0305@126.com. All rights reserved.
//

#import "YLTAppDelegate.h"
#import <WToast/WToast.h>
#import <YLT_Hotfix/YLT_Hotfix.h>

@implementation YLTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [YLT_HotfixManager shareInstance].ylt_toast = ^(NSString *message) {
        [WToast showWithText:message];
    };
    
//    NSString *js = @"fixInstanceMethodReplace('YLTViewController', 'div:', function(instance, originInvocation, originArguments){ \
//    if (isKindOfClass(originArguments[0], 'NSString')) {\
//        console.log('is string');\
//        alert('is string');\
//        toast('is string');\
//    } else if (isKindOfClass(originArguments[0], 'NSArray')) {\
//        objectAtIndex(originArguments[0], 10);\
//        if (isKindOfClass(objectAtIndex(originArguments[0], 0), 'NSString')) {\
//            alert('array has string enum');\
//            toast('array has string enum');\
//            runInvocation(originInvocation); \
//        } else {\
//            alert('is not array has string');\
//            return 11;\
//        }\
//    }\
//    else { \
//        runInvocation(originInvocation); \
//    } \
//    });";
    NSString *js = @"fixInstanceMethodReplace('YLTViewController', 'addA:withB:', function(instance, originInvocation, originArguments){ \
        if (originArguments[0] == 0) {\
            alert('0000');  \
            return('123');\
        } else { \
            runInvocation(originInvocation); \
        } \
    });";

    if(js) {
        [[YLT_HotfixManager shareInstance] fix:js];
    }
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
