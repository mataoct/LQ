//
//  CYTableView.m
//  mobilegame
//
//  Created by creso on 13-3-21.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import "CYTableView.h"

@interface CYTableView()
{
    BOOL headerReloading;
    
    BOOL footerReloading;
}

@end

@implementation CYTableView
@synthesize headerRefreshEnabled,footerRefreshEnabled;
@synthesize hearderView,footerView;
@synthesize CYdelegate;
@synthesize pageCount;
@synthesize footerTitle;
@synthesize headerTitle;

#define TbaleView_minHeight ([CYInfo is4inchScreen])?405:317

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        pageCount = 1;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        // Initialization code
        pageCount = 1;
    }
    return self;
}

#define ego delegate
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    return ([view isEqual:hearderView])?headerReloading:footerReloading;
}


- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    
    if([view isEqual:hearderView])
    {
        [self beginHearderRefreshing];
        if ([self.CYdelegate respondsToSelector:@selector(refreshTableHeaderDataSourceIsLoading:)]) {
            [self.CYdelegate refreshTableHeaderDataSourceIsLoading:hearderView];
        }
        
    }
    else if([view isEqual:footerView])
    {
        [self beginFooterRefreshing];
        if ([self.CYdelegate respondsToSelector:@selector(refreshTableFooterDataSourceIsLoading:)]) {
            [self.CYdelegate refreshTableFooterDataSourceIsLoading:footerView];
        }
        
    }

}

- (void)egoRefreshScrollDidFinished:(EGORefreshTableHeaderView *)view
{
    [self setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    if ([self.CYdelegate respondsToSelector:@selector(refreshTableFinish:)]) {
        [self.CYdelegate refreshTableFinish:view];
    }
    
}

//
//-(void)refreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
//{
//
//}
//
//-(void)refreshTableFooterDataSourceIsLoading:(EGORefreshTableHeaderView *)view
//{
//    
//}






#pragma mark Data Source Loading / Reloading Methods

- (void)beginHearderRefreshing{
	headerReloading = YES;
}

-(void)beginFooterRefreshing{
    footerReloading = YES;
}

- (void)endHearderRefreshing{
    
     [hearderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    if(headerReloading)
        headerReloading = NO;
}




- (void)endFooterRefreshing{
    
   [footerView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    if(footerReloading)
       footerReloading = NO;

   
    
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)iniHeaderRefresh
{
    if(hearderView == nil)
    {
        hearderView  = [[CYRefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - [CoreHelper uiHeight], [CoreHelper uiWidth], [CoreHelper uiHeight])];
        hearderView.delegate = self;
        [self addSubview:hearderView];
        [hearderView release];
    }
}


-(void)iniFooterRefresh
{
    if(footerView == nil)
    {
        footerView  = [[CYRefreshTableFooterView alloc] initWithFrame:CGRectMake(0.0f,MAX(self.contentSize.height,self.bounds.size.height), [CoreHelper uiWidth], [CoreHelper uiHeight])];
        footerView.delegate = self;
        [self addSubview:footerView];
        [footerView release];
    }
}


-(void)setHeaderRefreshEnabled:(BOOL)is
{
    headerRefreshEnabled = is;
    if(headerRefreshEnabled)
    {
        [self iniHeaderRefresh];
    }
    else
    {
        if(hearderView)
        {
            
            [hearderView removeFromSuperview];
            hearderView = nil;
            hearderView.delegate = nil;
        }
    }
}

-(void)setFooterRefreshEnabled:(BOOL)is
{
    footerRefreshEnabled = is;
    if(footerRefreshEnabled)
    {
        [self iniFooterRefresh];
    }
    else
    {
        if(footerView)
        {
            
            [footerView removeFromSuperview];
            footerView = nil;
            footerView.delegate = nil;
        }
    }
}

-(void)setHeaderTitle:(NSString *)string
{
    [hearderView headerStatusLabel:string];
    headerTitle = string;
}

-(void)setFooterTitle:(NSString *)string
{
    [footerView footerStatusLabel:string];
    footerTitle = string;
}

-(void)reloadData
{
    [super reloadData];
    
    if(self.contentSize.height > 0)
    {
        NSLog(@"contentSize=%f-height=%f",self.contentSize.height,self.bounds.size.height);
        [footerView setFrame:CGRectMake(0,MAX(self.contentSize.height,self.bounds.size.height), footerView.frame.size.width, footerView.frame.size.height)];
    }
    
    
    

}



@end
