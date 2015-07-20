//
//  AppDelegate.m
//  Welome
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import "AppDelegate.h"
#import "IWNewFeatureController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //判断是否有新版本
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    //保存上一次的版本号
    NSString *lastVersion=[[NSUserDefaults standardUserDefaults]objectForKey:@"Version"];
    
    
    if ([currentVersion isEqualToString:lastVersion]) {
        //版本移植，不加载引导图
        //直接进入界面
        
    }else
    {
        //版本不移植，加载引导图
        IWNewFeatureController *iwVC=[[IWNewFeatureController alloc]init];
        self.window.rootViewController=iwVC;
        //[[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:@"Version"];

    
    }
        // Override point for customization after application launch.
    return YES;
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
