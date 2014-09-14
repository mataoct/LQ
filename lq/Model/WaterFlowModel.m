//
//  WaterFlowModel.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterFlowModel.h"

@implementation WaterFlowModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
        _pid = [[NSString alloc] init];
        _img = [[NSURL alloc] init];
        _title = [[NSString alloc] init];
        
        
        _pid = safeString([dic objectForKey:@"pid"]);
        _img = [NSURL URLWithString:[safeString([dic objectForKey:@"img"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        _title = safeString([dic objectForKey:@"title"]);
    }
    return self;
    
}

@end
