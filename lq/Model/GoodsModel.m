//
//  GoodsModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        //
        
        _title = [[NSString alloc] init];
        _img = [[NSString alloc] init];
        _gid = [[NSString alloc] init];
        _nowprice = [[NSString alloc] init];
        _originalprice = [[NSString alloc] init];
        _sales = [[NSString alloc] init];
        _score = [[NSString alloc] init];
        _isfav = [[NSString alloc] init];
        _content = [[NSString alloc] init];
        
        
        _title = safeString([dic objectForKey:@"title"]);
        _img = safeString([dic objectForKey:@"img"]);
        _gid = safeString([dic objectForKey:@"gid"]);
        _nowprice = safeString([dic objectForKey:@"nowprice"]);
        _originalprice = safeString([dic objectForKey:@"originalprice"]);
        _sales = safeString([dic objectForKey:@"sales"]);
        _score = safeString([dic objectForKey:@"score"]);
        _isfav = safeString([dic objectForKey:@"isfav"]);
        _content = safeString([dic objectForKey:@"content"]);
        
    }
    return self;
    
}
@end
