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

-(id)initWithModel:(InfoModel *)model
{
    self = [super init];
    if (self) {
        //
        
        _model = [[InfoModel alloc] init];
        
        _model = model;
        
        self.title = @"活动资讯详情";
        
    }
    return self;
}

-(id)initWithNewsId:(NSString *)newsId
{
    self = [super init];
    if (self) {
        //
        
        _model = [[InfoModel alloc] init];
        
        _newsId = newsId;
        
        _requestModel = [[InfoDetailRequestModel alloc] initWithNewID:_newsId];
        _requestModel.delegate = self;
        [_requestModel postData];
        
        self.title = @"活动资讯详情";
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 320)];
    
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
    
    [self.view addSubview:temp];
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
    _model = (InfoModel *)model;
    [self fillWithModel];
}

-(void)requestFailed:(NSString *)errorStr
{
    NSLog(@"%@",errorStr);
}



@end
