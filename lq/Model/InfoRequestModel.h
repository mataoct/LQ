//
//  InfoRequestModel.h
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "InfoResponseModel.h"

@interface InfoRequestModel : BaseRequestModel <ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;


-(id)initWithSeller:(NSString *)sellerId Start:(NSString *)start Limit:(NSString *)limit;
@end
