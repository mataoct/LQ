//
//  MyCommentTableViewCell.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyCommentTableViewCell.h"

@implementation MyCommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
        _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 70 )];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 90, 20)];
        _content = [[UITextView alloc] initWithFrame:CGRectMake(110, 30, 180, 40)];
        _time = [[UILabel alloc] initWithFrame:CGRectMake(110, 70, 100, 20)];
        
        _model = [[MyCommentModel alloc] init];
        
        _content.editable = false;
        
        [self addSubview:_headImg];
        [self addSubview:_title];
        [self addSubview:_content];
        [self addSubview:_time];
    }
    return self;
}

-(void)fillCellByModel:(MyCommentModel *)model
{
    _model = model;
    
    
    [_headImg setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    
    _title.text = _model.title;
    _content.text = [NSString stringWithFormat:@"评论内容：%@",_model.content];
    _time.text = _model.createTime;
    
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
