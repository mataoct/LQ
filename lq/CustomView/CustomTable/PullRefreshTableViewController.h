//
//  PullRefreshTableViewControllerViewController.m
//  account
//
//  Created by creso on 13-2-15.
//  Copyright (c) 2013年 17173. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface PullRefreshTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    UIView *refreshFooterView;
    UIActivityIndicatorView *refreshSpinner;
    UILabel *refreshLabel;
    
    BOOL isDisableEGO; //如果为yes则禁用下拉刷新
    BOOL isDragging;
    BOOL isLoading;
    int pageCount;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
}
@property (nonatomic) BOOL isDisableEGO;
@property (nonatomic, retain) UIView *refreshFooterView;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) IBOutlet UITableViewCell *tableCell;

- (UIView *)addPullToRefreshFooter;


- (void)startLoading;
- (void)stopLoading;

@end
