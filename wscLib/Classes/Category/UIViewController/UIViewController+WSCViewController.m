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


-(void)alertWithTips:(NSString *)tips{
    [self alertTitle:@"提示" message:tips style:UIAlertControllerStyleAlert cancelAction:@"确定" cancelHandler:nil firstDefAction:nil firstHandler:nil secondDefAction:nil secondHandler:nil completion:nil];
}
-(void)alertWithTips:(NSString *)tips okHandler:(void (^)(UIAlertAction * _Nonnull))okHandler{
    [self alertTitle:@"提示" message:tips style:UIAlertControllerStyleAlert cancelAction:@"确定" cancelHandler:okHandler firstDefAction:nil firstHandler:nil secondDefAction:nil secondHandler:nil completion:nil];
}

-(void)alertTitle:(NSString *)title message:(NSString *)msg cancel:(NSString *)cancelStr cancelHandler:(void (^)(UIAlertAction * action))cancelHandler ok:(NSString *)okStr okHandler:(void (^)(UIAlertAction * action))okHandler completion:(void (^)(void))completion{
    [self alertTitle:title message:msg style:UIAlertControllerStyleAlert cancelAction:cancelStr cancelHandler:cancelHandler firstDefAction:okStr firstHandler:okHandler secondDefAction:nil secondHandler:nil completion:completion];
}

-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion{
    [self alertTitle:nil message:nil style:UIAlertControllerStyleActionSheet cancelAction:cancelStr cancelHandler:cancelHandler firstDefAction:firstStr firstHandler:firstHandler secondDefAction:secondStr secondHandler:secondHandler completion:completion];
}

-(void)alertSheetSelectContryChina:(void (^)(UIAlertAction * _Nonnull))chinaHandler northArmica:(void (^)(UIAlertAction * _Nonnull))northHandler UK:(void (^)(UIAlertAction * _Nonnull))UKHandler australia:(void (^)(UIAlertAction * _Nonnull))austraHandler{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"地区选择", nil) message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *daluo = [UIAlertAction actionWithTitle:[NSLocalizedString(@"中国大陆", nil)stringByAppendingString:@"+86"] style:(UIAlertActionStyleDefault) handler:chinaHandler];
    UIAlertAction *xianggang = [UIAlertAction actionWithTitle:[NSLocalizedString(@"北美", nil)stringByAppendingString:@"+1"] style:(UIAlertActionStyleDefault) handler:northHandler];
    UIAlertAction *aomen = [UIAlertAction actionWithTitle:[NSLocalizedString(@"英国", nil)stringByAppendingString:@"+44"] style:(UIAlertActionStyleDefault) handler:UKHandler];
    UIAlertAction *taiwan = [UIAlertAction actionWithTitle:[NSLocalizedString(@"澳大利亚", nil)stringByAppendingString:@"+672"] style:(UIAlertActionStyleDefault) handler:austraHandler];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:(UIAlertActionStyleCancel) handler:nil];
    
    [alertController addAction:daluo];
    [alertController addAction:xianggang];
    [alertController addAction:aomen];
    [alertController addAction:taiwan];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)alertTitle:(NSString *__nonnull)title message:(NSString *__nonnull)message style:(UIAlertControllerStyle)style cancelAction:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:NSLocalizedString(title, nil) message:NSLocalizedString(message, nil) preferredStyle:style];
    if (cancelStr) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(cancelStr, nil) style:UIAlertActionStyleCancel handler:cancelHandler];
        [alertC addAction:cancel];
    }
    if (firstStr) {
        UIAlertAction *first = [UIAlertAction actionWithTitle:NSLocalizedString(firstStr, nil) style:UIAlertActionStyleDefault handler:firstHandler];
        [alertC addAction:first];
    }
    if (secondStr) {
        UIAlertAction *second = [UIAlertAction actionWithTitle:NSLocalizedString(secondStr, nil) style:UIAlertActionStyleDefault handler:secondHandler];
        [alertC addAction:second];
    }
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
