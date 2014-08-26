//
//  CommentTableViewCell.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _model = [[CommentModel alloc] init];
        
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 36, 36)];
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 4, 60, 16)];
        _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 4, 16, 16)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 4, 100, 16)];
        
        _contentText = [[UILabel alloc] initWithFrame:CGRectMake(50, 22, 220, 16)];
        
        
        _userLabel.font = [UIFont systemFontOfSize:14];
        _contentText.font = [UIFont systemFontOfSize:12];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
//        _contentText.backgroundColor = [UIColor greenColor];
//        _contentText.editable = false;
        _contentText.userInteractionEnabled = false;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        self.backgroundColor = [UIColor greenColor];
        
        [self addSubview:_headImageView];
        [self addSubview:_userLabel];
        [self addSubview:_sexImageView];
        [self addSubview:_timeLabel];
        [self addSubview:_contentText];
        
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

-(void)fillWithModel:(CommentModel *)model
{
    _model = model;
    [_headImageView setImageWithURL:_model.avatar placeholderImage:[UIImage imageNamed:@"头像-评论.png"] success:nil failure:nil];
//    [_sexImageView setImage:[UIImage imageNamed:@""]];
    _model.sex==1?[_sexImageView setImage:[UIImage imageNamed:@"性别男.png"]]:[_sexImageView setImage:[UIImage imageNamed:@"性别-女.png"]];
    
    _userLabel.text = _model.username;
    _timeLabel.text = _model.dateline;
    _contentText.text = _model.message;
}

@end
