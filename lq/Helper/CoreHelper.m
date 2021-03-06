//
//  CoreHelper.m
//  lq
//
//  Created by  matao on 14-6-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CoreHelper.h"

@implementation CoreHelper

+(NSString *)tokenController:(NSString *)controller action:(NSString *)action
{
    NSString *token = [[NSString alloc] initWithFormat:@"%@%@%@%@",@"83ED5F4E02F32EB3827521BCF9E0AA83",controller,action,[self getDate]];
    
    return [token md5HexDigest];
}



+(NSString *)getDate
{
    
    NSDate *  date=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    return [dateformatter stringFromDate:date];
}

+(NSMutableArray *)weekInStr
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    
    NSString *day = [[NSString alloc] init];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    
    NSTimeInterval dayCount = 24*60*60;
    
    
    int i;
    
    for (i = 1; i <= 7; i ++) {
        //
        
        NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:dayCount*i];
        day = [dateformatter stringFromDate:tomorrow];
        
        
        [arr addObject:day];
    }
    
    //    NSLog(@"%@",arr);
    
    return arr;
}

+(void)callService:(NSString *)num
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",num]];
    if (!phoneCallWebView) {
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}


+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}


+(NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}


+(NSString *)timeStampToDate:(NSString *)timeStamp
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    return [self stringFromDate:confromTimesp];
}

+(void)setNetStatus:(NSString *)status
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:status forKey:@"netStatus"];
    [ud synchronize];
}

+(int)getNetStatus
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [[ud objectForKey:@"netStatus"] intValue];
}


+(BOOL)checkLogin
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![[ud objectForKey:@"loginUser"] isEqual:@""]&&[ud objectForKey:@"loginUser"]) {
        return true;
    }
    //    return true;
    return false;
}

+(void)setLoginInfo:(NSDictionary *)user
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:user forKey:@"loginUser"];
    [ud synchronize];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"kLoginStatusChangeNotification" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"loginStatus", nil ]];
}

+(UserInfoModel *)getLoginInfo
{
    if ([self checkLogin]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        UserInfoModel *model = [[UserInfoModel alloc] initWithDic:[ud objectForKey:@"loginUser"]];
        
        return model;
    }
    return nil;
}

+(NSString *)getLoginUid
{
    UserInfoModel *model = [[UserInfoModel alloc] init];
    
    
    model = [self getLoginInfo];
    
    return model.uid;
}

+(void)logout
{
    if ([self checkLogin]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:@"" forKey:@"loginUser"];
        [ud synchronize];
        
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"kLoginStatusChangeNotification" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"loginStatus", nil ]];
    }
}

+ (CGFloat)uiWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)uiHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}


+(void)setSellerPhone:(NSString *)phone
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:phone forKey:@"phone"];
    [ud synchronize];
}

+(NSString *)getSellerPhone
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"phone"];
}



+ (void)UMShare:(UIViewController *)controller
      shareText:(NSString *)shareText
     shareImage:(UIImage *)shareImage
       delegate:(id <UMSocialUIDelegate>)delegate
{
    [UMSocialSnsService presentSnsIconSheetView:controller
                                         appKey:kUMengAppKey
                                      shareText:shareText
                                     shareImage:shareImage
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,
                                                 UMShareToTencent,
                                                 nil]
                                       delegate:delegate];
    
}

+(void)loadWebPage:(NSString *)str
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


+(void)addTabbarBadgeValue
{    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kCartBtnBadgeChange" object:nil userInfo:nil];
}


+(UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

@end
