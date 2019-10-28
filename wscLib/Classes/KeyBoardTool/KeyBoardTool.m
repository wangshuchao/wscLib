                                                                                                                                                                                                       //
//  KeyBoardTool1.m
//  ShippingAddress
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 daming. All rights reserved.
//

#import "KeyBoardTool.h"

@implementation KeyBoardTool

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textLabel];
        [self addSubview:self.doneBtn];
        [self addSubview:self.topLabel];
        [self addSubview:self.bottomLabel];
    }
    return self;
}


- (UILabel *)topLabel{
    if (!_topLabel) {
        self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        _topLabel.backgroundColor = kColor(225, 225, 225);
    }
    return _topLabel;
}
- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 39, SCREEN_WIDTH, 1)];
        _bottomLabel.backgroundColor = kColor(225, 225, 225);
    }
    return _bottomLabel;
}
- (UILabel *)textLabel{
    if (!_textLabel) {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.height-90, 40)];
    }
    return _textLabel;
}


- (UIButton *)doneBtn{
    if (!_doneBtn) {
        self.doneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 0, 70, 40);
        [_doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_doneBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        [self.doneBtn addTarget:self action:@selector(doneBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}
- (void)doneBtnClick{
    if([_delegate respondsToSelector:@selector(keyBoard:itemClick:)]){
        [_delegate keyBoard:self itemClick:KeyboardToolItemTypeDone];
    }
}
- (void)setDongTitle:(NSString *)dongTitle
{
    _dongTitle = dongTitle;
    [self.doneBtn setTitle:dongTitle forState:UIControlStateNormal];
}
@end
