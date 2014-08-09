//
//  ShoppingCartListResponseModel.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ShoppingCartListResponseModel.h"

@implementation ShoppingCartListResponseModel
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _cartArr = [[NSMutableArray alloc] init];
        
        NSArray *cartTempArr= [[dic objectForKey:@"data"] objectForKey:@"shoppingcartlist"];
        
        
        for (id cartTemp in cartTempArr) {
            ShoppingCartItemModel *model = [[ShoppingCartItemModel alloc] initWithDic:cartTemp];
            [_cartArr addObject:model];
        }
        
        _totalPrice = [[NSString alloc] init];
        _totalPrice = safeString([[dic objectForKey:@"data"] objectForKey:@"totalprice"]);
        
    }
    return self;
}
@end
