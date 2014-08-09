//
//  CommentListResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CommentListResponseModel.h"

@implementation CommentListResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _commentArr = [[NSMutableArray alloc] init];
        
        NSArray *commentTempArr= [[dic objectForKey:@"data"] objectForKey:@"comments"];
        
        
        for (id commentTemp in commentTempArr) {
            CommentModel *model = [[CommentModel alloc] initWithDic:commentTemp];
            [_commentArr addObject:model];
        }
        _commentNum = [[[dic objectForKey:@"data"] objectForKey:@"comments"] count];
        
    }
    return self;
}
@end
