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
        
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 40, 16)];
        _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 0, 16, 16)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100, 16)];
        
        _contentText = [[UITextView alloc] initWithFrame:CGRectMake(40, 20, 220, 36)];
        _contentText.editable = false;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    [_headImageView setImageWithURL:_model.avatar placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    [_sexImageView setImage:[UIImage imageNamed:@""]];
    _model.sex==1?[_sexImageView setImage:[UIImage imageNamed:@"male.png"]]:[_sexImageView setImage:[UIImage imageNamed:@"female.png"]];
    
    _userLabel.text = _model.username;
    _timeLabel.text = _model.dateline;
    _contentText.text = _model.message;
}

@end
