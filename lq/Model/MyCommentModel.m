//
//  MyCommentModel.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentModel.h"

@implementation MyCommentModel


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
//        @property (nonatomic,strong) NSString *commentId;
//        @property (nonatomic,strong) NSString *createTime;
//        @property (nonatomic,assign) NSInteger *type;
//        @property (nonatomic,strong) NSString *content;
//        @property (nonatomic,strong) NSURL *img;
//        @property (nonatomic,strong) NSString *title;

        _commentId = [[NSString alloc] init];
        _createTime = [[NSString alloc] init];
        _content = [[NSString alloc] init];
        _img = [[NSURL alloc] init];
        _title = [[NSString alloc] init];
        _type_id = [[NSString alloc] init];
        
        _ischeck = 0;
        
        
        _commentId =  safeString([dic objectForKey:@"id"]);
        _createTime = [CoreHelper timeStampToDate: safeString([dic objectForKey:@"createtime"])];
        _content=  safeString([dic objectForKey:@"content"]);
        _title = safeString([dic objectForKey:@"title"]);
        _img = [NSURL URLWithString:[safeString([dic objectForKey:@"img"]) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
        _type = [safeString([dic objectForKey:@"type"])  integerValue];
        _type_id = safeString([dic objectForKey:@"typeid"]);
    }
    return self;
}

@end
