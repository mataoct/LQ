//
//  InfoDetailRequestModel.h
//  lq
//
//  Created by  matao on 14-9-21.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "InfoModel.h"

@interface InfoDetailRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *newsId;

-(id)initWithNewID:(NSString *)newsId;

@end
