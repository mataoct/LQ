//
//  CouponModel.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"
#import "CoreHelper.h"

@interface CouponModel : NSObject

@property (nonatomic,strong) NSString *couponid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *extrcedit;
@property (nonatomic,strong) NSString *expiry;
@property (nonatomic,strong) NSString *description;


-(id)initWithDic:(NSDictionary *)dic;

@end
