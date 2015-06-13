//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Krupal Ghorpade. All rights reserved.
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
    
    self.window.rootViewController = self.parentViewController;
    
    self.parentViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.window makeKeyAndVisible];
 
}

#pragma mark - GETTER
- (ParentViewController *)parentViewController
{
    if (!_parentViewController) {
        _parentViewController = [[ParentViewController alloc] init];
    }
    return _parentViewController;
}
@end


@interface UIViewController(Orientation)

@end
@implementation UIViewController (Orientation)

- (BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end