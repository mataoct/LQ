//
//  InfoDetailViewController.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoDetailViewController.h"

@interface InfoDetailViewController ()

@end

@implementation InfoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)str Model:(InfoModel *)model
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _model = [[InfoModel alloc] init];
        
        _model = model;
        
        self.title = @"活动资讯详情";
        
        _commentResponseModel = [[CommentListResponseModel alloc] init];
        _commentRequestModel = [[CommentReuqestModel alloc] initWithStart:@"0" Limit:@"10" Gid:model.newid];
        
        _commentRequestModel.delegate = self;
        _commentRequestModel.tag = 10002;
        [_commentRequestModel postActionComment];
        
        
        
        
        _userCommentRequestModel = [[UserCommentRequestModel alloc] initWithUid:[CoreHelper getLoginUid]];
        
        
        
    }
    return self;
}

-(id)initWithTitle:(NSString *)str NewsId:(NSString *)newsId
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _model = [[InfoModel alloc] init];
        
        _newsId = newsId;
        
        _requestModel = [[InfoDetailRequestModel alloc] initWithNewID:_newsId];
        _requestModel.delegate = self;
        [_requestModel postData];
        
        
        _commentResponseModel = [[CommentListResponseModel alloc] init];
        _commentRequestModel = [[CommentReuqestModel alloc] initWithStart:@"0" Limit:@"10" Gid:_newsId];
        _commentRequestModel.delegate = self;
        _commentRequestModel.tag = 10002;
        
        _userCommentRequestModel = [[UserCommentRequestModel alloc] initWithUid:[CoreHelper getLoginUid]];
        
        
        self.title = @"活动资讯详情";
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    
    
    UIView *subTemp = [[UIView alloc] initWithFrame:CGRectMake(10, 74, 300, 340)];
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 320)];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 300, 20)];
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, 300, 12)];
    _mainImageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 280, 150)];
    _contentText = [[UITextView alloc] initWithFrame:CGRectMake(10, 210, 280, 100)];
    _contentText.editable = false;
    _contentText.userInteractionEnabled = false;
    
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _contentText.font = [UIFont systemFontOfSize:14];
    
    [temp addSubview:_titleLabel];
    [temp addSubview:_mainImageview];
    [temp addSubview:_contentText];
    [temp addSubview:_timeLabel];
    
    temp.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = BackGray;
    
    UIView *temp2 = [[UIView alloc] initWithFrame:CGRectMake(0, 321, 300, 19)];
    temp2.backgroundColor = [UIColor whiteColor];
    
    _tableTitleImgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2, 15, 15)];
    //    _tableTitleImgview.backgroundColor = [UIColor purpleColor];
    [_tableTitleImgview setImage:[UIImage imageNamed:@"评论标题图标.png"]];
    _commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 2, 60, 15)];
    _commentCountLabel.font = [UIFont systemFontOfSize:12];
    [temp2 addSubview:_tableTitleImgview];
    [temp2 addSubview:_commentCountLabel];
    [subTemp addSubview:temp];
    [subTemp addSubview:temp2];
    
    //评论列表
    
    _commentTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 20 - 44 - 50)];
    _commentTable.tableHeaderView = subTemp;
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    _commentTable.backgroundColor = BackGray;
    _commentTable.showsVerticalScrollIndicator = false;
    
    [self.view addSubview:_commentTable];
    
    
    //输入框：
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, 320, 40)];
    
	_textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(6, 3, 240, 40)];
    _textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
	_textView.minNumberOfLines = 1;
	_textView.maxNumberOfLines = 6;
	_textView.returnKeyType = UIReturnKeyDone; //just as an example
	_textView.font = [UIFont systemFontOfSize:15.0f];
	_textView.delegate = self;
    _textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, 320, 40)];
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
    

    
    [self fillWithModel];
}


-(void)fillWithModel
{
    
    _titleLabel.text = _model.title;
    _timeLabel.text = _model.dateLine;
    [_mainImageview setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认2.png"] success:nil failure:nil];
    _contentText.text = _model.summary;
    
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

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
            //
            _model = (InfoModel *)model;
            [self fillWithModel];
            
            //请求评论列表：
            [_commentRequestModel postActionComment];
            
            break;
        case 10002: //请求评论列表结果
            
            _commentResponseModel = (CommentListResponseModel *)model;
            
            [_commentTable reloadData];
            _commentCountLabel.text = [NSString stringWithFormat:@"评论(%d)", _commentResponseModel.commentNum];
            
            break;
        case 10003: //发起评论结果
            
            [SVProgressHUD showSuccessWithStatus_custom:@"评论成功" duration:1.2];
            
            [_textView resignFirstResponder];
            
            [_commentRequestModel postActionComment];
            _textView.text = @"";
            break;
        default:
            break;
    }

}

-(void)requestFailed:(NSString *)errorStr
{
    NSLog(@"%@",errorStr);
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
    
    [_userCommentRequestModel sendActionComment:_model.newid message:_textView.text];
    //等待请求完成
	[_textView resignFirstResponder];
    _textView.text = @"";
}

- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView
{
    return [_textView resignFirstResponder];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
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



@end
