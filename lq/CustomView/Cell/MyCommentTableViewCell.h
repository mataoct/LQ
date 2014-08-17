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
@interface MyCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UITextView *content;
@property (nonatomic,strong) UILabel *time;


@property (nonatomic,strong) MyCommentModel *model;

-(void)fillCellByModel:(MyCommentModel *)model;

@end
