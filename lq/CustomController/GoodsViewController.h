//
//  GoodsViewController.h
//  lq
//
//  Created by 马涛 on 14-8-4.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "LQUIViewController.h"
//#import "GoodsModel.h"
#import "CycleScrollView.h"
#import "ProdutionResponseModel.h"
#import "ProductionRequestModel.h"
#import "UIImageView+WebCache.h"
#import "HPGrowingTextView.h"

#import "CommentTableViewCell.h"

#import "CommentReuqestModel.h"
#import "UserCommentRequestModel.h"

#import "DisLineLabel.h"
#import "AddToCartRequestModel.h"

@interface GoodsViewController : LQUIViewController<UITableViewDataSource,UITableViewDelegate,RequestModelDelegate,HPGrowingTextViewDelegate>




@property (nonatomic,strong) ProdutionResponseModel *model;
@property (nonatomic,strong) ProductionRequestModel *requestModel;
@property (nonatomic,strong) CommentReuqestModel *commentRequestModel;
@property (nonatomic,strong) CommentListResponseModel *commentResponseModel;
@property (nonatomic,strong) UserCommentRequestModel *userCommentRequestModel;
@property (nonatomic,strong) CycleScrollView *scrollView;


@property (nonatomic,strong) AddToCartRequestModel *add2CartModel;

@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *nowPriceLabel;
@property (nonatomic,strong) DisLineLabel *orginalPriceLabel;
@property (nonatomic,strong) UILabel *disableLineLabel;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) UILabel *tagValueLabel;
@property (nonatomic,strong) UILabel *categoryLabel;
@property (nonatomic,strong) UILabel *categoryValueLabel;
@property (nonatomic,strong) UILabel *favLabel;
@property (nonatomic,strong) UILabel *favValueLabel;
@property (nonatomic,strong) UILabel *shareLabel;
@property (nonatomic,strong) UILabel *shareValueLabel;
@property (nonatomic,strong) UILabel *salesLabel;
@property (nonatomic,strong) UILabel *salesValueLabel;

@property (nonatomic,strong) UIButton *buyBtn;
@property (nonatomic,strong) UIButton *cartBtn;

@property (nonatomic,strong) UILabel *subTitle;
@property (nonatomic,strong) UIImageView *subTitleImgview;
@property (nonatomic,strong) UITextView *contentTv;

@property (nonatomic,strong) UIImageView *tableTitleImgview;
@property (nonatomic,strong) UILabel *commentCountLabel;
@property (nonatomic,strong) UITableView *commentTable;


@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) HPGrowingTextView *textView;

-(id)initWithGid:(NSString *)gid Title:(NSString *)title;
-(void)resignTextView;




@end
