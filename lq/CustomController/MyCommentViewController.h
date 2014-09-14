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
#import "CYTableView.h"

@interface MyCommentViewController : LQUIViewController<RequestModelDelegate,UITableViewDataSource,UITableViewDelegate,CYTableViewDelegate>

//@property (nonatomic,strong) UIButton *allCommnetBtn;
//@property (nonatomic,strong) UIButton *goodCommentBtn;
//@property (nonatomic,strong) UIButton *picCommentBtn;

@property (nonatomic,strong) UISegmentedControl *seg;

@property (nonatomic,strong) CYTableView *commentTable;

@property (nonatomic,strong) MyCommentRequestModel *requestModel;
@property (nonatomic,strong) MyCommentResponseModel *responseModel;

@property (nonatomic,strong) NSMutableArray *sourceArr;

-(id)initWithTitle:(NSString *)str;

@end
