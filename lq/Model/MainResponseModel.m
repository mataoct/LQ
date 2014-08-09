//
//  MainResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MainResponseModel.h"

@implementation MainResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _sliderArr = [[NSMutableArray alloc] init];
        
        NSArray *sliderTempArr= [[dic objectForKey:@"data"] objectForKey:@"slide"];
        
        
        
        for (id sliderTemp in sliderTempArr) {
            SliderModel *model = [[SliderModel alloc] initWithDic:sliderTemp];
            [_sliderArr addObject:model];
        }
        
        _admodel = [[AdModel alloc] initWithDic:[[dic objectForKey:@"data"] objectForKey:@"ad"]];
        
        
        _hotArr = [[NSMutableArray alloc] init];
        NSArray *hotTempArr = [[dic objectForKey:@"data"] objectForKey:@"hots"];
        
        for (id hotTemp in hotTempArr) {
            HotModel *model = [[HotModel alloc] initWithDic:hotTemp];
            [_hotArr addObject:model];
        }
    }
    
    NSLog(@"slider array  %@",_sliderArr);
    
    return self;
}

@end
