//
//  HotModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotModel : NSObject

@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *gid;


-(id)initWithDic:(NSDictionary *)dic;

@end
