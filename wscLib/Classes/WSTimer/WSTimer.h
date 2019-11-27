//
//  WSTimer.h
//  Pods-wscLib_Example
//
//  Created by shuchao on 2019/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class WSTimer;

@protocol WSTimerDelegate <NSObject>

- (void)onNTESTimerFired:(WSTimer *)holder;
@end


@interface WSTimer : NSObject

@property (nonatomic,weak)  id<WSTimerDelegate>  timerDelegate;

///初始化定时器
+(instancetype)initStartTimer:(NSTimeInterval)seconds
                     delegate:(id<WSTimerDelegate>)delegate
                      repeats:(BOOL)repeats;


/// 启动定时器
/// @param seconds 间隔时间 单位秒
/// @param delegate 回调代理
/// @param repeats repeats
- (void)startTimer:(NSTimeInterval)seconds
          delegate:(id<WSTimerDelegate>)delegate
           repeats:(BOOL)repeats;



- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
