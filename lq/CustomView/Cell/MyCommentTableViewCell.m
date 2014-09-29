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
        
        _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 60, 20, 20)];
        [_checkBtn addTarget:self action:@selector(checkButtonClick) forControlEvents:UIControlEventTouchUpInside];
       
        
        //[[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 20, 20)];
        
        _model = [[MyCommentModel alloc] init];
        
        _content.editable = false;
        _content.userInteractionEnabled = false;
        
//        _ischeck = 0;
        _time.font = [UIFont systemFontOfSize:12];
        _content.font = [UIFont systemFontOfSize:12];
        _title.font = [UIFont systemFontOfSize:18];
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
        
        temp.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = BackGray;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [temp addSubview:_headImg];
        [temp addSubview:_title];
        [temp addSubview:_content];
        [temp addSubview:_time];
        [temp addSubview:_checkBtn];
        [self addSubview:temp];
    }
    return self;
}

-(void)fillCellByModel:(MyCommentModel *)model
{
    _model = model;
    
    
    [_headImg setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    if (_model.ischeck == 0) {
        
        [_checkBtn setImage:[UIImage imageNamed:@"勾选-未.png"] forState:UIControlStateNormal];
    }
    else
    {
        [_checkBtn setImage:[UIImage imageNamed:@"勾选-已.png"] forState:UIControlStateNormal];
    }
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


-(void)checkButtonClick
{
    
    if (_model.ischeck == 0) {
        _model.ischeck = 1;
        [_checkBtn setImage:[UIImage imageNamed:@"勾选-已.png"] forState:UIControlStateNormal];
    }
    else
    {
        _model.ischeck = 0;
        [_checkBtn setImage:[UIImage imageNamed:@"勾选-未.png"] forState:UIControlStateNormal];
    }
    
    
    if ([_delegate respondsToSelector:@selector(commentBtnClick:checkStatus:)]) {
        [_delegate commentBtnClick:_model checkStatus:_model.ischeck];
    }
    
    
}

@end
