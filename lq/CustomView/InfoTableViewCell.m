//
//  InfoTableViewCell.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        _model = [[InfoModel alloc] init];
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 175, 20)];
        _contentText = [[UITextView alloc] initWithFrame:CGRectMake(115, 45, 175, 40)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 90, 100, 16)];
        
//        _titleLabel.backgroundColor = [UIColor orangeColor];
        _contentText.editable = false;
        
        [self addSubview:_headImage];
        [self addSubview:_titleLabel];
        [self addSubview:_contentText];
        [self addSubview:_timeLabel];
        
    }
    return self;
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


-(void)fillCellByModel:(InfoModel *)model
{
    _model = model;
    
    [_headImage setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _contentText.text = _model.summary;
    _timeLabel.text = _model.dateLine;
}

@end
