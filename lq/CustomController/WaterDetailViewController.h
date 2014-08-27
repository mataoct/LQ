//
//  WaterDetailViewController.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"

#import "WaterDetailRequestModel.h"
//#import "WaterDetailResponseModel.h"

#import "CommentReuqestModel.h"
#import "HPGrowingTextView.h"
#import "CommentTableViewCell.h"
#import "UserCommentRequestModel.h"

@interface WaterDetailViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate,HPGrowingTextViewDelegate>

@property (nonatomic,strong) UITableView *commentTable;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *viewCountLabel;
@property (nonatomic,strong) UILabel *commentNumLabel1;
@property (nonatomic,strong) UITextView *detailText;

@property (nonatomic,strong) UIImageView *commentHeadLabel;
@property (nonatomic,strong) UILabel *commentNumLabel;

@property (nonatomic,strong) WaterDetailRequestModel *waterDetailRequestModel;
@property (nonatomic,strong) CommentReuqestModel *commentRequestModel;
@property (nonatomic,strong) WaterDetailResponseModel *waterDetailResponseModel;
@property (nonatomic,strong) CommentListResponseModel *commentResponseModel;
@property (nonatomic,strong) UserCommentRequestModel *userCommentRequestModel;
//@property (nonatomic,strong)

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) HPGrowingTextView *textView;

@property (nonatomic,strong) NSString *pid;
-(id)initWithTitle:(NSString *)str andPid:(NSString *)pid;
@end
