//
//  MyFavResponseModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyFavResponseModel.h"

@implementation MyFavResponseModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _num = [[NSString alloc] init];
        
        
        _num = [[dic objectForKey:@"data"] objectForKey:@"num"];
        
        
        _goodsArr = [[NSMutableArray alloc] init];
        NSArray *goodsTempArr = [[dic objectForKey:@"data"] objectForKey:@"lists"];
        
        for (id goodsTemp in goodsTempArr) {
            GoodsModel *model = [[GoodsModel alloc] initWithDic:goodsTemp];
            [_goodsArr addObject:model];
        }
    }
    return self;
}

@end
