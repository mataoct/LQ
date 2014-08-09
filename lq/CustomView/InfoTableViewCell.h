//
//  InfoTableViewCell.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"
#import "UIImageView+WebCache.h"
@interface InfoTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextView *contentText;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) InfoModel *model;


-(void)fillCellByModel:(InfoModel *)model;

@end
