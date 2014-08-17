//
//  MyCommentResponseModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentResponseModel.h"

@implementation MyCommentResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _myCommArr = [[NSMutableArray alloc] init];
        
        NSArray *myCommTempArr= [[dic objectForKey:@"data"] objectForKey:@"commmentlist"];
        
        
        
        for (id myComm in myCommTempArr) {
            MyCommentModel *model = [[MyCommentModel alloc] initWithDic:myComm];
            [_myCommArr addObject:model];
        }
    }
    
    return self;
}

@end
