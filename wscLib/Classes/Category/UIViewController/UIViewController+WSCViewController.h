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
-(void)alertWithTips:(NSString * )tips;
-(void)alertWithTips:(NSString * )tips okHandler:(void (^_Nullable)(UIAlertAction *_Nullable okAction))okHandler;

//alertViewController Sheet
-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^_Nullable)(UIAlertAction * __nullable))cancelHandler firstDefAction:(NSString *__nullable)firstStr firstHandler:(void (^_Nullable)(UIAlertAction * __nullable))firstHandler secondDefAction:(NSString *__nullable)secondStr secondHandler:(void (^_Nullable)(UIAlertAction * __nullable))secondHandler completion:(void (^_Nullable)(void))completion;



-(void)alertTitle:(NSString *__nullable)title message:(NSString *__nullable)message style:(UIAlertControllerStyle)style cancelAction:(NSString *__nullable)cancelStr cancelHandler:(void (^_Nullable)(UIAlertAction * __nullable))cancelHandler firstDefAction:(NSString *__nullable)firstStr firstHandler:(void (^_Nullable)(UIAlertAction * __nullable))firstHandler secondDefAction:(NSString *__nullable)secondStr secondHandler:(void (^_Nullable)(UIAlertAction * __nullable))secondHandler completion:(void (^_Nullable)(void))completion;


-(void)alertSheetSelectContryChina:(void (^_Nullable)(UIAlertAction * _Nullable action))chinaHandler
                       northArmica:(void (^_Nullable)(UIAlertAction * _Nullable action))northHandler
                                UK:(void (^_Nullable)(UIAlertAction * _Nullable action))UKHandler
                         australia:(void (^_Nullable)(UIAlertAction * _Nullable action))austraHandler;


/// 警告框 取消 确定
/// @param title title
/// @param msg mesage
/// @param cancelStr cancel
/// @param cancelHandler handler
/// @param okStr ok
/// @param okHandler okHandler
/// @param completion completion
-(void)alertTitle:(NSString *_Nullable)title message:(NSString *_Nullable)msg cancel:(NSString *_Nullable)cancelStr cancelHandler:(void (^_Nullable)(UIAlertAction * _Nullable action))cancelHandler ok:(NSString *_Nullable)okStr okHandler:(void (^_Nullable)(UIAlertAction * _Nullable action))okHandler completion:(void (^_Nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
