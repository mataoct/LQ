//
//  MenuItemView.h
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"

@protocol MenuItemDelegate <NSObject>

-(void)menuItemClick:(NSInteger)tag;

@end


@interface MenuItemView : UIScrollView

@property (nonatomic,assign) id<MenuItemDelegate> menuDelegate;

- (void)setDataSource:(NSArray *)arr;

@end
