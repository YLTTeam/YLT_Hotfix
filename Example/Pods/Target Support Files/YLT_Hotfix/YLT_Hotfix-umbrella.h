#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YLT_Hotfix.h"
#import "YLT_HotfixManager+NSArray.h"
#import "YLT_HotfixManager+NSObject.h"
#import "YLT_HotfixManager.h"

FOUNDATION_EXPORT double YLT_HotfixVersionNumber;
FOUNDATION_EXPORT const unsigned char YLT_HotfixVersionString[];

