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

/// Alert tips
/// @param tips tipStr
-(void)alertWithTips:(NSString *)tips;
-(void)alertWithTips:(NSString *)tips okHandler:(void (^)(UIAlertAction * okAction))okHandler;

//alertViewController Sheet
-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion;



-(void)alertTitle:(NSString *__nonnull)title message:(NSString *__nonnull)message style:(UIAlertControllerStyle)style cancelAction:(NSString *__nonnull)cancelStr cancelHandler:(void (^)(UIAlertAction * _Nonnull))cancelHandler firstDefAction:(NSString *__nonnull)firstStr firstHandler:(void (^)(UIAlertAction * _Nonnull))firstHandler secondDefAction:(NSString *__nonnull)secondStr secondHandler:(void (^)(UIAlertAction * _Nonnull))secondHandler completion:(void (^)(void))completion;


-(void)alertSheetSelectContryChina:(void (^)(UIAlertAction * action))chinaHandler
                       northArmica:(void (^)(UIAlertAction * action))northHandler
                                UK:(void (^)(UIAlertAction * action))UKHandler
                         australia:(void (^)(UIAlertAction * action))austraHandler;


/// 警告框 取消 确定
/// @param title title
/// @param msg mesage
/// @param cancelStr cancel
/// @param cancelHandler handler
/// @param okStr ok
/// @param okHandler okHandler
/// @param completion completion
-(void)alertTitle:(NSString *)title message:(NSString *)msg cancel:(NSString *)cancelStr cancelHandler:(void (^)(UIAlertAction * action))cancelHandler ok:(NSString *)okStr okHandler:(void (^)(UIAlertAction * action))okHandler completion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
