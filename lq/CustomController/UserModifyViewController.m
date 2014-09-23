//
//  UserModifyViewController.m
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserModifyViewController.h"

@interface UserModifyViewController ()

@end

@implementation UserModifyViewController

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
    // Do any additional setup after loading the view.
    
    
    _user = [[UserInfoModel alloc] init];
    _user = [CoreHelper getLoginInfo];
    
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 44, 24)];
    _headLabel.font = [UIFont systemFontOfSize:16];
    _headLabel.text = @"头像";
    
    _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(210, 9, 72, 72)];
    _headImg.userInteractionEnabled = YES;
    [_headImg setImageWithURL:_user.avatar placeholderImage:[UIImage imageNamed:@"头像-评论.png"] success:nil failure:nil];
    
    
    
    _headImg.layer.cornerRadius = 36.0;
    _headImg.layer.masksToBounds = YES;
    _headImg.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *tapHeadImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeadImage:)];
    [_headImg addGestureRecognizer:tapHeadImage];
    
    _photoSheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"照片", nil];
    _photoSheet.delegate = self;
    
    
    
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(10, 74, 300, 90)];
    _headView.backgroundColor = [UIColor whiteColor];
    
    [_headView addSubview:_headImg];
    [_headView addSubview:_headLabel];
    
    [self.view addSubview:_headView];
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

-(void)tapHeadImage:(UIGestureRecognizer *)gesture
{
//    [_photoSheet showFromTabBar:self.tabBarController.tabBar];
    
    [_photoSheet showInView:self.view];
}

@end
