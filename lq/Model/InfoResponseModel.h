//
//  InfoResponseModel.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "InfoModel.h"
@interface InfoResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *infoArr;

-(id)initWithDic:(NSDictionary *)dic;
@end
