//
//  InfoDetailViewController.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "InfoModel.h"
#import "UIImageView+WebCache.h"
@interface InfoDetailViewController : LQ7ViewController

@property (nonatomic,strong) InfoModel *model;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *mainImageview;
@property (nonatomic,strong) UITextView *contentText;

-(id)initWithModel:(InfoModel *)model; 

@end
