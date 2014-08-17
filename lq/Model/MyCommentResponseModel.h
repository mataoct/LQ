//
//  MyCommentResponseModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "MyCommentModel.h"

@interface MyCommentResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *myCommArr;


-(id)initWithDic:(NSDictionary *)dic;

@end
