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
//    @property (nonatomic,strong) NSMutableArray *imageArr;
//    @property (nonatomic,strong) NSString *gid;
//    @property (nonatomic,strong) NSString *title;
//    @property (nonatomic,strong) NSString *nowprice;
//    @property (nonatomic,strong) NSString *originalprice;
//    @property (nonatomic,strong) NSString *sales;
//    @property (nonatomic,strong) NSString *isfav;
//    @property (nonatomic,strong) NSString *tag;
//    @property (nonatomic,strong) NSString *content;
//    @property (nonatomic,strong) NSString *favCount;
//    @property (nonatomic,strong) NSString *shareCount;
//    @property (nonatomic,strong) NSString *cid;
//    @property (nonatomic,strong) NSString *cname;
    
    self = [super initWithDic:dic];
    if (self) {
        //
        
        _imageArr = [[NSMutableArray alloc] initWithArray:[[dic objectForKey:@"data"] objectForKey:@"imges"]];
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
        
        _gid = [[dic objectForKey:@"data"] objectForKey:@"gid"];
        _title = [[dic objectForKey:@"data"] objectForKey:@"title"];
        _nowprice = [[dic objectForKey:@"data"] objectForKey:@"nowprice"];
        _originalprice = [[dic objectForKey:@"data"] objectForKey:@"originalprice"];
        _sales = [[dic objectForKey:@"data"] objectForKey:@"sales"];
        _score = [[dic objectForKey:@"data"] objectForKey:@"score"];
        _isfav = [[dic objectForKey:@"data"] objectForKey:@"isfav"];
        _tag = [[dic objectForKey:@"data"] objectForKey:@"tag"];
        _content = [[dic objectForKey:@"data"] objectForKey:@"content"];
        _favCount = [[dic objectForKey:@"data"] objectForKey:@"favcount"];
        _shareCount = [[dic objectForKey:@"data"] objectForKey:@"sharecount"];
        _cid = [[dic objectForKey:@"data"] objectForKey:@"cid"];
        _cname = [[dic objectForKey:@"data"] objectForKey:@"cname"];
    }
    
    return self;
}

@end
