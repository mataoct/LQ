//
//  UserModifyViewController.m
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserModifyViewController.h"

@interface UserModifyViewController ()

@property (nonatomic,strong) UIScrollView *subScorller;

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
    
    
    _subScorller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    
    _user = [[UserInfoModel alloc] init];
    _user = [CoreHelper getLoginInfo];
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 29, 44, 24)];
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
    
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 90)];
    _headView.backgroundColor = [UIColor whiteColor];
    
    
    
//    @property (nonatomic,strong) UILabel *nameLabel;
//    @property (nonatomic,strong) UITextField *nameTf;
//    @property (nonatomic,strong) UILabel *nickLabel;
//    @property (nonatomic,strong) UITextField *nickTf;
    
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 100, 16)];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    _nameLabel.text = @"账号：";
    
    _nameTf = [[UITextField alloc] initWithFrame:CGRectMake(10, 131, 300, 36)];
    _nameTf.backgroundColor = [UIColor whiteColor];
    _nameTf.font = [UIFont systemFontOfSize:12];
    
    
    _nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 176, 100, 16)];
    _nickLabel.font = [UIFont systemFontOfSize:12];
    _nickLabel.text = @"昵称：";
    
    _nickTf = [[UITextField alloc] initWithFrame:CGRectMake(10, 197, 300, 36)];
    _nickTf.backgroundColor = [UIColor whiteColor];
    _nickTf.font = [UIFont systemFontOfSize:12];
    
    
    [_headView addSubview:_headImg];
    [_headView addSubview:_headLabel];
    
    [_subScorller addSubview:_headView];
    [_subScorller addSubview:_nameLabel];
    [_subScorller addSubview:_nameTf];
    [_subScorller addSubview:_nickLabel];
    [_subScorller addSubview:_nickTf];
    
    
    _subScorller.userInteractionEnabled = YES;
    _subScorller.scrollEnabled = YES;
    _subScorller.contentSize = CGSizeMake(320, _subScorller.frame.size.height + 1);
    [self.view addSubview:_subScorller];
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

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    
    
    switch (buttonIndex) {
        case 0:
        {
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                NSLog(@"sorry, no camera or camera is unavailable.");
                return;
            }
            //获得相机模式下支持的媒体类型
            NSArray* availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            BOOL canTakePicture = NO;
            for (NSString* mediaType in availableMediaTypes) {
                if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
                    //支持拍照
                    canTakePicture = YES;
                    break;
                }
            }
            //检查是否支持拍照
            if (!canTakePicture) {
                NSLog(@"sorry, taking picture is not supported.");
                return;
            }
            
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
            
        }
            break;
        case 1:
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"image info %@",info);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *temp = [[UIImage alloc] init];
    temp = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [_headImg setImage:temp];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editInfo {
    
    
    NSLog(@"image EditInfo %@",editInfo);
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }];
    
}


@end
