//
//  AppDelegate.m
//  MyApp
//
//  Created by ZLL on 2019/5/13.
//  Copyright © 2019 zll. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLLNewsViewController.h"
#import "TVVideoViewController.h"
#import "RecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ZLLNewsViewController *newsVC = [[ZLLNewsViewController alloc] init];
    newsVC.view.backgroundColor = [UIColor redColor];
    newsVC.tabBarItem.title = @"新闻";
    newsVC.tabBarItem.image = [UIImage imageNamed:@"新闻"];
    newsVC.tabBarItem.selectedImage = [UIImage imageNamed:@"新闻选择"];

    TVVideoViewController *videoVC = [[TVVideoViewController alloc] init];
    videoVC.view.backgroundColor = [UIColor yellowColor];
    videoVC.tabBarItem.title = @"视频";
    videoVC.tabBarItem.image = [UIImage imageNamed:@"视频"];
    videoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"视频选择"];

    RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
    recommendVC.view.backgroundColor = [UIColor grayColor];
    recommendVC.tabBarItem.title = @"推荐";
    recommendVC.tabBarItem.image = [UIImage imageNamed:@"推荐"];
    recommendVC.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐选择"];

    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor greenColor];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"我的"];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"我的选择"];

    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.delegate = self;
    [tab setViewControllers:@[newsVC, videoVC, recommendVC, mineVC]];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tab];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"did selected");
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

@end
