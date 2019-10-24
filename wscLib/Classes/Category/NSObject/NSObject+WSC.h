//
//  NSObject+WSC.h
//  ETalk
//
//  Created by shuchao on 2019/10/9.
//  Copyright © 2019 tongc. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WSC)

-(UIViewController *)getCurrentController;

/// Alert tips
/// @param tips tipStr
-(void)alertWithTips:(NSString *)tips;

@end

NS_ASSUME_NONNULL_END
