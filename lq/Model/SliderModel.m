//
//  SliderModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SliderModel.h"

@implementation SliderModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        //
        _type = [[NSString alloc] init];
        _type_id = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _img = [[NSString alloc] init];
        
        
        _type =  safeString([dic objectForKey:@"type"]);
        _type_id = safeString([dic objectForKey:@"typeid"]);
        _title = safeString([dic objectForKey:@"title"]);
        _img = safeString([dic objectForKey:@"img"]);

    }
    return self;
}

@end
