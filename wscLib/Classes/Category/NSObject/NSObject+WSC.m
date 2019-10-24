//
//  NSObject+WSC.m
//  ETalk
//
//  Created by shuchao on 2019/10/9.
//  Copyright © 2019 tongc. All rights reserved.
//

#import "NSObject+WSC.h"



@implementation NSObject (WSC)

-(UIViewController *)getCurrentController{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = keyWindow.rootViewController;
    if([rootViewController isKindOfClass:[UINavigationController class]])

    {
        rootViewController = ((UINavigationController *)rootViewController).viewControllers.firstObject;
    }
    if([rootViewController isKindOfClass:[UITabBarController class]])
    {
        rootViewController = ((UITabBarController *)rootViewController).selectedViewController;
    }
    
    return rootViewController;
}

-(void)alertWithTips:(NSString *)tips{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"提示", nil) message:NSLocalizedString(tips, nil) preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleCancel handler:nil];
    [alertC addAction:cancel];
    [[self getCurrentController]presentViewController:alertC animated:YES completion:nil];
}

@end
