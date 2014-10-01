//
//  FrontMenuTableViewCell.m
//  lq
//
//  Created by  matao on 14-10-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "FrontMenuTableViewCell.h"

@implementation FrontMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        _headImage = [[UIImageView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        
        _cateModel = [[CategoriesModel alloc] init];
        
//        _headImage.backgroundColor = [UIColor orangeColor];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_headImage];
        [self addSubview:_titleLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = BackGray;

    }
    return self;
}


-(void)fillByModel:(CategoriesModel *)model index:(NSInteger)row
{
    _cateModel = model;
    _titleLabel.backgroundColor = _cateModel.imgColor ;
    _titleLabel.text = _cateModel.title;
    
    [_headImage setImageWithURL:_cateModel.imgUrl placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    
    if (row % 2 == 0) {
        [_headImage setFrame:CGRectMake(0, 0, 200, 88)];
        [_titleLabel setFrame:CGRectMake(200, 0, 100, 88)];
        
    }
    else
    {
        [_headImage setFrame:CGRectMake(100, 0, 200, 88)];
        [_titleLabel setFrame:CGRectMake(0, 0, 100, 88)];
    }
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
