//
//  ProdutionResponseModel.m
//  lq
//
//  Created by 马涛 on 14-7-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ProdutionResponseModel.h"

@implementation ProdutionResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _imageArr = [[NSMutableArray alloc] initWithArray:[[dic objectForKey:@"data"] objectForKey:@"images"]];
        _gid = [[NSString alloc] init];
        _title = [[NSString alloc] init];
        _nowprice = [[NSString alloc] init];
        _originalprice = [[NSString alloc] init];
        _sales = [[NSString alloc] init];
        _score = [[NSString alloc] init];
        _isfav = [[NSString alloc] init];
        _tag = [[NSString alloc] init];
        _content = [[NSString alloc] init];
        _favCount = [[NSString alloc] init];
        _shareCount = [[NSString alloc] init];
        _cid = [[NSString alloc] init];
        _cname = [[NSString alloc] init];
        
        _gid = safeString( [[dic objectForKey:@"data"] objectForKey:@"gid"]);
        _title = safeString([[dic objectForKey:@"data"] objectForKey:@"title"]);
        _nowprice = safeString([[dic objectForKey:@"data"] objectForKey:@"nowprice"]);
        _originalprice = safeString([[dic objectForKey:@"data"] objectForKey:@"originalprice"]);
        _sales = safeString([[dic objectForKey:@"data"] objectForKey:@"sales"]);
        _score = safeString([[dic objectForKey:@"data"] objectForKey:@"score"]);
        _isfav = safeString([[dic objectForKey:@"data"] objectForKey:@"isfav"]);
        _tag = safeString([[dic objectForKey:@"data"] objectForKey:@"tag"]);
        _content = safeString([[dic objectForKey:@"data"] objectForKey:@"content"]);
        _favCount = safeString([[dic objectForKey:@"data"] objectForKey:@"favcount"]);
        _shareCount = safeString([[dic objectForKey:@"data"] objectForKey:@"sharecount"]);
        _cid = safeString([[dic objectForKey:@"data"] objectForKey:@"cid"]);
        _cname = safeString([[dic objectForKey:@"data"] objectForKey:@"cname"]);
    }
    
    return self;
}

@end
