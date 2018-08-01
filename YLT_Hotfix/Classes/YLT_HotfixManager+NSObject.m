//
//  YLT_HotfixManager+NSObject.m
//  Aspects
//
//  Created by 项普华 on 2018/7/11.
//

#import "YLT_HotfixManager+NSObject.h"

@implementation YLT_HotfixManager (NSObject)

- (void)setupObject:(JSContext *)context {
    __weak typeof(self) weakSelf = self;
    [context evaluateScript:@"var console = {}"];
    context[@"console"][@"log"] = ^(id message) {
        YLT_Log(@"Javascript log: %@",message);
    };
    
    context[@"alert"] = ^(id message) {
        YLT_TipAlert(@"%@", message);
    };
    
    context[@"toast"] = ^(id message) {
        __strong typeof(self) self = weakSelf;
        if (self.ylt_toast) {
            self.ylt_toast(message);
        }
    };
    
    context[@"isKindOfClass"] = ^id(id instance, NSString *obj1) {
        return @([instance isKindOfClass:NSClassFromString(obj1)]);
    };
    
    context[@"return"] = ^id(id instance, id obj1) {
        return @YES;
    };
    
    
}



#pragma mark - setter getter
- (void(^)(NSString *message))ylt_toast {
    return objc_getAssociatedObject(self, @selector(ylt_toast));
}

- (void)setYlt_toast:(void (^)(NSString *))ylt_toast {
    objc_setAssociatedObject(self, @selector(ylt_toast), ylt_toast, OBJC_ASSOCIATION_COPY);
}


@end
