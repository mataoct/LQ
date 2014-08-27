//
//  CouponDetailViewController.h
//  lq
//
//  Created by  matao on 14-8-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CommentReuqestModel.h"
#import "HPGrowingTextView.h"
#import "CouponModel.h"
#import "CommentTableViewCell.h"
#import "UserCommentRequestModel.h"

@interface CouponDetailViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate,HPGrowingTextViewDelegate>

@property (nonatomic,strong) UITableView *commentTable;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *extcreditLabel;
@property (nonatomic,strong) UILabel *extcreditValueLabel;
@property (nonatomic,strong) UILabel *expireLabel;
@property (nonatomic,strong) UILabel *expireValueLabel;
@property (nonatomic,strong) UIButton *checkBtn;
@property (nonatomic,strong) UITextView *detailText;

@property (nonatomic,strong) UIImageView *commentHeadLabel;
@property (nonatomic,strong) UILabel *commentNumLabel;

@property (nonatomic,strong) CouponModel *model;
@property (nonatomic,strong) CommentReuqestModel *requestModel;
@property (nonatomic,strong) CommentListResponseModel *responseModel;
@property (nonatomic,strong) UserCommentRequestModel *userCommentRequestModel;

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) HPGrowingTextView *textView;


-(id)initWithTitle:(NSString *)str andModel:(CouponModel *)model;

@end
