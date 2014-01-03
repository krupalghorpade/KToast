//
//  AppDelegate.m
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Mobisoft Infotech Pvt. Ltd. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//
 
#import "AppDelegate.h"

#import "ParentViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self startupApp];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

- (void)startupApp
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    parentViewController = [[ParentViewController alloc]init];
    
    float height = self.window.bounds.size.height;
        
    parentViewController.view.frame = CGRectMake(0, 0, 320, height);
    
    self.window.rootViewController = parentViewController;
    
    [self.window makeKeyAndVisible];
 
}
@end