//
//  CategoriesModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CategoriesModel.h"

@implementation CategoriesModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        //
        _cid = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        
        _title = safeString([dic objectForKey:@"title"]);
        _cid = safeString([dic objectForKey:@"cid"]);
        
    }
    return self;
}

@end
