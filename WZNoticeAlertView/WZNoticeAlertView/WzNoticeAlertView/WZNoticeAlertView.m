//
//  WZNoticeAlertView.m
//  WZNoticeAlertView
//
//  Created by juru on 2018/1/27.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "Masonry.h"
#import "WZNoticeAlertView.h"
@interface WZNoticeAlertView ()
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIButton *removeBtn;
@property(nonatomic, strong) UIImageView *noticeImage;
@property(nonatomic, strong) UILabel *messageLabel;
@property(nonatomic, strong) UIView *screenView;
@end



@implementation WZNoticeAlertView{
    UIButton *firsBtn;
    UIButton *nextBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
                     btnTitle:(NSString *)btnTitle
                 nextBtnTitle:(NSString *)nextBtnTitle
                 iconImageStr:(NSString *)iconImageStr
                      message:(NSString *)message
                        title:(NSString *)title
               removeImageStr:(NSString *)removeImageStr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.btnTitle = btnTitle;
        self.nextBtnTitle = nextBtnTitle;
        self.iconImageStr = iconImageStr;
        self.message = message;
        self.title = title;
        self.removeImageStr = removeImageStr;
        [self setUpViews];
        [self creatAutoLayout];
    }
    return self;
}


- (void)setUpViews{
    if (self.removeImageStr) {
        [self.removeBtn setBackgroundImage:[UIImage imageNamed:self.removeImageStr] forState:UIControlStateNormal];
    }
    [self addSubview:self.removeBtn];
    
    [self addSubview:self.titleLabel];
    self.titleLabel.text = self.title;
 
    [self addSubview:self.noticeImage];
    if (self.iconImageStr) {
        self.noticeImage.image = [UIImage imageNamed:self.iconImageStr];
    }
    [self addSubview:self.messageLabel];
    if (self.message) {
        self.messageLabel.text = self.message;
    }

 
    
}

- (void)creatAutoLayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
    [self.removeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.titleLabel);
    }];
    [self.noticeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(40);
        make.centerX.mas_equalTo(self);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.noticeImage.mas_bottom).offset(35);
        make.left.mas_equalTo(self.mas_left).offset(40);
        make.right.mas_equalTo(self.mas_right).offset(-40);
    }];
          [_removeBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    firsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [firsBtn setTitle:_btnTitle forState:UIControlStateNormal];
    [firsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [firsBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_default"] forState:UIControlStateNormal];
    [firsBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firsBtn];
    [firsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(35);
        make.left.mas_equalTo(self.mas_left).offset(40);
        make.right.mas_equalTo(self.mas_right).offset(-40);
   
    }];
    if (self.nextBtnTitle) {
        nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nextBtn setTitle:_nextBtnTitle forState:UIControlStateNormal];
        [nextBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [nextBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
        [self addSubview:nextBtn];
        [self.messageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.noticeImage.mas_bottom).offset(15);
        }];
        [firsBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(15);
            make.left.mas_equalTo(self.mas_left).offset(40);
            make.right.mas_equalTo(self.mas_right).offset(-40);
        }];
        
        [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(firsBtn.mas_bottom).offset(15);
            make.centerX.mas_equalTo(self);
        }];
    }
  
    
    
}


#pragma mark lazy
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIButton *)removeBtn{
    if (_removeBtn == nil) {
        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removeBtn setBackgroundImage:[UIImage imageNamed:@"gold_mine_icon"] forState:UIControlStateNormal];
  
    }
    return _removeBtn;
}

- (UIImageView *)noticeImage{
    if (_noticeImage == nil) {
        _noticeImage = [[UIImageView alloc] init];
        _noticeImage.image = [UIImage imageNamed:@""];
    }
    return _noticeImage;
}
- (UILabel *)messageLabel{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textColor = [UIColor lightGrayColor];
        _messageLabel.numberOfLines = 0;
        
        
    }
    return _messageLabel;
}

- (UIView *)screenView{
    if (_screenView == nil) {
        _screenView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _screenView.backgroundColor = [UIColor blackColor];
        _screenView.alpha = 1;
    }
    return _screenView;
}

- (void)show{
    
    [self.screenView addSubview:self];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.screenView];
    self.screenView .backgroundColor = [UIColor colorWithRed:0/255.0
                                                       green:0/255.0
                                                        blue:0/255.0
                                                       alpha:0.5];
    self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 270)/2,[UIScreen mainScreen].bounds.size.height , 270, 400);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 270)/2,([UIScreen mainScreen].bounds.size.height - 400)/2, 270, 400);
    }];
    
}

- (void)remove{
    [UIView animateWithDuration:0.35 animations:^
     {
               self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 270)/2,[UIScreen mainScreen].bounds.size.height , 270, 400);
         
     } completion:^(BOOL finished)
     {
         [self.screenView removeFromSuperview];
     }];
}

- (void)click:(UIButton *)btn{
    if (btn == nextBtn) {
        if (self.tapCallback != nil) {
            self.tapCallback(1);
        }
    }else if (btn == firsBtn){
        
        
        if (self.tapCallback != nil) {
            self.tapCallback(0);
        }
        
    }else if (btn == self.removeBtn){
        if (self.close) {
            self.close();
        }
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
