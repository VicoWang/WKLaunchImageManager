//
//  ViewController.m
//  WKLaunchImageManager
//
//  Created by 王昆 on 16/11/11.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self performSelector:@selector(alertShow) withObject:nil afterDelay:1.0f];
}

- (void)alertShow {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Test" message:@"view level!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
