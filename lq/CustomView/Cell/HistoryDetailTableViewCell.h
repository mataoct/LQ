//
//  HistoryDetailTableViewCell.h
//  lq
//
//  Created by  matao on 14-9-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryModel.h"

@protocol HistoryDetailDelegate <NSObject>

@required

-(void)payNowClick:(NSString *)orderId;
-(void)cancleOrder:(NSString *)orderId model:(HistoryModel *)model;

@end


@interface HistoryDetailTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *totalNumLable;
@property (nonatomic,strong) UILabel *originalPriceLabel;
@property (nonatomic,strong) UILabel *sendPriceLabel;
@property (nonatomic,strong) UILabel *currentPriceLabel;
@property (nonatomic,strong) UILabel *couponLabel;
@property (nonatomic,strong) UILabel *integralLabel;

@property (nonatomic,strong) UILabel *summaryLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *telLabel;
@property (nonatomic,strong) UILabel *linkManLabel;
@property (nonatomic,strong) UILabel *createTimeLabel;


@property (nonatomic,strong) UIButton *payBtn;
@property (nonatomic,strong) UIButton *cancleBtn;


@property (nonatomic,strong) HistoryModel *model;


@property (nonatomic,assign) id<HistoryDetailDelegate> delegate;

@property (nonatomic,strong) NSString *orderId;


-(void)fillCellByModel:(HistoryModel *)model;

@end
