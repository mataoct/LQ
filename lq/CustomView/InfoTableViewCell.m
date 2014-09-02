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
        _contentText = [[UITextView alloc] initWithFrame:CGRectMake(115, 30, 175, 36)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 70, 100, 10)];
        
//        _titleLabel.backgroundColor = [UIColor orangeColor];
        _contentText.editable = false;
        _contentText.userInteractionEnabled = false;
        
        
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _contentText.font = [UIFont systemFontOfSize:12];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 90)];
        
        [temp addSubview:_headImage];
        [temp addSubview:_titleLabel];
        [temp addSubview:_contentText];
        [temp addSubview:_timeLabel];
        
        temp.backgroundColor = [UIColor whiteColor];
        
        self.backgroundColor = BackGray;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:temp];
        
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
    
    [_headImage setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _contentText.text = _model.summary;
    _timeLabel.text = _model.dateLine;
}

@end
