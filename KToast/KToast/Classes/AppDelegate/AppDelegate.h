//
//  AppDelegate.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Mobisoft Infotech Pvt. Ltd. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//
 
#import <UIKit/UIKit.h>

@class ParentViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    ParentViewController * parentViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
