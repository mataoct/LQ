//
//  CusSettingBtn.m
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CusSettingBtn.h"

@implementation CusSettingBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 7, 100, 30)];
        _textLabel.font = [UIFont systemFontOfSize:16];
        _textLabel.textAlignment = NSTextAlignmentLeft;
        
        _textLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 7, 170, 30)];
        _textLabel2.font = [UIFont systemFontOfSize:12];
        _textLabel2.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:_textLabel];
        [self addSubview:_textLabel2];
        
        [self setBackgroundImage:[UIImage imageNamed:@"bgArrow.png"] forState:UIControlStateNormal];
        
        
//        self.backgroundColor = 
        
    }
    return self;
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
