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

@property (nonatomic,strong) NSString *sex;

@property (nonatomic,strong) UIBarButtonItem *rightButton;

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
    _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    self.item.rightBarButtonItem = _rightButton;
    
    _subScorller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    _sex = [[NSString alloc] init];
    
    _user = [[UserInfoModel alloc] init];
    _user = [CoreHelper getLoginInfo];
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 29, 44, 24)];
    _headLabel.font = [UIFont systemFontOfSize:16];
    _headLabel.text = @"头像";
    
    _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(210, 9, 72, 72)];
//    _headImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 9, 72, 72)];
    
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
    [_headView addSubview:_headImg];
//    [_headView addSubview:_headImg2];
    [_headView addSubview:_headLabel];
    
    
    UIView *nameView = [[UIView alloc] initWithFrame:CGRectMake(10, 110, 300, 39)];
    nameView.backgroundColor = [UIColor whiteColor];
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 48, 39)];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.text = @"账号 ";
    _nameLabel.backgroundColor = [UIColor whiteColor];
    
    _nameTf = [[UITextField alloc] initWithFrame:CGRectMake(58, 0, 242, 39)];
    _nameTf.backgroundColor = [UIColor whiteColor];
    _nameTf.font = [UIFont systemFontOfSize:16];
    _nameTf.text = _user.phone;
    
    [nameView addSubview:_nameLabel];[nameView addSubview:_nameTf];
    
    
    UIView *nickView = [[UIView alloc] initWithFrame:CGRectMake(10, 150, 300, 39)];
    nickView.backgroundColor = [UIColor whiteColor];
    _nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 48, 39)];
    _nickLabel.font = [UIFont systemFontOfSize:16];
    _nickLabel.text = @"昵称 ";
    _nickLabel.backgroundColor = [UIColor whiteColor];
    
    _nickTf = [[UITextField alloc] initWithFrame:CGRectMake(58, 0, 242, 39)];
    _nickTf.backgroundColor = [UIColor whiteColor];
    _nickTf.font = [UIFont systemFontOfSize:16];
    _nickTf.text = _user.nickName;
    [nickView addSubview:_nickLabel];[nickView addSubview:_nickTf];
    
    _nickTf.returnKeyType = UIReturnKeyDone;
    _nameTf.returnKeyType = UIReturnKeyDone;
    _nickTf.delegate = self;
    _nameTf.delegate = self;
    
    _pwdChangeBtn = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 190, 320, 40)];
//    _pwdChangeBtn.font = [UIFont systemFontOfSize:14];
    _pwdChangeBtn.textLabel.text = @"修改密码";
    
    [_pwdChangeBtn addTarget:self action:@selector(pwdChange) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *sexView = [[UIView alloc] initWithFrame:CGRectMake(10, 240, 300, 40)];
    sexView.backgroundColor = [UIColor whiteColor];
    _sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
    _sexLabel.font = [UIFont systemFontOfSize:16];
    _sexLabel.text = @"性别 ";
    
    
    _maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 100, 40)];
    _femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 100, 40)];
    
    [_maleBtn setTitle:@"男" forState:UIControlStateNormal];
    [_femaleBtn setTitle:@"女" forState:UIControlStateNormal];
    _femaleBtn.backgroundColor = BackGray;_maleBtn.backgroundColor = BackGray;
    
    [self setSexMaleOrFemale:_user.sex];
    
    [sexView addSubview:_sexLabel];[sexView addSubview:_maleBtn];[sexView addSubview:_femaleBtn];
    
    [_subScorller addSubview:_headView];
    [_subScorller addSubview:nameView];
    [_subScorller addSubview:nickView];
    [_subScorller addSubview:sexView];
//    [_subScorller addSubview:_nickTf];
    [_subScorller addSubview:_pwdChangeBtn];
//    [_subScorller addSubview:_sexLabel];
    
    
    _subScorller.userInteractionEnabled = YES;
    _subScorller.scrollEnabled = YES;
    _subScorller.contentSize = CGSizeMake(320, _subScorller.frame.size.height + 1);
    
    _requestModel = [[UpdateUserInfoModel alloc] init];
    
    [self.view addSubview:_subScorller];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _nameTf || textField == _nickTf) {
        
        
        [textField resignFirstResponder];
    }
    return YES;
}

-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	// get a rect for the textView frame
    //	CGRect containerFrame = _orderTable.frame;
    //    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	// set views with new info
    //	_orderTable.frame = containerFrame;
	_subScorller.frame = CGRectMake(0, 64, 320, self.view.frame.size.height - keyboardBounds.size.height + 49);
    [_subScorller setContentSize:CGSizeMake(320, self.view.frame.size.height - keyboardBounds.size.height + 50)];
    [_subScorller setContentOffset:CGPointMake(0, 60) animated:YES];
    //    _orderTable.contentOffset =
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	// get a rect for the textView frame
    //	CGRect containerFrame = _orderTable.frame;
    //    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	// set views with new info
    //	_containerView.frame = containerFrame;
	_subScorller.frame = CGRectMake(0, 64, 320, self.view.frame.size.height);
    [_subScorller setContentSize:CGSizeMake(320, self.view.frame.size.height + 1)];
    [_subScorller setContentOffset:CGPointMake(0, 0) animated:YES];
	// commit animations
	[UIView commitAnimations];
}


-(void)pwdChange
{
    //
    
    PwdModifyViewController * pmVC = [[PwdModifyViewController alloc] initWithTitle:@"修改密码"];
    [self presentViewController:pmVC animated:YES completion:nil];
}


-(void)maleClick
{
    [self setSexMaleOrFemale:0];
}

-(void)femaleClick
{
    [self setSexMaleOrFemale:1];
}

-(void)setSexMaleOrFemale:(NSInteger)str
{
    
    if (str == 0) {
        [_maleBtn setBackgroundImage:[UIImage imageNamed:@"male_select@2x.png"] forState:UIControlStateNormal];
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"female@2x.png"] forState:UIControlStateNormal];
        _sex = @"0";
    }
    else
    {
        [_maleBtn setBackgroundImage:[UIImage imageNamed:@"male@2x.png"] forState:UIControlStateNormal];
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"female_select@2x.png"] forState:UIControlStateNormal];
        _sex = @"1";
    }
    
}

-(void)selectRightAction:(id)sender
{

    _requestModel.nickName = _nickTf.text;
    _requestModel.sellerId = @"100";
    _requestModel.uid = _user.uid;
    _requestModel.avatar = [UIImageJPEGRepresentation(_headImg.image, 0.1) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    
    
    
    
    _requestModel.sex = _sex;
    _requestModel.delegate = self;
    [_requestModel postData];
    
    
//    [_headImg2 setImage:[UIImage imageWithData:[[NSData alloc] initWithBase64EncodedString:_requestModel.avatar options:NSDataBase64DecodingIgnoreUnknownCharacters]]];
    
    
}


-(void)requestFailed:(NSString *)errorStr
{
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.2];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    [SVProgressHUD showSuccessWithStatus_custom:@"修改成功" duration:1.2];
}

@end
