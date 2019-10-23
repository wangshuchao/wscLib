//
//  UIViewController+WSCViewController.h
//  XAA
//
//  Created by shuchao on 2019/9/24.
//  Copyright © 2019 yiyi. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (WSCViewController)

-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion;



-(void)alertTitle:(NSString *__nonnull)title message:(NSString *__nonnull)message style:(UIAlertControllerStyle)style cancelAction:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
