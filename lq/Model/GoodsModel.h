//
//  GoodsModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject


@property (nonatomic,strong) NSURL *img;


@property (nonatomic,strong) NSMutableArray *images;

@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *nowprice;
@property (nonatomic,strong) NSString *originalprice;
@property (nonatomic,strong) NSString *sales;
@property (nonatomic,strong) NSString *score;
@property (nonatomic,strong) NSString *isfav;
@property (nonatomic,strong) NSString *content;

-(id)initWithDic:(NSDictionary *)dic;



@end
