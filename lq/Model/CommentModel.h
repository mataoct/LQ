//
//  CommentModel.h
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreHelper.h"

@interface CommentModel : NSObject

@property (nonatomic,strong) NSURL *avatar;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSString *dateline;
@property (nonatomic,strong) NSString *message;

-(id)initWithDic:(NSDictionary *)dic;

@end
