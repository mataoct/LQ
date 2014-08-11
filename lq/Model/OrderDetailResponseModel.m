//
//  OrderDetailResponseModel.m
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderDetailResponseModel.h"

@implementation OrderDetailResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _orderId = [[NSString alloc] init];
        _orderTime = [[NSString alloc] init];
        _orderType = [[NSString alloc] init];
        _orderPeople = [[NSString alloc] init];
        _status = [[NSString alloc] init];
        _totalNum = [[NSString alloc] init];
        _sendPrice = [[NSString alloc] init];
        _freeSendPrice = [[NSString alloc] init];
        _totalPrice = [[NSString alloc] init];
        _extCredit = [[NSString alloc] init];
        _coupondId = [[NSString alloc] init];
        _cconttent = [[NSString alloc] init];
        _stotalPrice = [[NSString alloc] init];
        _remark = [[NSString alloc] init];
        _createTime = [[NSString alloc] init];
        _address = [[NSString alloc] init];
        _mobile = [[NSString alloc] init];
        _linkMan = [[NSString alloc] init];
        _pid = [[NSString alloc] init];
        _discount = [[NSString alloc] init];
        
        
        _orderId = safeString([[dic objectForKey:@"data"] objectForKey:@"orderid"]);
        _orderTime =  [CoreHelper timeStampToDate:safeString([[dic objectForKey:@"data"] objectForKey:@"ordertime"])] ;
        _orderType = safeString([[dic objectForKey:@"data"] objectForKey:@"ordertype"]);
        _orderPeople = safeString([[dic objectForKey:@"data"] objectForKey:@"orderpeople"]);
        _status = safeString([[dic objectForKey:@"data"] objectForKey:@"status"]);
        _totalNum = safeString([[dic objectForKey:@"data"] objectForKey:@"totalnum"]);
        _sendPrice = safeString([[dic objectForKey:@"data"] objectForKey:@"sendprice"]);
        _freeSendPrice = safeString([[dic objectForKey:@"data"] objectForKey:@"freesendprice"]);
        _totalPrice = safeString([[dic objectForKey:@"data"] objectForKey:@"totalprice"]);
        _extCredit = safeString([[dic objectForKey:@"data"] objectForKey:@"extcredit"]);
        _coupondId = safeString([[dic objectForKey:@"data"] objectForKey:@"couponid"]);
        _cconttent = safeString([[dic objectForKey:@"data"] objectForKey:@"ccontent"]);
        _stotalPrice = safeString([[dic objectForKey:@"data"] objectForKey:@"stotalprice"]);
        _remark = safeString([[dic objectForKey:@"data"] objectForKey:@"remark"]);
        _createTime = [CoreHelper timeStampToDate:safeString([[dic objectForKey:@"data"] objectForKey:@"createtime"])] ;
        _address = safeString([[dic objectForKey:@"data"] objectForKey:@"address"]);
        _mobile = safeString([[dic objectForKey:@"data"] objectForKey:@"mobile"]);
        _linkMan = safeString([[dic objectForKey:@"data"] objectForKey:@"linkman"]);
        _pid = safeString([[dic objectForKey:@"data"] objectForKey:@"pid"]);
        _discount = safeString([[dic objectForKey:@"data"] objectForKey:@"discount"]);
        
        
        
        
    
        _goodList = [[NSMutableArray alloc] init];
        NSArray *goodsTempArr= [[dic objectForKey:@"data"] objectForKey:@"goodslist"];
        for (id goodsTemp in goodsTempArr) {
            ShoppingCartItemModel *model = [[ShoppingCartItemModel alloc] initWithDic:goodsTemp];
            [_goodList addObject:model];
        }
    }
    return self;
}
@end
