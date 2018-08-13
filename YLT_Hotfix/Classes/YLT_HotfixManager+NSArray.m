//
//  YLT_HotfixManager+NSArray.m
//  Aspects
//
//  Created by 项普华 on 2018/7/11.
//

#import "YLT_HotfixManager+NSArray.h"

@implementation YLT_HotfixManager (NSArray)

- (void)setupArray:(JSContext *)context {
    context[@"objectAtIndex"] = ^id(id instance, id obj1) {
        if (![instance isKindOfClass:[NSArray class]]) {
            return nil;
        }
        NSInteger index = [obj1 integerValue];
        if (((NSArray *) instance).count <= index) {
            return nil;
        }
        return [((NSArray *) instance) objectAtIndex:index];
    };
}

@end
