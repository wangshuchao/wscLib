//
//  WSTimer.m
//  Pods-wscLib_Example
//
//  Created by shuchao on 2019/11/27.
//

#import "WSTimer.h"

@interface WSTimer ()
{
    NSTimer *_timer;
    BOOL    _repeats;
}
- (void)onTimer: (NSTimer *)timer;
@end

@implementation WSTimer

+(instancetype)initStartTimer:(NSTimeInterval)seconds delegate:(id<WSTimerDelegate>)delegate repeats:(BOOL)repeats{
    WSTimer *tm = [[WSTimer alloc] init];
    if (tm) {
        [tm startTimer:seconds delegate:delegate repeats:repeats];
    }
    return tm;
}


- (void)dealloc
{
    [self stopTimer];
}

- (void)startTimer: (NSTimeInterval)seconds
          delegate: (id<WSTimerDelegate>)delegate
           repeats: (BOOL)repeats
{
    _timerDelegate = delegate;
    _repeats = repeats;
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:seconds
                                              target:self
                                            selector:@selector(onTimer:)
                                            userInfo:nil
                                             repeats:repeats];
}

- (void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
    _timerDelegate = nil;
}
///定时器回调
- (void)onTimer: (NSTimer *)timer
{
    if (!_repeats)
    {
        _timer = nil;
    }
    if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(onNTESTimerFired:)])
    {
        [_timerDelegate onNTESTimerFired:self];
    }
}


@end
