//
//  WaterDetailViewController.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterDetailViewController.h"

@interface WaterDetailViewController ()

@end

@implementation WaterDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)str andPid:(NSString *)pid
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _pid = [[NSString alloc] init];
        _pid = pid;
        
        
        _waterDetailRequestModel = [[WaterDetailRequestModel alloc] initWithPid:_pid];
        _waterDetailResponseModel = [[WaterDetailResponseModel alloc] init];
        _userCommentRequestModel = [[UserCommentRequestModel alloc] initWithUid:@"100"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:)
													 name:UIKeyboardWillHideNotification
												   object:nil];
        
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 300, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _viewCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 50, 20)];
    _viewCountLabel.font = [UIFont systemFontOfSize:12];
    
    
    _commentNumLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(240, 30, 50, 20)];
    _commentNumLabel1.font = [UIFont systemFontOfSize:12];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 280, 200)];
    _detailText = [[UITextView alloc] initWithFrame:CGRectMake(10, 240, 280, 110)];
    _detailText.font = [UIFont systemFontOfSize:14];
    
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 300, 37)];
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 10)];tempLabel.backgroundColor = BackGray;
    _commentHeadLabel = [[UIImageView alloc] initWithFrame:CGRectMake(10, 17, 15, 15)];
    [_commentHeadLabel setImage:[UIImage imageNamed:@"评论标题图标.png"]];
    _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 100, 15)];
    _commentNumLabel.font = [UIFont systemFontOfSize:12];
    UILabel *tempLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 36, 300, 1)];tempLabel2.backgroundColor = BackGray;
    [temp addSubview:tempLabel];[temp addSubview:tempLabel2];
    [temp addSubview:_commentHeadLabel];
    [temp addSubview:_commentNumLabel];
    
    
    
    
    UIView *tableHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 387)];
    
    
    [tableHeader addSubview:_titleLabel];
    [tableHeader addSubview:_imgView];
    [tableHeader addSubview:_commentNumLabel1];
    [tableHeader addSubview:_viewCountLabel];
    [tableHeader addSubview:_detailText];
    
    [tableHeader addSubview:temp];
//    [tableHeader addSubview:_commentHeadLabel];
    
    tableHeader.backgroundColor = [UIColor whiteColor];
    
    _commentTable  = [[UITableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 74 -40 ) style:UITableViewStylePlain];
    
    _commentTable.tableHeaderView = tableHeader;
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    [self.view addSubview:_commentTable];
    
    _commentTable.backgroundColor = BackGray;
    
    
    _waterDetailRequestModel.delegate = self;
    _waterDetailRequestModel.tag = 10001;
    [_waterDetailRequestModel postData];
    
    
    
    //填充UI
    
}

