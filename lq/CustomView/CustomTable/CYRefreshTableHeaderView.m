//
//  CYRefreshTableHeaderView.m
//  mobilegame
//
//  Created by creso on 13-3-24.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import "CYRefreshTableHeaderView.h"

@implementation CYRefreshTableHeaderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [_lastUpdatedLabel setFrame:CGRectMake(0.0f, self.frame.size.height-51.0f, self.frame.size.width, 20.0f)];
        [_statusLabel setFrame:CGRectMake(0.0f, self.frame.size.height-43.0f, self.frame.size.width, 20.0f)];
        
        
		[_arrowImage setFrame:CGRectMake(100.0f, self.frame.size.height-80.0f, 30.0f, 55.0f)];
		[_activityView setFrame:CGRectMake(100.0f, self.frame.size.height -43.0f, 20.0f, 20.0f)];
        
        self.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0];
    }
    return self;
}




-(void)headerStatusLabel:(NSString *)string
{
    _statusLabel.text  = string;
}

@end
