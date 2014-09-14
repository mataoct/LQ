//
//  AdModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AdModel.h"

@implementation AdModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        //
        _url = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _img = [[NSURL alloc] init];
        
        
        _url =  safeString([dic objectForKey:@"url"]);
        _title = safeString([dic objectForKey:@"title"]);
        _img = [NSURL URLWithString:[safeString([dic objectForKey:@"img"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ] ;
        
    }
    return self;
}

@end
