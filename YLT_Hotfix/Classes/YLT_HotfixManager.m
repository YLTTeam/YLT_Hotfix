//
//  YLT_HotfixManager.m
//  Pods-YLT_Hotfix_Example
//
//  Created by 项普华 on 2018/7/11.
//

#import "YLT_HotfixManager.h"
#import <objc/runtime.h>
#import <Aspects/Aspects.h>
#import "YLT_HotfixManager+NSObject.h"
#import "YLT_HotfixManager+NSArray.h"

@interface YLT_HotfixManager()
@property (nonatomic, strong) JSContext *context;
@end

@implementation YLT_HotfixManager
YLT_ShareInstance(YLT_HotfixManager);

- (void)ylt_init {
    [self setup];
    [self setupObject:self.context];
    [self setupArray:self.context];
}

- (void)fix:(NSString *)js {
    [self.context evaluateScript:js];
}

- (void)fixWithMethod:(BOOL)isClassMethod aspectionOptions:(AspectOptions)option instanceName:(NSString *)instanceName selectorName:(NSString *)selectorName fixImpl:(JSValue *)fixImpl {
    Class klass = NSClassFromString(instanceName);
    if (isClassMethod) {
        klass = object_getClass(klass);
    }
    SEL sel = NSSelectorFromString(selectorName);
    [klass aspect_hookSelector:sel withOptions:option usingBlock:^(id<AspectInfo> aspectInfo){
        [fixImpl callWithArguments:@[aspectInfo.instance, aspectInfo.originalInvocation, aspectInfo.arguments]];
    } error:nil];
}

- (id)runClassWithClassName:(NSString *)className selector:(NSString *)selector obj1:(id)obj1 obj2:(id)obj2 {
    Class klass = NSClassFromString(className);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [klass performSelector:NSSelectorFromString(selector) withObject:obj1 withObject:obj2];
#pragma clang diagnostic pop
}

- (id)runInstanceWithInstance:(id)instance selector:(NSString *)selector obj1:(id)obj1 obj2:(id)obj2 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [instance performSelector:NSSelectorFromString(selector) withObject:obj1 withObject:obj2];
#pragma clang diagnostic pop
}
- (void)setup {
    __weak typeof(self) wkself = self;
    self.context[@"fixInstanceMethodBefore"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:NO aspectionOptions:AspectPositionBefore instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"fixInstanceMethodReplace"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:NO aspectionOptions:AspectPositionInstead instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"fixInstanceMethodAfter"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:NO aspectionOptions:AspectPositionAfter instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"fixClassMethodBefore"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:YES aspectionOptions:AspectPositionBefore instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"fixClassMethodReplace"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:YES aspectionOptions:AspectPositionInstead instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"fixClassMethodAfter"] = ^(NSString *instanceName, NSString *selectorName, JSValue *fixImpl) {
        [wkself fixWithMethod:YES aspectionOptions:AspectPositionAfter instanceName:instanceName selectorName:selectorName fixImpl:fixImpl];
    };
    [self context][@"runClassWithNoParamter"] = ^id(NSString *className, NSString *selectorName) {
        return [wkself runClassWithClassName:className selector:selectorName obj1:nil obj2:nil];
    };
    [self context][@"runClassWith1Paramter"] = ^id(NSString *className, NSString *selectorName, id obj1) {
        return [wkself runClassWithClassName:className selector:selectorName obj1:obj1 obj2:nil];
    };
    [self context][@"runClassWith2Paramters"] = ^id(NSString *className, NSString *selectorName, id obj1, id obj2) {
        return [wkself runClassWithClassName:className selector:selectorName obj1:obj1 obj2:obj2];
    };
    [self context][@"runVoidClassWithNoParamter"] = ^(NSString *className, NSString *selectorName) {
        [wkself runClassWithClassName:className selector:selectorName obj1:nil obj2:nil];
    };
    [self context][@"runVoidClassWith1Paramter"] = ^(NSString *className, NSString *selectorName, id obj1) {
        [wkself runClassWithClassName:className selector:selectorName obj1:obj1 obj2:nil];
    };
    [self context][@"runVoidClassWith2Paramters"] = ^(NSString *className, NSString *selectorName, id obj1, id obj2) {
        [wkself runClassWithClassName:className selector:selectorName obj1:obj1 obj2:obj2];
    };
    [self context][@"runInstanceWithNoParamter"] = ^id(id instance, NSString *selectorName) {
        return [wkself runInstanceWithInstance:instance selector:selectorName obj1:nil obj2:nil];
    };
    [self context][@"runInstanceWith1Paramter"] = ^id(id instance, NSString *selectorName, id obj1) {
        return [wkself runInstanceWithInstance:instance selector:selectorName obj1:obj1 obj2:nil];
    };
    [self context][@"runInstanceWith2Paramters"] = ^id(id instance, NSString *selectorName, id obj1, id obj2) {
        return [wkself runInstanceWithInstance:instance selector:selectorName obj1:obj1 obj2:obj2];
    };
    [self context][@"runVoidInstanceWithNoParamter"] = ^(id instance, NSString *selectorName) {
        [wkself runInstanceWithInstance:instance selector:selectorName obj1:nil obj2:nil];
    };
    [self context][@"runVoidInstanceWith1Paramter"] = ^(id instance, NSString *selectorName, id obj1) {
        [wkself runInstanceWithInstance:instance selector:selectorName obj1:obj1 obj2:nil];
    };
    [self context][@"runVoidInstanceWith2Paramters"] = ^(id instance, NSString *selectorName, id obj1, id obj2) {
        [wkself runInstanceWithInstance:instance selector:selectorName obj1:obj1 obj2:obj2];
    };
    [self context][@"runInvocation"] = ^(NSInvocation *invocation) {
        [invocation invoke];
    };
}

#pragma mark - setter getter

- (JSContext *)context {
    if (!_context) {
        _context = [[JSContext alloc] init];
        _context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
            YLT_LogError(@"exception:%@", exception);
        };
    }
    return _context;
}

@end
