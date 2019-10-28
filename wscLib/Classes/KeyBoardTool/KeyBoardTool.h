//
//  KeyBoardTool1.h
//  ShippingAddress
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 daming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeyBoardTool;

typedef enum {
    KeyboardToolItemTypeLabel = 0, //
    KeyboardToolItemTypeDone = 1 // 完成
}KeyboardToolItemType;

@protocol KeyboardToolDelegate <NSObject>

@optional

-(void)keyBoard:(KeyBoardTool *)keyboardTool itemClick:(KeyboardToolItemType)itemType;

@end

@interface KeyBoardTool : UIView

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIButton *doneBtn;
@property (nonatomic, weak) id<KeyboardToolDelegate> delegate;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) NSString *dongTitle;
@end
