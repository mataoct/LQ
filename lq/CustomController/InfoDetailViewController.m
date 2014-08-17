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
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
    _mainImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 300, 60)];
    _contentText = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 300, 100)];
    _contentText.editable = false;
    
    
    [temp addSubview:_titleLabel];
    [temp addSubview:_mainImageview];
    [temp addSubview:_contentText];
    [temp addSubview:_timeLabel];
    
    
    _titleLabel.text = _model.title;
    _timeLabel.text = _model.dateLine;
    [_mainImageview setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    _contentText.text = _model.summary;
    
    
    [self.view addSubview:temp];
    
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

@end
