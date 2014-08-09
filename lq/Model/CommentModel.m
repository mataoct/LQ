//
//  CommentModel.m
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super self];
    if (self) {
       
        _avatar = [[NSURL alloc] init];
        _username = [[NSString alloc] init];
//        _sex = [[NSString alloc] init];
        _dateline = [[NSString alloc] init];
        _message = [[NSString alloc] init];

        
        
        _avatar = [NSURL URLWithString: safeString([dic objectForKey:@"avatar"])];
        _username = safeString([dic objectForKey:@"username"]);
        _sex = [safeString([dic objectForKey:@"sex"]) integerValue];
        _dateline = safeString([dic objectForKey:@"dateline"]);
        _message = safeString([dic objectForKey:@"message"]);
        
    }
    return self;
    
}

@end
