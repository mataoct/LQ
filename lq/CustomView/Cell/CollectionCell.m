//
//  CollectionCell.m
//  lq
//
//  Created by  matao on 14-9-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        [self addSubview:_imageView];
        
    }
    return self;
}

//-(id)init
//{
//    self = [super init];
//    if (self) {
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        [self addSubview:_imageView];
//        
//
//    }
//    return self;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)fillCellWithModel:(WaterFlowModel *)model
{
    [_imageView setImageWithURL:model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
}

@end
