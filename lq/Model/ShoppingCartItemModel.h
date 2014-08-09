//
//  ShoppingCartItemModel.h
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCartItemModel : NSObject

@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSString *totalPrice;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) NSString *nowPrice;
@property (nonatomic,strong) NSString *originalPrice;


-(id)initWithDic:(NSDictionary *)dic;

@end
