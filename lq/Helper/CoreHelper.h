//
//  CoreHelper.h
//  lq
//
//  Created by  matao on 14-6-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MD5HexDigest.h"

#import "UserInfoModel.h"
#import "UMSocial.h"

static UIWebView *phoneCallWebView;
@interface CoreHelper : NSObject
+(NSString *)tokenController:(NSString *)controller action:(NSString *)action;
+(NSString *)timeStampToDate:(NSString *)timeStamp;


+(BOOL)checkLogin;

+(void)setLoginInfo:(NSDictionary *)user;

+(void)logout;

+(UserInfoModel *)getLoginInfo;

+(void)callService:(NSString *)num;

+(NSString *)getLoginUid;



+ (CGFloat)uiWidth;

+ (CGFloat)uiHeight;


+(void)setSellerPhone:(NSString *)phone;

+(NSString *)getSellerPhone;

+ (void)UMShare:(UIViewController *)controller
      shareText:(NSString *)shareText
     shareImage:(UIImage *)shareImage
       delegate:(id <UMSocialUIDelegate>)delegate;

+(void)addTabbarBadgeValue;

@end
