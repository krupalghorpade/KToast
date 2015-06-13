//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Krupal Ghorpade. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//
 
#import "KToast.h"
#import <QuartzCore/QuartzCore.h>

@implementation KToast

+ (void)showWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(CGFloat)size {
   KToast* kToast =  [[KToast alloc]initWithKToastWithMessage:message withFontName:fontName withFontSize:size withBottomOffset:44];
    [kToast show];
}
- (id)initWithKToastWithMessage:(NSString*)message withFontName:(NSString*)fontName withFontSize:(CGFloat)size withBottomOffset:(CGFloat)offset
{
    self = [super init];
    if (self) {
        messageString = message;
        
        fontNameString = fontName;
        
        fontSize = size;
        
        heightToShow = offset;
        
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
    
    lblMessage.translatesAutoresizingMaskIntoConstraints = NO;
    
    lblMessage.layer.cornerRadius = 6;
    
    lblMessage.lineBreakMode = NSLineBreakByTruncatingTail;
    
    lblMessage.numberOfLines = 0;
    
}

- (void)configureAndAddBackgroundView
{
    backgroundView = [[UIView alloc]init];
    
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
    [backgroundView removeFromSuperview];
    backgroundView = nil;
    
}

#pragma mark - PUBLIC METHODS
- (void)show
{

    NSAssert(!([[[UIDevice currentDevice]systemVersion]floatValue]<8.0), @"KToast is only available for iOS8+");
    
    lblMessage.translatesAutoresizingMaskIntoConstraints = NO;
    backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [backgroundView addSubview:lblMessage];
    
    
    
    id instance = [[UIApplication sharedApplication].windows objectAtIndex:0];
    [instance addSubview:backgroundView];

    
    NSDictionary *attributes = @{NSFontAttributeName: lblMessage.font};

    UIView * superview = (UIView*)instance;
    CGRect rect =     [lblMessage.text boundingRectWithSize:CGSizeMake(superview.frame.size.width, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:attributes
                                                    context:nil];
    
    if (rect.size.height<30) {
        rect.size.height = 30;
    }
    
    if ((rect.size.width+20)>superview.bounds.size.width) {
        rect.size.width = superview.bounds.size.width-20;
    }
    
    
    [instance addConstraint:[NSLayoutConstraint constraintWithItem:instance
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:backgroundView
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1
                                                            constant:0]];
    
    
    [instance addConstraint:[NSLayoutConstraint constraintWithItem:instance
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:backgroundView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:heightToShow]];

    [backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1
                                                          constant:rect.size.width+20]];

    [instance addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:0.5
                                                          constant:rect.size.height]];
    
    
    
    
    [backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:lblMessage
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:-5]];

    [backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:lblMessage
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:5]];
    
    
    [backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:lblMessage
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
    
    [backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:lblMessage
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];

    backgroundView.alpha = 0;
    
    
    //START ANIMATION
    [UIView animateWithDuration:0.4f
                     animations:^
     {
         backgroundView.alpha = 1;
     }
                     completion:^(BOOL finish)
     {
         [self performSelector:@selector(animateAndRemoveKToast) withObject:nil afterDelay:1.0];
     }];
    
}

@end