-(void)reFillLayouts
{

    _titleLabel.text = _waterDetailResponseModel.title;
    [_imgView setImageWithURL:_waterDetailResponseModel.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    _viewCountLabel.text = [NSString stringWithFormat:@"浏览：%@", _waterDetailResponseModel.myViews];
    _commentNumLabel1.text = [NSString stringWithFormat:@"评论：%@", _waterDetailResponseModel.commentNum];
     _commentNumLabel.text = [NSString stringWithFormat:@"评论(%@)", _waterDetailResponseModel.commentNum];
    _detailText.text = _waterDetailResponseModel.myDescription;
    _detailText.editable = false;
//
//    

    
    //        //评论框
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, 320, 40)];
    
    _textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(6, 3, 240, 40)];
    _textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    _textView.minNumberOfLines = 1;
    _textView.maxNumberOfLines = 6;
    _textView.returnKeyType = UIReturnKeyDone; //just as an example
    _textView.font = [UIFont systemFontOfSize:15.0f];
    _textView.delegate = self;
    _textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    _textView.backgroundColor = [UIColor whiteColor];
    
    // textView.text = @"test\n\ntest";
    // textView.animateHeightChange = NO; //turns off animation
    
    [self.view addSubview:_containerView];
    
    UIImage *rawEntryBackground = [UIImage imageNamed:@"MessageEntryInputField.png"];
    UIImage *entryBackground = [rawEntryBackground stretchableImageWithLeftCapWidth:13 topCapHeight:22];
    UIImageView *entryImageView = [[UIImageView alloc] initWithImage:entryBackground];
    entryImageView.frame = CGRectMake(5, 0, 248, 40);
    entryImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIImage *rawBackground = [UIImage imageNamed:@"MessageEntryBackground.png"];
    UIImage *background = [rawBackground stretchableImageWithLeftCapWidth:13 topCapHeight:22];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
    imageView.frame = CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height);
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    // view hierachy
    [_containerView addSubview:imageView];
    [_containerView addSubview:_textView];
    [_containerView addSubview:entryImageView];
    
    UIImage *sendBtnBackground = [[UIImage imageNamed:@"MessageEntrySendButton.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    UIImage *selectedSendBtnBackground = [[UIImage imageNamed:@"MessageEntrySendButton.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    doneBtn.frame = CGRectMake(_containerView.frame.size.width - 69, 8, 63, 27);
    doneBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [doneBtn setTitle:@"发送" forState:UIControlStateNormal];
    
    [doneBtn setTitleShadowColor:[UIColor colorWithWhite:0 alpha:0.4] forState:UIControlStateNormal];
    doneBtn.titleLabel.shadowOffset = CGSizeMake (0.0, -1.0);
    doneBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(resignTextView) forControlEvents:UIControlEventTouchUpInside];
    [doneBtn setBackgroundImage:sendBtnBackground forState:UIControlStateNormal];
    [doneBtn setBackgroundImage:selectedSendBtnBackground forState:UIControlStateSelected];
    [_containerView addSubview:doneBtn];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
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





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSLog(@"%d",_commentResponseModel.commentNum);
    return _commentResponseModel.commentNum?_commentResponseModel.commentNum:0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    return nil;
    
    
    static NSString *identifierString = @"cell";
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
        
    }
    [cell fillWithModel:[_commentResponseModel.commentArr objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

-(void)requestFailed
{
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    switch (model.ResponseTag) {
        case 10001:
        {
            _waterDetailResponseModel = (WaterDetailResponseModel *)model;
            
            [self reFillLayouts];
            
            _commentRequestModel = [[CommentReuqestModel alloc] initWithStart:@"0" Limit:@"10" Gid:_waterDetailResponseModel.pid];
            _commentResponseModel = [[CommentListResponseModel alloc] init];
            
            _commentRequestModel.delegate = self;
            _commentRequestModel.tag = 10002;
            [_commentRequestModel postDataWaterFlow];
        }
            break;
        case 10002:
        {
            _commentResponseModel = (CommentListResponseModel *)model;
            [_commentTable reloadData];
        }
            break;
            
        case 10003:
        {
            
            NSLog(@"评论成功");
            
            [_textView resignFirstResponder];
            
            [_commentRequestModel postDataWaterFlow];
            _textView.text = @"";
        }
            break;
            
        default:
            break;
    }
    

    
}







//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	// get a rect for the textView frame
	CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	// set views with new info
	_containerView.frame = containerFrame;
	_commentTable.frame = CGRectMake(10, 64, 300, self.view.frame.size.height - 20 - 44 - 40 - keyboardBounds.size.height);
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	// get a rect for the textView frame
	CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	// set views with new info
	_containerView.frame = containerFrame;
	_commentTable.frame = CGRectMake(10, 64, 300, self.view.frame.size.height - 20 - 44 - 40);
	// commit animations
	[UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
	CGRect r = _containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	_containerView.frame = r;
}


-(void)resignTextView
{
    
    //发起评论请求
    
    _userCommentRequestModel.delegate = self;
    _userCommentRequestModel.tag = 10003;
    
    [_userCommentRequestModel sendPicComment:_pid message:_textView.text];
    
    
    
    
    //等待请求完成

}

@end
