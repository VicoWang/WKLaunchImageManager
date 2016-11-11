//
//  AppDelegate.m
//  WKLaunchImageManager
//
//  Created by 王昆 on 16/11/11.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "AppDelegate.h"
#import "WKLaunchImageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [WKLaunchImageManager launchImageShowWithImage:[UIImage imageNamed:@"image.jpg"]];
    
    return YES;
}

@end
