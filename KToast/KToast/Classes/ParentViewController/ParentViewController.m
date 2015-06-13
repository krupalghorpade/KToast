//
//  KToast.h
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Krupal Ghorpade. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//

#import "ParentViewController.h"
#import "KToast.h"
#import <Foundation/NSURLSession.h>

@interface ParentViewController ()
{

}
@end

@implementation ParentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}

#pragma mark - VIEW LIFE CYCLE

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addBackground];
    
    [self addInfoLabel];
    
}
  
# pragma mark - PRIVATE METHODS
- (void)addBackground
{
    UIImageView * background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Default.png"]];
    background.alpha = 0.8;
    [self.view addSubview:background];
    background.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:background
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:background
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:background
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:background
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:0]];
    

}

- (void)addInfoLabel
{
    UILabel * lblTapAnywhere = [[UILabel alloc]init];
    
    lblTapAnywhere.text = @"Tap anywhere to see KToast!";
    
    lblTapAnywhere.textAlignment = NSTextAlignmentCenter;
    
    lblTapAnywhere.backgroundColor = [UIColor clearColor];
    
    lblTapAnywhere.font = [UIFont systemFontOfSize:14];
    
    lblTapAnywhere.textColor = [UIColor whiteColor];
    
    [self.view addSubview:lblTapAnywhere];
    
    lblTapAnywhere.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblTapAnywhere
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblTapAnywhere
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.5
                                                           constant:0]];

}

#pragma mark - TOUCH DELEGATES
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //UITouch * touch  = [touches anyObject];
    //CGPoint location = [touch locationInView:[touch view]];
    

    //AND THE ONLY THING YOU HAVE TO DO IS
    
    
    [KToast showWithMessage:@"This is KToast! and this looks nice here!" withFontName:@"Helvetica-Bold" withFontSize:12];
    
    //OR

    /*
    kToast = [[KToast alloc]initWithKToastWithMessage:@"This is KToast! and this looks nice here!"
                                         withFontName:@""
                                         withFontSize:10
                                     withBottomOffset:44];
    [kToast show];
   */

    
    
}

#pragma mark - MEMORY MANAGEMENT
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
