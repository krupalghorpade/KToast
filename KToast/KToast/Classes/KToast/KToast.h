//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Mobisoft Infotech Pvt. Ltd. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//
 
#import <Foundation/Foundation.h>

@interface KToast : NSObject
{
    //DATA MEMBERS
    NSString *messageString;
    NSString *fontNameString;
    float fontSize;
    float heightToShow;
    
    //VIEWs
    UIView *backgroundView;
    UILabel *lblMessage;
    
}
//MEMBER FUNCTIONS
- (id)initWithKToastWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(float)size showAtHeight:(float)height;

- (void)show;

@end
