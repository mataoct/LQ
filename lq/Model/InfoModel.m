//
//  InfoModel.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
        
        _img = [[NSURL alloc] init];
        _newid = [[NSString alloc] init];
        _dateLine = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _summary= [[NSString alloc] init];
        
        
        
        _img = [NSURL URLWithString: safeString([dic objectForKey:@"img"])];
        _newid = safeString([dic objectForKey:@"newid"]);
        _dateLine =  [CoreHelper timeStampToDate:safeString([dic objectForKey:@"dateline"])] ;
        _summary = safeString([dic objectForKey:@"summary"]);
        _title = safeString([dic objectForKey:@"title"]);
    }
    return self;
}
@end
