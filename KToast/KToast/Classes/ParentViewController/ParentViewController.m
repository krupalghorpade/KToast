//
//  ParentViewController.m
//  KToast
//
//  Created by Krupal Ghorpade on 02/01/14.
//  Copyright (c) 2014 Mobisoft Infotech Pvt. Ltd. All rights reserved.
//  This is an open source software licensed under the terms of MIT License.
//  Please check http://opensource.org/licenses/MIT
//


#import "ParentViewController.h"
#import "KToast.h"

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
    background.frame  = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height);
    background.alpha = 0.8;
    [self.view addSubview:background];
}

- (void)addInfoLabel
{
    UILabel * lblTapAnywhere = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 44)];
    
    lblTapAnywhere.center = CGPointMake(160, [UIScreen mainScreen].bounds.size.height-66);
    
    lblTapAnywhere.text = @"Tap anywhere to see KToast!";
    
    lblTapAnywhere.textAlignment = NSTextAlignmentCenter;
    
    lblTapAnywhere.backgroundColor = [UIColor clearColor];
    
    lblTapAnywhere.font = [UIFont systemFontOfSize:14];
    
    lblTapAnywhere.textColor = [UIColor whiteColor];
    
    [self.view addSubview:lblTapAnywhere];
}

#pragma mark - TOUCH DELEGATES
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch  = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    
    
    //AND THE ONLY THING YOU HAVE TO DO IS
    kToast =  [[KToast alloc]initWithKToastWithMessage:@"This is KToast! and this looks nice here!" withFontName:@"Helvetica-Bold" withFontSize:14 showAtHeight:location.y];
     
    [kToast show];
    
}

#pragma mark - MEMORY MANAGEMENT
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
