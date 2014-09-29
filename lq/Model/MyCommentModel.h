//
//  MyCommentModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreHelper.h"
@interface MyCommentModel : NSObject

@property (nonatomic,strong) NSString *commentId;
@property (nonatomic,strong) NSString *createTime;
@property (nonatomic,assign) NSInteger *type;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) NSInteger ischeck;

-(id)initWithDic:(NSDictionary *)dic;


@end
