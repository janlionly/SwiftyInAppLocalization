//
//  SwiftyInAppLocalization.m
//  SwiftyInAppLocalizationDemo
//
//  Created by janlionly on 2020/7/21.
//  Copyright © 2020 janlionly. All rights reserved.
//

#import "SwiftyInAppLocalization.h"
#import <objc/runtime.h>

@interface NSBundle (Language)

+ (void)setLanguage:(NSString *)language;
+ (NSString *)currentLanguage;

@end

static const char bundleKey = 0;

@interface L10NBundle : NSBundle
@end

@implementation L10NBundle

- (NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle = objc_getAssociatedObject(self, &bundleKey);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}
@end

@implementation NSBundle (Language)

+ (void)setLanguage:(NSString *)language
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle],[L10NBundle class]);
    });
    objc_setAssociatedObject([NSBundle mainBundle], &bundleKey, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSString *)currentLanguage
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle],[L10NBundle class]);
    });
    return objc_getAssociatedObject([NSBundle mainBundle], &bundleKey);
}

@end

@implementation SwiftyInAppLocalization

#define SelectedLanguageKey     @"SwiftyInAppLocalizationSelectedLanguageKey"
#define DefaultLanguageKey      @"SwiftyInAppLocalizationDefaultLanguageKey"

+ (instancetype)shared {
    static SwiftyInAppLocalization *l10n = nil;
    
    if (l10n == nil) {
        l10n = [[SwiftyInAppLocalization alloc] init];
//        NSString *language = l10n.currentLanguageCode;
//        [NSBundle setLanguage:language];
        
    }
    return l10n;
}

- (nullable NSString *)defaultLanguageCode {
    return [[NSUserDefaults standardUserDefaults] valueForKey:DefaultLanguageKey];
}

- (void)setDefaultLanguageCode:(NSString *)defaultLanguageCode {
    [[NSUserDefaults standardUserDefaults] setValue:defaultLanguageCode forKey:DefaultLanguageKey];
    
    NSString *curCode = [self currentLanguageCode];
    NSLog(@"READ CUR CODE: %@", curCode);
    if (nil == curCode) {
        [NSBundle setLanguage:defaultLanguageCode];
    } else {
        [NSBundle setLanguage:curCode];
    }
}

- (void)setCurrentLanguageCode:(NSString *)currentLanguageCode reload:(nullable UIViewController *)rootViewController animation:(nullable void (^)(UIView * _Nonnull))animation {
    [[NSUserDefaults standardUserDefaults] setValue:currentLanguageCode forKey:SelectedLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [NSBundle setLanguage:currentLanguageCode];
    
    if (nil != rootViewController) {
        UIWindow *window = [self getWindow];
        
        UIView *snapshot = [window snapshotViewAfterScreenUpdates:true];
        [rootViewController.view addSubview:snapshot];
        window.rootViewController = rootViewController;
        
        [UIView animateWithDuration:0.5 animations:^{
            if (animation != nil) {
                animation(snapshot);
            }
        } completion:^(BOOL finished) {
            [snapshot removeFromSuperview];
        }];
        NSLog(@"set %@, read now %@", currentLanguageCode, [[NSUserDefaults standardUserDefaults] valueForKey:SelectedLanguageKey]);
    }
}

- (nullable NSString *)currentLanguageCode {
    return [[NSUserDefaults standardUserDefaults] valueForKey:SelectedLanguageKey];
}

- (NSArray<NSString *> *)languageCodes {
    return NSLocale.ISOLanguageCodes;
}

- (UIWindow *)getWindow {
    if (@available(iOS 13, *)) {
        UIWindowScene *targetScene = nil;
        
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if ([scene isKindOfClass:[UIWindowScene class]]) {
                targetScene = (UIWindowScene *)scene;
            }
        }
        return targetScene.windows.firstObject;
    } else {
        return UIApplication.sharedApplication.keyWindow;
    }
}

@end
