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

#import "InfoDetailRequestModel.h"


@interface InfoDetailViewController : LQ7ViewController<RequestModelDelegate>

@property (nonatomic,strong) InfoModel *model;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *mainImageview;
@property (nonatomic,strong) UITextView *contentText;

@property (nonatomic,strong) NSString *newsId;

@property (nonatomic,strong) InfoDetailRequestModel *requestModel;

-(id)initWithModel:(InfoModel *)model;



-(id)initWithNewsId:(NSString *)newsId;

@end
