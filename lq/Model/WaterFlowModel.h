//
//  WaterFlowModel.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterFlowModel : NSObject

@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *title;

-(id)initWithDic:(NSDictionary *)dic;

@end
