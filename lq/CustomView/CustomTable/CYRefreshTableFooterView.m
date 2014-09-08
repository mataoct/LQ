//
//  CYRefreshTbaleFooterView.m
//  mobilegame
//
//  Created by creso on 13-3-21.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import "CYRefreshTableFooterView.h"

#define tagLineView 1

@implementation CYRefreshTableFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

        
        [_lastUpdatedLabel setFrame:CGRectMake(0.0f,  31.0f, self.frame.size.width, 20.0f)];
        [_statusLabel setFrame:CGRectMake(0.0f, 10/*23.0f*/, self.frame.size.width, 20.0f)];
        
    
		[_arrowImage setFrame:CGRectMake(100.0f, 60.0f, 30.0f, 55.0f)];
		[_activityView setFrame:CGRectMake(100.0f, 10/*23.0f*/, 20.0f, 20.0f)];

#warning FOOTER_BACKGROUND
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"refreshbg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)]];
        bgImageView.frame = CGRectMake(0, 1, 310, 40);
        //        bgImageView.center = self.center;
//        [self addSubview:bgImageView];
//        [self sendSubviewToBack:bgImageView];
        [bgImageView release];
        
#warning LINE_PATCH
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, -1, 310, 1)];
        lineView.backgroundColor = [UIColor clearColor];
        lineView.tag = tagLineView;
        [self addSubview:lineView];
        [lineView release];
    }
    return self;
}


- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView {
	
	if (_state == EGOOPullRefreshLoading) {
		
		CGFloat offset = MAX(scrollView.contentSize.height , scrollView.bounds.size.height);
        offset = MIN(offset, 50);
        
		scrollView.contentInset = UIEdgeInsetsMake(0, 0.0f,offset, 0.0f);
		
	} else if (scrollView.isDragging) {
		
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
		}
        
        float n = scrollView.contentSize.height +50/*65.0f*/ - self.bounds.size.height;
		if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y <= n && scrollView.contentOffset.y > 0 && !_loading) {
			[self setState:EGOOPullRefreshNormal];
		} else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y > n && !_loading) {
			[self setState:EGOOPullRefreshPulling];
		}
		
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		
	}
	
}


- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	
    if(scrollView == nil)
    {
        return;
    }
    
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
	}
	if (scrollView.contentOffset.y >=  (scrollView.contentSize.height+50/*65.0f*/- self.bounds.size.height)
        && !_loading
        && scrollView.contentOffset.y >0) {
		
        
        
        [UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 60.0f, 0.0f);
		[UIView commitAnimations];
        
        [self setState:EGOOPullRefreshLoading];
        
        if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:)]) {
			[_delegate egoRefreshTableHeaderDidTriggerRefresh:self];
		}

	}
	
}




#define FLIP_ANIMATION_DURATION 0.18f
- (void)setState:(EGOPullRefreshState)aState{
	
	switch (aState) {
		case EGOOPullRefreshPulling:
			
			_statusLabel.text = NSLocalizedString(@"松开开始刷新...", @"Release to refresh status");
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshNormal:
			
			if (_state == EGOOPullRefreshPulling) {
				[CATransaction begin];
                [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
        
			_statusLabel.text = NSLocalizedString(@"上拉加载更多...", @"Pull down to refresh status");
			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			[self refreshLastUpdatedDate];
			
			break;
		case EGOOPullRefreshLoading:
			
			_statusLabel.text = NSLocalizedString(@"加载中...", @"Loading Status");
			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = YES;
			[CATransaction commit];
			
			break;
		default:
			break;
	}
	
	_state = aState;
}


- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
	
	[self setState:EGOOPullRefreshNormal];
    
}

-(void)footerStatusLabel:(NSString *)string
{
    _statusLabel.text = string;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
