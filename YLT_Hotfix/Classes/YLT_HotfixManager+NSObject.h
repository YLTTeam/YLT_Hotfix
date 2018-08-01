//
//  YLT_HotfixManager+NSObject.h
//  Aspects
//
//  Created by 项普华 on 2018/7/11.
//

#import "YLT_HotfixManager.h"

@interface YLT_HotfixManager (NSObject)

/**
 显示Toast
 */
@property (nonatomic, strong) void(^ylt_toast)(NSString *message);

- (void)setupObject:(JSContext *)context;

@end
