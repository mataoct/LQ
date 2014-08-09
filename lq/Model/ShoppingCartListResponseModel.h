//
//  ShoppingCartListResponseModel.h
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "ShoppingCartItemModel.h"

@interface ShoppingCartListResponseModel : BaseResponseModel
@property (nonatomic,strong) NSMutableArray *cartArr;
@property (nonatomic,strong) NSString *totalPrice;

-(id)initWithDic:(NSDictionary *)dic;
@end
