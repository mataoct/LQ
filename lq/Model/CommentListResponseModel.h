//
//  CommentListResponseModel.h
//  lq
//
//  Created by 马涛 on 14-7-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "CommentModel.h"

@interface CommentListResponseModel : BaseResponseModel

//@property (nonatomic,strong) NSString* str;
@property (nonatomic,strong) NSMutableArray *commentArr;
@property (nonatomic,assign) NSInteger commentNum;

-(id)initWithDic:(NSDictionary *)dic;

@end
