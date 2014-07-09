//
//  DiscountTableViewController.h
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountTableViewController : UITableViewController

@property (nonatomic,retain) NSDictionary *dataDic;

- (id)initWithStyle:(UITableViewStyle)style withDic:(NSDictionary *)dic;

@end
