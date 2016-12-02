//
//  AppDelegate.m
//  BatteryDoctor
//
//  Created by zhuang chaoxiao on 15/8/22.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#import "AppDelegate.h"
#import "CommData.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "RFRateMe.h"
#import "MobClick.h"

#import <BaiduMobAdSDK/BaiduMobAdSplash.h>

#import "AdvertModel.h"

@interface AppDelegate ()<BaiduMobAdSplashDelegate>
{
    BaiduMobAdSplash *splash;
}
@end

@implementation AppDelegate


-(void)initUMShareData
{
    [UMSocialData setAppKey:UM_SHARE_KEY];
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wx8ae0a52d0b488e34" appSecret:@"ba46dbfaa3d67f36c1652bf5561790bd" url:SHARE_URL];
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [AdvertModel getAdvertReq];
    
    [MobClick startWithAppkey:UM_SHARE_KEY reportPolicy:BATCH   channelId:@""];
    
    [self initUMShareData];
 
    mainVC = [[MainViewController alloc]init];
    
    self.window.rootViewController = mainVC;
    
    [RFRateMe showRateAlertAfterTimesOpened:3];
    
 
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (NSString *)publisherId
{
    return BAIDU_APP_ID;
}

/**
 *  广告展示成功
 */
- (void)splashSuccessPresentScreen:(BaiduMobAdSplash *)splash
{
    NSLog(@"splashSuccessPresentScreen");
}

/**
 *  广告展示失败
 */
- (void)splashlFailPresentScreen:(BaiduMobAdSplash *)splash withError:(BaiduMobFailReason) reason
{
    NSLog(@"splashlFailPresentScreen withError:%d",reason);
    //自定义开屏移除
}

/**
 *  广告展示结束
 */
- (void)splashDidDismissScreen:(BaiduMobAdSplash *)splash
{
    NSLog(@"splashDidDismissScreen");
    //自定义开屏移除
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
