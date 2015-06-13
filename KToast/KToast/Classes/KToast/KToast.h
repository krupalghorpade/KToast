//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Krupal Ghorpade. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//


#import <Foundation/Foundation.h>

@interface KToast : NSObject
{
    //DATA MEMBERS
    NSString *messageString;
    NSString *fontNameString;
    CGFloat fontSize;
    CGFloat heightToShow;
    
    //VIEWs
    UIView *backgroundView;
    UILabel *lblMessage;
    
}

//MEMBER FUNCTIONS
//DEPRECATED_MSG_ATTRIBUTE("KToast is available only on iOS8.0+")
+ (void)showWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(CGFloat)size NS_AVAILABLE_IOS(8_0);
- (id)initWithKToastWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(CGFloat)size withBottomOffset:(CGFloat)offset NS_AVAILABLE_IOS(8_0);
- (void)show  NS_AVAILABLE_IOS(8_0);
@end
