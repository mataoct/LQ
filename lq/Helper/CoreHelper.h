//
//  CoreHelper.h
//  lq
//
//  Created by  matao on 14-6-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MD5HexDigest.h"

static UIWebView *phoneCallWebView;
@interface CoreHelper : NSObject
+(NSString *)tokenController:(NSString *)controller action:(NSString *)action;
+(NSString *)timeStampToDate:(NSString *)timeStamp;
@end
