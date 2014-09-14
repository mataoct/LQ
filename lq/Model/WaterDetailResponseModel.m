//
//  WaterDetailResponseModel.m
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "WaterDetailResponseModel.h"

@implementation WaterDetailResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    
    self = [super initWithDic: dic];
    if (self) {
        //
        
        _pid = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _img = [[NSURL alloc] init];
        _myDescription = [[NSString alloc] init];
        _myViews = [[NSString alloc] init];
        _commentNum = [[NSString alloc] init];
        
        
        _pid = safeString([[dic objectForKey:@"data"] objectForKey:@"pid"]);
        _title = safeString([[dic objectForKey:@"data"] objectForKey:@"title"]);
        _img = [NSURL URLWithString:[safeString([[dic objectForKey:@"data"] objectForKey:@"img"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        _myDescription = safeString([[dic objectForKey:@"data"] objectForKey:@"description"]);
        _myViews = safeString([[dic objectForKey:@"data"] objectForKey:@"views"]);
        _commentNum = safeString([[dic objectForKey:@"data"] objectForKey:@"commentnum"]);
    }
    return self;
}

@end
