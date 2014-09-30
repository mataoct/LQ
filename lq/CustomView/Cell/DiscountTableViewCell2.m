//
//  DiscountTableViewCell2.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DiscountTableViewCell2.h"

@implementation DiscountTableViewCell2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        
        [self.checkBtn setTitle:@"兑换" forState:UIControlStateNormal];
        [self.checkBtn addTarget:self action:@selector(integral2Coupon) forControlEvents:UIControlEventTouchUpInside];
        
        _reuqestModel = [[Integral2CouponRequestModel alloc] initWithUid:[CoreHelper getLoginUid]];
        _reuqestModel.delegate = self;
        
//        self.se
    }
    return self;
    
}

-(void)integral2Coupon
{
    NSLog(@"click ");
    
    
    [_reuqestModel postData:self.model.couponid];
}

-(void)requestFailed:(NSString *)errorStr
{
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.3];
}

-(void)requestSuccess:(BaseResponseModel *)model
{

    
    
    
    
    if (model.ResponseStatus == 1) {
            [SVProgressHUD showSuccessWithStatus_custom:@"领取成功" duration:2.0];
    }
    else
    {
        [SVProgressHUD showSuccessWithStatus_custom:model.ErrMessage duration:2.0];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
