//
//  WKLaunchImageManager.m
//  WKLaunchImageManager
//
//  Created by 王昆 on 16/11/11.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "WKLaunchImageManager.h"
#import "WKLaunchImageViewController.h"

static NSTimeInterval const WKDismissTimeDuration = 0.5f;  //渐变消失动画时间

@interface WKLaunchImageManager ()
@property (nonatomic, strong) UIWindow *launchImageWindow; /**< <#note#> */
@end

@implementation WKLaunchImageManager
+ (instancetype)shared {
    static WKLaunchImageManager *__wkLaunchImageManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __wkLaunchImageManager = [[WKLaunchImageManager alloc]init];
    });
    return __wkLaunchImageManager;
}

+ (void)launchImageShowWithImage:(UIImage *)image {
    [[self shared] launchImageShowWithImage:image];
}

- (void)launchImageShowWithImage:(UIImage *)image {
    self.launchImageWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.launchImageWindow.windowLevel = UIWindowLevelStatusBar - 1;
    self.launchImageWindow.hidden = NO;
    __weak typeof(self) weakSelf = self;
    WKLaunchImageViewController *launchImageVC = [[WKLaunchImageViewController alloc]initWithImage:image clickSkipCallBack:^{
        __strong typeof(self)strongSelf = weakSelf;
        [UIView animateWithDuration:WKDismissTimeDuration animations:^{
            strongSelf.launchImageWindow.alpha = 0;
        } completion:^(BOOL finished) {
            strongSelf.launchImageWindow.rootViewController = nil;
            strongSelf.launchImageWindow = nil;
        }];
    }];
    [launchImageVC startTimerWithTotalSeconds:5];
    self.launchImageWindow.rootViewController = launchImageVC;
}

@end
