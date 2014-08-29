//
//  CouponDetailViewController.m
//  lq
//
//  Created by  matao on 14-8-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CouponDetailViewController.h"

@interface CouponDetailViewController ()

@end

@implementation CouponDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTitle:(NSString *)str andModel:(CouponModel *)model
{
    self = [super initWithTitle:str];
    if (self) {
        //
        _model = [[CouponModel alloc] init];
        _model = model;
        
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
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 45, 280, 200)];
//    _imgView.backgroundColor = [UIColor orangeColor];
    
    
    
    _extcreditLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 100, 16)];_extcreditLabel.text = @"兑换所需积分：";
    _extcreditValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 248, 40, 16)];
    _expireLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 268, 100, 16)];_expireLabel.text = @"有效期至：";
    _expireValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 268, 100, 16)];
    
    _extcreditLabel.font = [UIFont systemFontOfSize:12];
        _extcreditValueLabel.font = [UIFont systemFontOfSize:12];
        _expireLabel.font = [UIFont systemFontOfSize:12];
        _expireValueLabel.font = [UIFont systemFontOfSize:12];
    
    _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(170, 250, 120, 34)];
    _checkBtn.backgroundColor = Orange;
    _checkBtn.layer.cornerRadius = 4;
    [_checkBtn setTitle:@"兑换" forState:UIControlStateNormal];
    _checkBtn.font = [UIFont systemFontOfSize:16];
    _extcreditValueLabel.font = [UIFont systemFontOfSize:14];
    
    _detailText = [[UITextView alloc] initWithFrame:CGRectMake(8, 285, 280, 64)];
    
    UIView *hehe = [[UIView alloc] initWithFrame:CGRectMake(0, 354, 300, 12)];
    hehe.backgroundColor = BackGray;
    UIView *hehe2 = [[UIView alloc] initWithFrame:CGRectMake(0, 390, 300, 1)];
    hehe2.backgroundColor = BackGray;
    _detailText.font = [UIFont systemFontOfSize:15];
    
    _commentHeadLabel = [[UIImageView alloc] initWithFrame:CGRectMake(10, 372, 15, 15)];
    _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(37, 372, 60, 15)];
    _commentNumLabel.font = [UIFont systemFontOfSize:12];
    [_commentHeadLabel setImage:[UIImage imageNamed:@"评论标题图标.png"]];
    
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIView *tableHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 391)];
    tableHeader.backgroundColor = [UIColor whiteColor];
    
    [tableHeader addSubview:hehe];[tableHeader addSubview:hehe2];
    [tableHeader addSubview:_titleLabel];
    [tableHeader addSubview:_imgView];
    [tableHeader addSubview:_extcreditLabel];
    [tableHeader addSubview:_extcreditValueLabel];
    [tableHeader addSubview:_expireLabel];
    [tableHeader addSubview:_expireValueLabel];
    [tableHeader addSubview:_checkBtn];
    [tableHeader addSubview:_detailText];
    
    [tableHeader addSubview:_commentNumLabel];
    [tableHeader addSubview:_commentHeadLabel];
    
//    tableHeader.backgroundColor = [UIColor grayColor];
    
    _commentTable  = [[UITableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 74 - 40 ) style:UITableViewStylePlain];
    
    _commentTable.tableHeaderView = tableHeader;
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    [self.view addSubview:_commentTable];
    
    _commentTable.backgroundColor = [UIColor greenColor];
    
    _commentTable.showsVerticalScrollIndicator = NO;
    //填充UI
    

    
    _titleLabel.text = _model.title;
    [_imgView setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    _extcreditValueLabel.text = [NSString stringWithFormat:@"%@分",_model.extrcedit];
    _expireValueLabel.text = _model.expiry;
    _detailText.text = _model.myDescription;
    _detailText.editable = false;
    
    _userCommentRequestModel = [[UserCommentRequestModel alloc] initWithUid:[CoreHelper getLoginUid]];
    _requestModel = [[CommentReuqestModel alloc] initWithStart:@"0" Limit:@"10" Gid:_model.couponid];
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    _responseModel = [[CommentListResponseModel alloc] init];
    [_requestModel postDataCoupon];
    
//    _commentTable.backgroundColor = BackGray;
    
    
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
    
    return _responseModel.commentNum?_responseModel.commentNum:0;
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
    [cell fillWithModel:[_responseModel.commentArr objectAtIndex:indexPath.row]];
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
            _responseModel = (CommentListResponseModel *)model;
            [_commentTable reloadData];
            _commentNumLabel.text = [NSString stringWithFormat:@"评论(%d)",_responseModel.commentNum];
        }
            break;

        case 10002:
        {
            
            NSLog(@"评论成功");
            
            [_textView resignFirstResponder];
            _textView.text = @"";
            
            [_requestModel postDataCoupon];
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
    _userCommentRequestModel.tag = 10002;
    
    [_userCommentRequestModel sendCouponComment:_model.couponid message:_textView.text];
}

@end
