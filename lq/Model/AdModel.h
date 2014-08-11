//
//  AdModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdModel : NSObject
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSURL *img;
@property (nonatomic,strong) NSString *title;


-(id)initWithDic:(NSDictionary *)dic;

@end
