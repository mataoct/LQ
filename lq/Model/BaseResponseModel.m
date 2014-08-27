//
//  BaseResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@implementation BaseResponseModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
//        NSLog(@"dic %@",dic);
        
        _ErrMessage = [[NSString alloc] init];
        
        _ResponseStatus = [[dic objectForKey:@"status"] integerValue];
        
        
        if (_ResponseStatus != 1) {
            
            NSLog(@"接口返回错误 %@ ",dic);
            
            
            _ErrMessage = [dic objectForKey:@"message"];
            
//            return nil;
        }
        
    }
    return self;
}

@end
