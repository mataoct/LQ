//
//  MyCommentTableViewCell.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCommentModel.h"
#import "UIImageView+WebCache.h"


@protocol commentClickDelegate <NSObject>

-(void)commentBtnClick:(MyCommentModel *)model checkStatus:(NSInteger)status;

@end

@interface MyCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UITextView *content;
@property (nonatomic,strong) UILabel *time;

@property (nonatomic,assign) NSInteger ischeck;
@property (nonatomic,strong) UIButton *checkBtn;
@property (nonatomic,assign) id<commentClickDelegate> delegate;

@property (nonatomic,strong) MyCommentModel *model;

-(void)fillCellByModel:(MyCommentModel *)model;

@end
