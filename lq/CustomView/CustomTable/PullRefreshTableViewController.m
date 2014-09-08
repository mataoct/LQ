//
//  PullRefreshTableViewControllerViewController.m
//  account
//
//  Created by creso on 13-2-15.
//  Copyright (c) 2013年 17173. All rights reserved.
//

#import "PullRefreshTableViewController.h"

#define REFRESH_FOOTER_HEIGHT   50.0f
#define startOffset             (scrollView.contentSize.height - scrollView.frame.size.height)
#define contentOffsetY          (scrollView.contentOffset.y + REFRESH_FOOTER_HEIGHT - startOffset)
#define QUERY_SIZE               @"15"
@interface PullRefreshTableViewController ()

@end

@implementation PullRefreshTableViewController

@synthesize refreshFooterView,refreshLabel,refreshSpinner,isDisableEGO,tableCell;

-(void)dealloc{
    [tableCell release];
    tableCell = nil;
//    [refreshLabel release];
//    refreshLabel = nil;
//    [refreshSpinner release];
//    refreshSpinner = nil;
    [refreshFooterView release];
    refreshFooterView = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.refreshFooterView = [self addPullToRefreshFooter];
    refreshLabel = (UILabel *)[refreshFooterView viewWithTag:101];
    refreshSpinner = (UIActivityIndicatorView *)[refreshFooterView viewWithTag:102];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - 构造table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
/////////////////////////////////上拉加载更多/////////////////////////////////////////
- (UIView *)addPullToRefreshFooter
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, REFRESH_FOOTER_HEIGHT)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, REFRESH_FOOTER_HEIGHT - 35.0f, 320.0f, 20.0f)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.font = [UIFont boldSystemFontOfSize:13.0f];
    label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    label.shadowOffset = CGSizeMake(0.0f, 1.0f);
    label.tag = 101;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.tag = 102;
    spinner.frame = CGRectMake(90, 15, 20, 20);
    spinner.hidesWhenStopped = YES;
    
    [view addSubview:label];
    [view addSubview:spinner];
    [view setBackgroundColor:[UIColor clearColor]];
    [label release];
    [spinner release];
    return [view autorelease];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (isLoading) return;
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!isDisableEGO) {
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
    if (isLoading) {
        
    } else if (isDragging) {
        refreshLabel.text = @"上拉加载更多...";
        [refreshSpinner stopAnimating];
        if (contentOffsetY >= REFRESH_FOOTER_HEIGHT){
            [refreshSpinner startAnimating];
            refreshLabel.text = @"松开开始刷新...";
        }
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!isDisableEGO) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    if (isLoading) return;
    isDragging = NO;
    NSLog(@"%f-%f",contentOffsetY,REFRESH_FOOTER_HEIGHT);
    if (contentOffsetY >= REFRESH_FOOTER_HEIGHT) {
        [self performSelector:@selector(startLoading) withObject:nil afterDelay:2.5];
    }
}

- (void)startLoading {
    isLoading = YES;
    [UIView beginAnimations:nil context:refreshLabel];
    [UIView setAnimationDuration:0.3];
    refreshLabel.text = @"加载中...";
//    [refreshSpinner startAnimating];
    [UIView commitAnimations];
}

- (void)stopLoading
{
    isLoading = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(stopLoadingComplete)];
    [UIView commitAnimations];
}

- (void)stopLoadingComplete
{
//    [self stopLoadingComplete];
}

/////////////////////////////////下拉刷新/////////////////////////////////////////
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource{
    _reloading = YES;
}

- (void)doneLoadingTableViewData{
	
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return _reloading;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	return [NSDate date]; // should return date data source was last changed
}

@end
