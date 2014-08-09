//
//  LQUIViewController.h
//  lq
//
//  Created by 马涛 on 14-6-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQUIViewController : UIViewController

//@property (nonatomic,retain) UINavigationController *navi;
@property (nonatomic,retain) UINavigationItem *item;
@property (nonatomic,retain) UINavigationBar *bar;
-(id)initWithTitle:(NSString *)str;
-(void)setBackButtonHide:(BOOL)hide;
@end
