//
//  WZNoticeAlertView.h
//  WZNoticeAlertView
//
//  Created by juru on 2018/1/27.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZNoticeAlertView : UIView
@property(nonatomic, strong) NSString *btnTitle;
@property(nonatomic, strong) NSString *nextBtnTitle;
@property(nonatomic, strong) NSString *iconImageStr;
@property(nonatomic, strong) NSString *message;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *removeImageStr;
@property(nonatomic, copy) void(^tapCallback)(NSInteger index);
@property(nonatomic, copy) void(^close)(void);

- (instancetype)initWithFrame:(CGRect)frame
                     btnTitle:(NSString*)btnTitle
                 nextBtnTitle:(NSString *)nextBtnTitle
                 iconImageStr:(NSString *)iconImageStr
                      message:(NSString *)message
                        title:(NSString *)title
               removeImageStr:(NSString *)removeImageStr;

- (void)show;

- (void)remove;

@end
