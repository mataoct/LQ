//
//  MenuResponseModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "CategoriesModel.h"
#import "GoodsModel.h"

@interface MenuResponseModel : BaseResponseModel


@property (nonatomic,strong) NSMutableArray *categoriesArr;
@property (nonatomic,strong) NSMutableArray *goodsArr;

@end
