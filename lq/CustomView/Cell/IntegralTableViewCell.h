//
//  IntegralTableViewCell.h
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntegralDetailModel.h"
#import "BalanceDetailModel.h"

@interface IntegralTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *orderIdLabel;
@property (nonatomic,strong) UILabel *integralLabel;
@property (nonatomic,strong) UILabel *typeLabel;


@property (nonatomic,strong) IntegralDetailModel *iModel;
@property (nonatomic,strong) BalanceDetailModel *bModel;

-(void)fillCellByIModel:(IntegralDetailModel *)model;
-(void)fillCellByBModel:(BalanceDetailModel *)model;
@end
