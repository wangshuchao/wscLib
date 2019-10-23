//
//  UIViewController+WSCViewController.m
//  XAA
//
//  Created by shuchao on 2019/9/24.
//  Copyright © 2019 yiyi. All rights reserved.
//

#import "UIViewController+WSCViewController.h"

#import <objc/runtime.h>
//#import <AppKit/AppKit.h>


NS_ASSUME_NONNULL_BEGIN
@implementation UIViewController (WSCViewController)


-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion{
    [self alertTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelAction:cancelStr cancelHandler:cancelHandler firstDefAction:firstStr firstHandler:firstHandler secondDefAction:secondStr secondHandler:secondHandler completion:completion];
}



-(void)alertTitle:(NSString *__nonnull)title message:(NSString *__nonnull)message style:(UIAlertControllerStyle)style cancelAction:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:cancelHandler];
    UIAlertAction *first = [UIAlertAction actionWithTitle:firstStr style:UIAlertActionStyleDefault handler:firstHandler];
    UIAlertAction *second = [UIAlertAction actionWithTitle:secondStr style:UIAlertActionStyleDefault handler:secondHandler];
    [alertC addAction:cancel];
    [alertC addAction:first];
    [alertC addAction:second];
    alertC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:alertC animated:YES completion:completion];
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
        Method fromMethod = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
        Method toMethod = class_getInstanceMethod([self class], @selector(sw_presentViewController:animated:completion:));

        if (!class_addMethod([self class], @selector(sw_presentViewController:animated:completion:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });
}
//ios13适配
-(void)sw_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if (viewControllerToPresent) {
        if (@available(iOS 13.0, *)) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationOverFullScreen;
        } else {
            // Fallback on earlier versions
        }
    }
    [self sw_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end

NS_ASSUME_NONNULL_END
