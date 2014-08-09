//
//  BaseResponseModel.h
//  lq
//
//  Created by 马涛 on 14-7-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponseModel : NSObject


@property (nonatomic,assign) NSInteger ResponseTag;

-(id)initWithDic:(NSDictionary *)dic;


@end
