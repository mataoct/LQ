//
//  DisLineLabel.m
//  lq
//
//  Created by  matao on 14-9-14.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DisLineLabel.h"

@implementation DisLineLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _disLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    self.textColor = SkyBlue;
    [self setTextAlignment:NSTextAlignmentCenter];
    
    [_disLine setImage:[UIImage imageNamed:@"disline.png"]];
    
    [self addSubview:_disLine];
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
