//
//  InfoModel.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreHelper.h"

@interface InfoModel : BaseResponseModel

@property (nonatomic,strong) NSString *newid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *dateLine;
@property (nonatomic,strong) NSString *summary;

@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) NSString *views;
@property (nonatomic,strong) NSString *commentnum;

-(id)initWithDic:(NSDictionary *)dic;

@end
