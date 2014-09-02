//
//  HistoryModel.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HistoryModel.h"

@implementation HistoryModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
//        _img = [[NSURL alloc] init];
//        _newid = [[NSString alloc] init];
//        _dateLine = [[NSString alloc] init];
//        _title = [[NSString alloc] init];
//        _summary= [[NSString alloc] init];
//        
//        
//        
//        _img = [NSURL URLWithString: safeString([dic objectForKey:@"img"])];
//        _newid = safeString([dic objectForKey:@"newid"]);
//        _dateLine =  [CoreHelper timeStampToDate:safeString([dic objectForKey:@"dateline"])] ;
//        _summary = safeString([dic objectForKey:@"summary"]);
//        _title = safeString([dic objectForKey:@"title"]);
        
        
        
        
        _orderId = [[NSString alloc] init];
        _orderTime = [[NSString alloc] init];
        _orderType = [[NSString alloc] init];
        _orderPeople = [[NSString alloc] init];
        _totalNum = [[NSString alloc] init];
        _sendPrice = [[NSString alloc] init];
        _freesendPrice = [[NSString alloc] init];
        _totalPrice = [[NSString alloc] init];
        _extcredit = [[NSString alloc] init];
        _couponId = [[NSString alloc] init];
        _ccontent = [[NSString alloc] init];
        _stotalPrice = [[NSString alloc] init];
        _remark = [[NSString alloc] init];
        _createTime = [[NSString alloc] init];
        _address = [[NSString alloc] init];
        _mobile = [[NSString alloc] init];
        _linkMan = [[NSString alloc] init];
        _pid = [[NSString alloc] init];
        _discount = [[NSString alloc] init];
        _boxno = [[NSString alloc] init];
        _goodArr = [[NSMutableArray alloc] init];
        
        
        _orderId = safeString([dic objectForKey:@"orderid"]);
        _orderTime = safeString([dic objectForKey:@"ordertime"]);
        _orderType = safeString([dic objectForKey:@"ordertime"]);
        _orderPeople = safeString([dic objectForKey:@"orderpeople"]);
        _totalNum = safeString([dic objectForKey:@"totalnum"]);
        _sendPrice = safeString([dic objectForKey:@"sendprice"]);
        _freesendPrice = safeString([dic objectForKey:@"freesendprice"]);
        _totalPrice = safeString([dic objectForKey:@"totalprice"]);
        _extcredit = safeString([dic objectForKey:@"extcredit"]);
        _couponId = safeString([dic objectForKey:@"couponid"]);
        _ccontent = safeString([dic objectForKey:@"ccontent"]);
        _stotalPrice = safeString([dic objectForKey:@"stotalprice"]);
        _remark = safeString([dic objectForKey:@"remark"]);
        _createTime = [CoreHelper timeStampToDate:safeString([dic objectForKey:@"createtime"])];
        _address = safeString([dic objectForKey:@"address"]);
        _mobile = safeString([dic objectForKey:@"mobile"]);
        _linkMan = safeString([dic objectForKey:@"linkman"]);
        _pid = safeString([dic objectForKey:@"pid"]);
        _discount = safeString([dic objectForKey:@"discount"]);
        _boxno = safeString([dic objectForKey:@"boxno"]);
        
        _status = [safeString([dic objectForKey:@"status"]) integerValue];
        
        
        
        _goodArr = [[NSMutableArray alloc] init];
        
        NSArray *goodTempArr= [dic objectForKey:@"goodslist"];
        
        
        for (id goodTemp in goodTempArr) {
            ShoppingCartItemModel *model = [[ShoppingCartItemModel alloc] initWithDic:goodTemp];
            [_goodArr addObject:model];
        }
        
        
    }
    return self;
}

@end
