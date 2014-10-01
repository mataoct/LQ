//
//  FrontMenuTableViewCell.h
//  lq
//
//  Created by  matao on 14-10-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "CategoriesModel.h"

@interface FrontMenuTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headImage;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) CategoriesModel *cateModel;


-(void)fillByModel:(CategoriesModel *)model index:(NSInteger)row;

@end
