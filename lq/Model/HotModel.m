//
//  HotModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        //
        _gid = [[NSString alloc] init];
        _img = [[NSURL alloc] init];
        
        _gid = safeString([dic objectForKey:@"gid"]);
        _img = [NSURL URLWithString:[safeString([dic objectForKey:@"img"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
        
    }
    return self;
}

@end
