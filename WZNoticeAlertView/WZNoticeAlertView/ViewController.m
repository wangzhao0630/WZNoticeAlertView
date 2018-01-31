//
//  ViewController.m
//  WZNoticeAlertView
//
//  Created by juru on 2018/1/27.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "WZNoticeAlertView.h"
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) WZNoticeAlertView *alertView1;
@property(nonatomic, strong) WZNoticeAlertView *alertView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    __weak typeof(self) weaKself = self;
    self.alertView1.close = ^{
        [weaKself.alertView1 remove];
    };
    
    self.alertView2.close = ^{
        [weaKself.alertView2 remove];
    };
    self.alertView1.tapCallback = ^(NSInteger index) {
        if (index == 0) {
            NSLog(@"点击了第一个");
        }else if (index == 1){
            NSLog(@"点击了第二个");
        }
    };
    self.alertView2.tapCallback = ^(NSInteger index) {
        if (index == 0) {
            NSLog(@"点击了第一个");
        }else if (index == 1){
            NSLog(@"点击了第二个");
        }
    };
}
- (WZNoticeAlertView *)alertView1{
    if (_alertView1 == nil) {
        _alertView1 = [[WZNoticeAlertView alloc] initWithFrame:CGRectZero
                                                      btnTitle:@"去实名认证"
                                                  nextBtnTitle:nil
                                                  iconImageStr:@"registered_empty"
                                                       message:@"尊敬的用户, 您还未实名认证! 马上认证享受优惠有更高收益"
                                                         title:@"注册成功" removeImageStr:nil];
    }
    return _alertView1;
}
- (WZNoticeAlertView *)alertView2{
    if (_alertView2 == nil) {
        _alertView2 = _alertView2 = [[WZNoticeAlertView alloc] initWithFrame:CGRectZero
                                                                            btnTitle:@"去开通存管"
                                                                        nextBtnTitle:@"去我的账户"
                                                                        iconImageStr:@"verified_empty"
                                                                             message:@"尊敬的用户, 您还未实名认证! 马上认证享受优惠有更高收益"
                                                                               title:@"开通存管成功" removeImageStr:nil];
        
    }
    return _alertView2;
}


- (IBAction)click1:(id)sender {
    
    [self.alertView1 show];
    
}


- (IBAction)click2:(id)sender {
    [self.alertView2 show];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
