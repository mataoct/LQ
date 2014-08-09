//
//  DiscountTableViewCell.h
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CouponModel.h"

@interface DiscountTableViewCell : UITableViewCell

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andModel:(NSDictionary *)dic;


@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentText;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *couponLabel;
@property (nonatomic,strong) UILabel *couponValueLabel;
@property (nonatomic,strong) UILabel *timeValueLabel;
@property (nonatomic,strong) UIButton *checkBtn;
@property (nonatomic,strong) CouponModel *model;

-(void)fillCellByModel:(CouponModel *)model;

@end
