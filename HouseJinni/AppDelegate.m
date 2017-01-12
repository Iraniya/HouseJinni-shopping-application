//
//  AppDelegate.m
//  HouseJinni
//
//  Created by agilemac-12 on 8/31/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SignUpViewController.h"
#import "Cart.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //if Application is open through notification jump to appropriate page
    //code pending //upadte after push and local notification 
    
    
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *viewControllerObject = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    
    UINavigationController *navigationObject = [[UINavigationController alloc]initWithRootViewController:viewControllerObject];
    
    self.window.rootViewController = navigationObject;
    
    [self.window makeKeyAndVisible];
    
    //init
    [self InitBeforeAppStarts];
    
    
    
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

#pragma mark - Init for App
-(void)InitBeforeAppStarts
{
    
    BOOL isMainAdmin = NO;
    NSUserDefaults *houseJinniAppUserDefaults = [NSUserDefaults standardUserDefaults];
    [houseJinniAppUserDefaults setBool:isMainAdmin forKey:@"isMainAdmin"];
    isMainAdmin = [houseJinniAppUserDefaults boolForKey:@"isMainAdmin"];
    [houseJinniAppUserDefaults synchronize];
    
    
    //for autologin and remember password for customer only
    
}

//inclde for tabBarController
//TabBadge
/*
- (void)updateCartTabBadge
{
    int total = [Cart totalProducts];
    //UITabBarItem *cartTab = [self.tabBarController.tabBar.items objectAtIndex:1];
    
    if(total == 0)
        cartTab.badgeValue = nil;
    else
        cartTab.badgeValue = [NSString stringWithFormat:@"%d", total];
}
*/
@end
