//
//  CommentTableViewCell.h
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

#import "UIImageView+WebCache.h"

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic,strong) CommentModel *model;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UIImageView *sexImageView;
@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *contentText;

-(void)fillWithModel:(CommentModel *)model;

@end
