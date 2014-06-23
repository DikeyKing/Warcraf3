//
//  WAR3AppDelegate.m
//  Warcraft3
//
//  Created by Dikey on 4/1/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3AppDelegate.h"
#import "WAR3HumanViewController.h"
#import "WAR3OrcViewController.h"
#import "WAR3UDViewController.h"
#import "WAR3NEViewController.h"
#import "WAR3NeutralViewController.h"


@implementation WAR3AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    WAR3HumanViewController *humViewController = [WAR3HumanViewController new];
    WAR3OrcViewController *orcViewController = [WAR3OrcViewController new];
    WAR3UDViewController *udViewController = [WAR3UDViewController new];
    WAR3NEViewController *neViewController = [WAR3NEViewController new];
    WAR3NeutralViewController *neuViewController = [WAR3NeutralViewController new];
    
    UINavigationController *humNavController = [[UINavigationController alloc]initWithRootViewController:humViewController];
    UINavigationController *orcNavController = [[UINavigationController alloc]initWithRootViewController:orcViewController];
    UINavigationController *udNavController = [[UINavigationController alloc]initWithRootViewController:udViewController];
    UINavigationController *neNavController = [[UINavigationController alloc]initWithRootViewController:neViewController];
    UINavigationController *neoNavController = [[UINavigationController alloc]initWithRootViewController:neuViewController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    NSArray *viewControllers = @[humNavController ,orcNavController,udNavController,neNavController,neoNavController];
    
    tabBarController.viewControllers = viewControllers;
   
 
    
    
    [self.window setRootViewController:tabBarController];
    
    [self.window setBackgroundColor:[UIColor clearColor]];
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
