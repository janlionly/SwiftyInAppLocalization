//
//  SwiftyInAppLocalization.h
//  SwiftyInAppLocalizationDemo
//
//  Created by janlionly on 2020/7/21.
//  Copyright © 2020 janlionly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyInAppLocalization : NSObject

+ (instancetype)shared;

/**
@brief:    getter and setter of the default language code.
@note:      set the first language you want to show, you can call it in applicationDidFinishLaunching, this should reload view controller from language bundle, this has no influence on setting current language code.
@sa:          the more language codes you can check them online: https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html
*/
@property (nonatomic, copy, nullable) NSString *defaultLanguageCode;


/// get  the current language code.
@property (nonatomic, copy, nullable, readonly) NSString *currentLanguageCode;

/**
@brief:    getter and setter of the current language code.
@param  currentLanguageCode the language code you want to change.
@param  rootViewController   instantiate the view controller that you want to show after changing the language, if set nil, you should reload view controller by yourself.
@param  animation   the animation block for passing view's animatable property.
@note:      set the current language you want to show, this should reload view controller from language bundle.
@sa:          the more language codes you can check them online: https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html
*/
- (void)setCurrentLanguageCode:(NSString *)currentLanguageCode reload:(nullable UIViewController *)rootViewController animation:(nullable void (^)(UIView *))animation;

@end

NS_ASSUME_NONNULL_END
