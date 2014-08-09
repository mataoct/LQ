//
//  MenuResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuResponseModel.h"

@implementation MenuResponseModel
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _categoriesArr = [[NSMutableArray alloc] init];
        
        NSArray *categoriesTempArr= [[dic objectForKey:@"data"] objectForKey:@"categories"];
        
        
        
        for (id categories in categoriesTempArr) {
            CategoriesModel *model = [[CategoriesModel alloc] initWithDic:categories];
            [_categoriesArr addObject:model];
        }
     
        _goodsArr = [[NSMutableArray alloc] init];
        NSArray *goodsTempArr = [[dic objectForKey:@"data"] objectForKey:@"goods"];
        
        for (id goodsTemp in goodsTempArr) {
            GoodsModel *model = [[GoodsModel alloc] initWithDic:goodsTemp];
            [_goodsArr addObject:model];
        }
    }
    
    return self;
}

@end
