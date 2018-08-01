//
//  YLT_HotfixManager.h
//  Pods-YLT_Hotfix_Example
//
//  Created by 项普华 on 2018/7/11.
//

#import <Foundation/Foundation.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface YLT_HotfixManager : NSObject
YLT_ShareInstanceHeader(YLT_HotfixManager);

/**
 适配这段js 的功能

 @param js js 字串
 */
- (void)fix:(NSString *)js;

@end
