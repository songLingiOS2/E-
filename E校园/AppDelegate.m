//
//  AppDelegate.m
//  E校园
//
//  Created by yd on 15/11/26.
//  Copyright (c) 2015年 yd. All rights reserved.
//

#import "AppDelegate.h"
#import "Home_ViewController.h"
#import "BaoMing_ViewController.h"
#import "Mail_ViewController.h"
#import "MyCenter_ViewController.h"

#import "JRSegmentViewController.h"

#import "Reachability.h"
@interface AppDelegate ()
{
    UITabBarController *tabBarController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
    [self startApp];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)startApp{
#pragma makr------检测网络状态
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeState:) name:kReachabilityChangedNotification object:nil];
    
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    [reachability startNotifier];//开始分析 这个网址的网络状态
    
    Home_ViewController *homeView = [[Home_ViewController alloc] init];
    BaoMing_ViewController *baoMingView = [[BaoMing_ViewController alloc]init];
    Mail_ViewController *shopMailView = [[Mail_ViewController alloc] init];
    MyCenter_ViewController *myCenterView = [[MyCenter_ViewController alloc] init];
    
    UINavigationController *home = [[UINavigationController alloc] initWithRootViewController:homeView];
    UINavigationController *baoMing = [[UINavigationController alloc] initWithRootViewController:baoMingView];
    UINavigationController *shopMail = [[UINavigationController alloc] initWithRootViewController:shopMailView];
    UINavigationController *myCenter = [[UINavigationController alloc] initWithRootViewController:myCenterView];
    
    
    
    //设置颜色
    [UINavigationBar appearance].tintColor  =[ UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.074 green:0.804 blue:0.831 alpha:1.000];
    [UITabBar appearance].tintColor =[UIColor colorWithRed:0.074 green:0.804 blue:0.831 alpha:1.000];
    [UITabBar appearance].barTintColor = [UIColor  whiteColor];
    
    tabBarController = [[UITabBarController alloc]init];
    tabBarController.view.tintColor = [UIColor blueColor];
    tabBarController.viewControllers = @[home,baoMing,shopMail,myCenter];
    NSArray *titleList = @[@"首页",@"报名",@"商城",@"我的"];
    NSArray *IconList = @[@"0",@"1",@"2",@"3"];
    for (int i = 0 ; i < titleList.count; i ++) {
        UITabBarItem *item = tabBarController.tabBar.items[i];
        item.title = titleList[i];
        item.image = [UIImage imageNamed:IconList[i]];
    }
    
    tabBarController.selectedIndex = 0;
    
    self.window.rootViewController = tabBarController;
    
}

#pragma mark --网络状态
-(void)changeState:(NSNotification *)not{
    Reachability *reach = not.object;
    
    switch (reach.currentReachabilityStatus) {
        case NotReachable: {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"没有网络,请先设置网络" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            break;
        }
            
        default: {
            break;
        }
    }

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
