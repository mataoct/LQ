
//
//  InfoResponseModel.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoResponseModel.h"

@implementation InfoResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _infoArr = [[NSMutableArray alloc] init];
        
        NSArray *infoTempArr= [dic objectForKey:@"data"];
        
        
        for (id infoTemp in infoTempArr) {
            InfoModel *model = [[InfoModel alloc] initWithDic:infoTemp];
            [_infoArr addObject:model];
        }
        
    }
    return self;
}
@end
