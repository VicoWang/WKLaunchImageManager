//
//  WKLaunchImageViewController.h
//  WKLaunchImageManager
//
//  Created by 王昆 on 16/11/11.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKLaunchImageViewController : UIViewController

/** 新初始化方法 */
- (instancetype)initWithImage:(UIImage *)image clickSkipCallBack:(void(^)())clickSkipCallBack;

/** 创建、打开定时器并设置倒计时的总时长 */
- (void)startTimerWithTotalSeconds:(NSTimeInterval)seconds;

@end
