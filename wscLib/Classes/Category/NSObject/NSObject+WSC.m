//
//  NSObject+WSC.m
//  ETalk
//
//  Created by shuchao on 2019/10/9.
//  Copyright © 2019 tongc. All rights reserved.
//

#import "NSObject+WSC.h"

#import <objc/runtime.h>


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

#pragma mark - 重写编码和反编码

// 遍历类中所有实例变量, 逐一归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    // 遍历实例变量
    // 拷贝实例变量列表
    unsigned int ivarCount = 0;
    Ivar *vars = class_copyIvarList(object_getClass(self), &ivarCount);
    for (int i = 0; i < ivarCount; i ++) {
        
        Ivar var = vars[i];
        // 获取实例变量名字
        NSString *varName = [NSString stringWithUTF8String:ivar_getName(var)];
    
        // KVC取值
        id value = [self valueForKey:varName];
        // 进行归档
        [aCoder encodeObject:value forKey:varName];
    }
    
    free(vars);
}

// 遍历实例变量链表, 逐一反归档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [self init];
    if (self != nil) {

        unsigned int ivarCount = 0;
        Ivar *vars = class_copyIvarList(object_getClass(self), &ivarCount);
        for (int i = 0; i < ivarCount; i ++) {
            
            Ivar var = vars[i];
            // 获取实例变量名字
            NSString *varName = [NSString stringWithUTF8String:ivar_getName(var)];
            // 反归档
            id value = [aDecoder decodeObjectForKey:varName];
            if (value) {
                [self setValue:value forKey:varName];
            }
            
        }
        
        free(vars);
    }
    
    return self;
}

@end
