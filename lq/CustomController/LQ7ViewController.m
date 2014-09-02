//
//  LQ7ViewController.m
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"

@interface LQ7ViewController ()
@end

@implementation LQ7ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIColor whiteColor], UITextAttributeTextColor,
                                  [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:0],UITextAttributeTextShadowColor,
                                  [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],UITextAttributeTextShadowOffset,
                                  [UIFont systemFontOfSize:18], UITextAttributeFont,
                                  nil]];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)showBackButton
{
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 13, 24);
    [btn setBackgroundImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backToPrevious)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = back;
}


-(void)backToPrevious
{
    //    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
//    else
//    {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
    
    NSLog(@"back");
    
    
}

@end
