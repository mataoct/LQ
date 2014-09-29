//
//  InfoDetailViewController.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "InfoModel.h"
#import "UIImageView+WebCache.h"

#import "InfoDetailRequestModel.h"
#import "HPGrowingTextView.h"
#import "CommentTableViewCell.h"
#import "CommentReuqestModel.h"
#import "UserCommentRequestModel.h"



@interface InfoDetailViewController : LQUIViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate,HPGrowingTextViewDelegate>

@property (nonatomic,strong) InfoModel *model;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *mainImageview;
@property (nonatomic,strong) UITextView *contentText;

@property (nonatomic,strong) NSString *newsId;

@property (nonatomic,strong) InfoDetailRequestModel *requestModel;


@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) HPGrowingTextView *textView;

@property (nonatomic,strong) CommentReuqestModel *commentRequestModel;
@property (nonatomic,strong) CommentListResponseModel *commentResponseModel;
@property (nonatomic,strong) UserCommentRequestModel *userCommentRequestModel;

@property (nonatomic,strong) UIImageView *tableTitleImgview;
@property (nonatomic,strong) UILabel *commentCountLabel;
@property (nonatomic,strong) UITableView *commentTable;

-(id)initWithTitle:(NSString *)str Model:(InfoModel *)model;



-(id)initWithTitle:(NSString *)str NewsId:(NSString *)newsId;

@end
