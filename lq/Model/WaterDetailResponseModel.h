//
//  WaterDetailResponseModel.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface WaterDetailResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *myDescription;
@property (nonatomic,strong) NSString *myViews;
@property (nonatomic,strong) NSString *commentNum;

-(id)initWithDic:(NSDictionary *)dic;

@end
