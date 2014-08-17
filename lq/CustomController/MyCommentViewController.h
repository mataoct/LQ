//
//  MyCommentViewController.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "MyCommentTableViewCell.h"

#import "MyCommentRequestModel.h"

@interface MyCommentViewController : LQUIViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton *allCommnetBtn;
@property (nonatomic,strong) UIButton *goodCommentBtn;
@property (nonatomic,strong) UIButton *picCommentBtn;

@property (nonatomic,strong) UITableView *commentTable;

@property (nonatomic,strong) MyCommentRequestModel *requestModel;
@property (nonatomic,strong) MyCommentResponseModel *responseModel;


-(id)initWithTitle:(NSString *)str;

@end
