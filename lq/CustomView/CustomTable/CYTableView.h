//
//  CYTableView.h
//  mobilegame
//
//  Created by creso on 13-3-21.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "CYRefreshTableFooterView.h"
#import "CYRefreshTableHeaderView.h"



@protocol CYTableViewDelegate <NSObject>
//在实现 tableview delegate  的controller 里 调用 下面2个方法 传入  scrollview
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//        [tableView.hearderView egoRefreshScrollViewDidScroll:scrollView];
//        [tableView.footerView egoRefreshScrollViewDidScroll:scrollView];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//        [tableView.hearderView egoRefreshScrollViewDidEndDragging:scrollView];
//        [tableView.footerView egoRefreshScrollViewDidEndDragging:scrollView];
//}

@optional

-(void)refreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view;

-(void)refreshTableFooterDataSourceIsLoading:(EGORefreshTableHeaderView *)view;

-(void)refreshTableFinish:(EGORefreshTableHeaderView *)view;

@end


@interface CYTableView : UITableView<EGORefreshTableHeaderDelegate>

@property (nonatomic,assign) BOOL headerRefreshEnabled;
@property (nonatomic,assign) BOOL footerRefreshEnabled;

@property (nonatomic,assign) CYRefreshTableHeaderView *hearderView;
@property (nonatomic,assign) CYRefreshTableFooterView *footerView;

@property (nonatomic,assign) id<CYTableViewDelegate> CYdelegate;
@property (nonatomic,assign) NSInteger pageCount;

//状态
@property (nonatomic,assign) NSString *footerTitle;
@property (nonatomic,assign) NSString *headerTitle;


@property (nonatomic,assign) BOOL headerRefreshing;
@property (nonatomic,assign) BOOL footerRefreshing;

//加载完成时调用 复位
- (void)endHearderRefreshing;

- (void)endFooterRefreshing;


@end
