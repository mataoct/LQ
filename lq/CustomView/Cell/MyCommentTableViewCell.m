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
        
        
        _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70 )];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 160, 20)];
        _content = [[UITextView alloc] initWithFrame:CGRectMake(115, 30, 180, 38)];
        _time = [[UILabel alloc] initWithFrame:CGRectMake(115, 68, 100, 12)];
        
        _model = [[MyCommentModel alloc] init];
        
        _content.editable = false;
        _content.userInteractionEnabled = false;
        
        
        _time.font = [UIFont systemFontOfSize:12];
        _content.font = [UIFont systemFontOfSize:12];
        _title.font = [UIFont systemFontOfSize:18];
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 90)];
        
        temp.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = BackGray;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [temp addSubview:_headImg];
        [temp addSubview:_title];
        [temp addSubview:_content];
        [temp addSubview:_time];
        [self addSubview:temp];
    }
    return self;
}

-(void)fillCellByModel:(MyCommentModel *)model
{
    _model = model;
    
    
    [_headImg setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"头像-评论.png"] success:nil failure:nil];
    
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
