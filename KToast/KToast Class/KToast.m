//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Krupal Ghorpade. All rights reserved.
//

#import "KToast.h"
#import <QuartzCore/QuartzCore.h>

@implementation KToast
- (id)initWithKToastWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(float)size showAtHeight:(float)height
{
    self = [super init];
    if (self) {
        messageString = message;
        
        fontNameString = fontName;
        
        fontSize = size;
        
        heightToShow = height;
        
        [self configureMessageLabel];
        
        [self configureAndAddBackgroundView];
        
    }
    return self;
}

#pragma mark - PRIVATE METHODS

- (void)configureMessageLabel
{
    lblMessage = [[UILabel alloc]init];
    
    lblMessage.text = messageString;
    
    lblMessage.textAlignment = NSTextAlignmentCenter;
    
    lblMessage.font = [UIFont fontWithName:fontNameString size:fontSize];
    
    lblMessage.textColor = [UIColor whiteColor];
    
    lblMessage.backgroundColor = [UIColor clearColor];
    
    lblMessage.frame = CGRectMake(0, 0,[lblMessage sizeThatFits:CGSizeZero].width,[lblMessage sizeThatFits:CGSizeZero].height);
}

- (void)configureAndAddBackgroundView
{
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lblMessage.frame.size.width+20,lblMessage.frame.size.height+20)];
    
    backgroundView.center = CGPointMake(160, heightToShow);
    
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.65];
    
    backgroundView.layer.cornerRadius = 6;
}
- (void)animateAndRemoveKToast
{
    [UIView animateWithDuration:0.6f
                     animations:^
     {
         backgroundView.alpha = 0;
     }
                     completion:^(BOOL finish)
     {
         [self removeKToastFromParent];
     }];
}

- (void)removeKToastFromParent
{
    //THIS IS OPTIONAL, BUT I MADE IT.
    for (UIView *subView in backgroundView.subviews)
    {
        [subView removeFromSuperview];
        //DO NOT CALL subView = nil SINCE subView IS NOT __STRONG
    }
    
    [backgroundView removeFromSuperview];
    backgroundView = nil;
    
}

#pragma mark - PUBLIC METHODS
- (void)show
{
    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:backgroundView];

    
    //ALIGN LABEL AT THE CENTER OF BGVIEW
    
    lblMessage.center = CGPointMake(backgroundView.frame.size.width/2, backgroundView.frame.size.height/2);
    
    [backgroundView addSubview:lblMessage];
    
    backgroundView.alpha = 0;
    
    
    //START ANIMATION
    [UIView animateWithDuration:0.4f
                     animations:^
     {
         backgroundView.alpha = 1;
     }
                     completion:^(BOOL finish)
     {
         [self performSelector:@selector(animateAndRemoveKToast) withObject:nil afterDelay:1.5];
     }];

}

@end
