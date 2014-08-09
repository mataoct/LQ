//
//  DiscountTableViewCell.m
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DiscountTableViewCell.h"

@implementation DiscountTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
//        @property (nonatomic,strong) UIImageView *headImage;
//        @property (nonatomic,strong) UILabel *titleLabel;
//        @property (nonatomic,strong) UITextView *contentText;
//        @property (nonatomic,strong) UILabel *timeLabel;
//        @property (nonatomic,strong) UILabel *couponLabel;
//        @property (nonatomic,strong) UILabel *couponValueLabel;
//        @property (nonatomic,strong) UILabel *timeValueLabel;
//        @property (nonatomic,strong) UIButton *checkBtn;
        
        _model = [[CouponModel alloc] init];
        
        
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 100, 20)];
        _contentText = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, 170, 20)];
        _couponLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 60, 170, 20)];
        _couponValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 60, 60, 20)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 85, 80, 20)];
        _timeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 85, 80, 20)];
        _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 60, 60 , 40)];
        
        
        _titleLabel.backgroundColor = [UIColor greenColor];
        
        [self addSubview:_headImage];
        [self addSubview:_titleLabel];
        [self addSubview:_contentText];
        [self addSubview:_couponLabel];
        [self addSubview:_couponValueLabel];
        [self addSubview:_timeLabel];
        [self addSubview:_timeValueLabel];
        [self addSubview:_checkBtn];
        
        
        
        
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

-(void)fillCellByModel:(CouponModel *)model
{
    _model = model;
    _titleLabel.text = model.title;
    [_headImage setImageWithURL:model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    _contentText.text = model.description;
    _couponValueLabel.text = model.extrcedit;
    _timeValueLabel.text = model.expiry;
}

@end
