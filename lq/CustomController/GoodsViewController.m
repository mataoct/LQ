//
//  GoodsViewController.m
//  lq
//
//  Created by 马涛 on 14-8-4.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "GoodsViewController.h"

@interface GoodsViewController ()

@end

@implementation GoodsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithGid:(NSString *)gid Title:(NSString *)title
{
    self = [super initWithTitle:title];
    if (self) {
        //
        _gid = [[NSString alloc] init];
        _gid = gid;
        
        
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
    
    _requestModel = [[ProductionRequestModel alloc] initWithSellId:@"100" Gid:_gid];
    _commentRequestModel = [[CommentReuqestModel alloc] initWithStart:@"0" Limit:@"10" Gid:_gid];
    _model = [[ProdutionResponseModel alloc] init];
    _commentResponseModel = [[CommentListResponseModel alloc] init];
    
    
    _scrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 10, 300, 130) animationDuration:0];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 150, 20)];
    
    _nowPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 150, 60, 20)];
    _orginalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 150, 30, 20)];
    
    _tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 175, 32, 16)];
    _tagValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 175, 32, 16)];
    _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 175, 32, 16)];
    _categoryValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 175, 32, 16)];
    
    _favLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 195, 32, 16)];
    _favValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 195, 32, 16)];
    _shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 195, 32, 16)];
    _shareValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 195, 32, 16)];
    _salesLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 195, 32, 16)];
    _salesValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(290, 195, 32, 16)];
    
    
    _buyBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 220, 120, 32)];
    _cartBtn = [[UIButton alloc] initWithFrame:CGRectMake(160, 220, 120, 32)];
    
    
    _subTitleImgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 270, 100, 20)];
    _contentTv = [[UITextView alloc] initWithFrame:CGRectMake(0, 300, 300, 60)];
    
    _tableTitleImgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 380, 100, 20)];
    _commentTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, 300, self.view.frame.size.height - 20 - 44 - 40)];
    
    
    UIView *tempview = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 430)];
    
    _tagLabel.text = @"标签:";
    _categoryLabel.text = @"分类:";
    _favLabel.text = @"收藏:";
    _shareLabel.text = @"分享:";
    _salesLabel.text = @"销量:";
    
    [tempview addSubview:_scrollView];
    [tempview addSubview:_titleLabel];
    [tempview addSubview:_nowPriceLabel];
    [tempview addSubview:_orginalPriceLabel];
    [tempview addSubview:_tagLabel];
    [tempview addSubview:_tagValueLabel];
    [tempview addSubview:_categoryLabel];
    [tempview addSubview:_categoryValueLabel];
    [tempview addSubview:_favLabel];
    [tempview addSubview:_favValueLabel];
    [tempview addSubview:_shareLabel];
    [tempview addSubview:_shareValueLabel];
    [tempview addSubview:_salesLabel];
    [tempview addSubview:_salesValueLabel];
    [tempview addSubview:_buyBtn];
    [tempview addSubview:_cartBtn];
    [tempview addSubview:_subTitleImgview];
    [tempview addSubview:_contentTv];
    [tempview addSubview:_tableTitleImgview];
    [tempview setBackgroundColor:[UIColor grayColor]];
    
    _contentTv.editable = false;
    
    _commentTable.tableHeaderView = tempview;
    _commentTable.backgroundColor = [UIColor redColor];
    
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    
    [self.view addSubview:_commentTable];
    
    
    
//    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//    self.view.backgroundColor = [UIColor colorWithRed:219.0f/255.0f green:226.0f/255.0f blue:237.0f/255.0f alpha:1];
	
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
    
    
    
    
    
    
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    [_requestModel postData];
}

-(void)fillLayouts
{
    [self fillScrollerByArray:_model.imageArr];
    
    _titleLabel.text = _model.title;
    _nowPriceLabel.text = _model.nowprice;
    _orginalPriceLabel.text = _model.originalprice;
    _tagValueLabel.text = _model.tag;
    _categoryValueLabel.text = _model.cname;
    _salesValueLabel.text = _model.sales;
    _favValueLabel.text = _model.favCount;
    _shareValueLabel.text = _model.shareCount;
    
    
    _contentTv.text = _model.content;
}


-(void)fillScrollerByArray:(NSArray *)arr
{
    _scrollView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    
    NSLog(@"-- arr %@",arr);
    
    
    NSMutableArray *viewsArray = [@[] mutableCopy];
//    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < [arr count]; ++i) {
        UIImageView *tempLabel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 130)];
        
        tempLabel.userInteractionEnabled = YES;
        
        
        NSURL *url = [[NSURL alloc] initWithString:[arr objectAtIndex:i]];
        
        [tempLabel setImageWithURL:url placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
//        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempLabel];
    }
    
    
    _scrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    _scrollView.totalPagesCount = ^NSInteger(void){
        return [arr count];
    };
    _scrollView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%d个,%@",pageIndex,[arr objectAtIndex:pageIndex]);
    };

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
    return 52.0;
}

-(void)requestFailed
{
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    switch (model.ResponseTag) {
        case 10001:
        {
            _model = (ProdutionResponseModel *)model;
            NSLog(@"%@",_model);
            
            [self fillLayouts];
            
            _commentRequestModel.delegate = self;
            _commentRequestModel.tag = 10002;
            [_commentRequestModel postData];
            //发起获取评论请求
        }
            break;
        case 10002:
        {
            _commentResponseModel = (CommentListResponseModel *)model;
            
            [_commentTable reloadData];
            NSLog(@"%d",_commentResponseModel.commentNum);
        }
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
	[_textView resignFirstResponder];
    _textView.text = @"";
}


@end
