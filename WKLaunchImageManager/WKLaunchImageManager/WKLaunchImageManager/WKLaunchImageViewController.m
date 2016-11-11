//
//  WKLaunchImageViewController.m
//  WKLaunchImageManager
//
//  Created by 王昆 on 16/11/11.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "WKLaunchImageViewController.h"

@interface WKLaunchImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;  /**< 装载图片 */
@property (nonatomic, strong) UIButton *skipButton;  /**< 跳过按钮 */
@property (nonatomic, strong) UIImage *image;  /**< 图片资源 */
@property (nonatomic, strong) NSTimer *timer;  /**< 定时器 */
@property (nonatomic, assign) NSInteger currentTime;  /**< 当前时间 */
@property (nonatomic,   copy) void(^clickSkipCallBack)();  /**< 点击跳过按钮的回调 */
@end

@implementation WKLaunchImageViewController
- (void)dealloc {
    NSLog(@"WKLaunchImageViewController - dealloc");
}

#pragma mark - init
- (instancetype)initWithImage:(UIImage *)image clickSkipCallBack:(void(^)())clickSkipCallBack {
    if (self = [super init]) {
        self.image = image;
        self.clickSkipCallBack = clickSkipCallBack;
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.imageView addSubview:self.skipButton];
}

#pragma mark - public methods
- (void)startTimerWithTotalSeconds:(NSTimeInterval)seconds {
    _currentTime = seconds;
    [self.skipButton setTitle:[NSString stringWithFormat:@"点击跳过%zd",_currentTime] forState:UIControlStateNormal];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFireAction) userInfo:nil repeats:YES];
}

#pragma mark - event response
- (void)clickSkipButtonAction:(UIButton *)sender {
    [self dismissLaunchImage];
}

- (void)timerFireAction {
    if (_currentTime > 1) {
        _currentTime --;
        [self.skipButton setTitle:[NSString stringWithFormat:@"点击跳过%zd",_currentTime] forState:UIControlStateNormal];
    } else {
        [self dismissLaunchImage];
    }
}

#pragma mark - private methods
- (void)dismissLaunchImage {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.imageView.userInteractionEnabled = NO;
    if (_clickSkipCallBack) {
        _clickSkipCallBack();
    }
}

#pragma mark - getters
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:self.image];
        _imageView.frame = [UIScreen mainScreen].bounds;
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

- (UIButton *)skipButton {
    if (!_skipButton) {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipButton.frame = CGRectMake(CGRectGetWidth(self.imageView.frame) * 0.95 - 90, CGRectGetWidth(self.imageView.frame) * 0.05, 90, 30);
        [_skipButton setTitle:@"点击跳过" forState:UIControlStateNormal];
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _skipButton.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
        _skipButton.layer.cornerRadius = 5;
        _skipButton.layer.masksToBounds = YES;
        [_skipButton addTarget:self action:@selector(clickSkipButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}

@end
