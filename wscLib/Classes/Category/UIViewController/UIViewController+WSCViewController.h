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

/// Alert tips okHandler
/// @param tips tips
/// @param okHandler okHandler
-(void)alertWithTips:(NSString * )tips
           okHandler:(void (^_Nullable)(UIAlertAction *_Nullable okAction))okHandler;

/// Alert tips 取消 确定
/// @param tips 提示
/// @param cancelStr 取消按钮标题
/// @param cancelHandler 取消handler
/// @param okStr 确定
/// @param okHandler 确定handler
-(void)alertWithTips:(NSString *)tips
              cancel:(NSString *)cancelStr
       cancelHandler:(void (^_Nullable)(UIAlertAction * __nullable cancelAction))cancelHandler
                  ok:(NSString *)okStr
           okHandler:(void (^_Nullable)(UIAlertAction *_Nullable okAction))okHandler;


//alertViewController Sheet
-(void)alertSheetStyleCancel:(NSString *__nonnull)cancelStr cancelHandler:(void (^_Nullable)(UIAlertAction * __nullable))cancelHandler firstDefAction:(NSString *__nullable)firstStr firstHandler:(void (^_Nullable)(UIAlertAction * __nullable))firstHandler secondDefAction:(NSString *__nullable)secondStr secondHandler:(void (^_Nullable)(UIAlertAction * __nullable))secondHandler completion:(void (^_Nullable)(void))completion;





/// 警告框 标题 取消 first second
/// @param title 标题
/// @param msgStr msg
/// @param cancelStr 取消
/// @param cancelHandler 取消handler
/// @param firstStr first
/// @param firstHandler firstHandle
/// @param secondStr second
/// @param secondHandler secondHandler
/// @param completion completion
-(void)alertSheetStyleTitle:(NSString *)title
                     msgStr:(NSString *)msgStr
                     Cancel:(NSString *)cancelStr
              cancelHandler:(void (^_Nullable)(UIAlertAction * _Nullable))cancelHandler
             firstDefAction:(NSString *__nullable)firstStr
               firstHandler:(void (^_Nullable)(UIAlertAction * __nullable))firstHandler
            secondDefAction:(NSString *__nullable)secondStr
              secondHandler:(void (^_Nullable)(UIAlertAction * __nullable))secondHandler
                 completion:(void (^_Nullable)(void))completion;



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
-(void)alertTitle:(NSString *_Nullable)title
          message:(NSString *_Nullable)msg
           cancel:(NSString *_Nullable)cancelStr
    cancelHandler:(void (^_Nullable)(UIAlertAction * _Nullable action))cancelHandler ok:(NSString *_Nullable)okStr
        okHandler:(void (^_Nullable)(UIAlertAction * _Nullable action))okHandler completion:(void (^_Nullable)(void))completion;


-(void)alertTitle:(NSString *__nullable)title
          message:(NSString *__nullable)message
            style:(UIAlertControllerStyle)style
     cancelAction:(NSString *__nullable)cancelStr
    cancelHandler:(void (^_Nullable)(UIAlertAction * __nullable))cancelHandler
   firstDefAction:(NSString *__nullable)firstStr
     firstHandler:(void (^_Nullable)(UIAlertAction * __nullable))firstHandler
  secondDefAction:(NSString *__nullable)secondStr
    secondHandler:(void (^_Nullable)(UIAlertAction * __nullable))secondHandler
       completion:(void (^_Nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
