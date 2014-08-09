//
//  ProdutionResponseModel.h
//  lq
//
//  Created by 马涛 on 14-7-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface ProdutionResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *imageArr;
@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *nowprice;
@property (nonatomic,strong) NSString *originalprice;
@property (nonatomic,strong) NSString *sales;
@property (nonatomic,strong) NSString *score;
@property (nonatomic,strong) NSString *isfav;
@property (nonatomic,strong) NSString *tag;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *favCount;
@property (nonatomic,strong) NSString *shareCount;
@property (nonatomic,strong) NSString *cid;
@property (nonatomic,strong) NSString *cname;
@end
