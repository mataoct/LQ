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
        
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 100, 20)];
        _contentText = [[UILabel alloc] initWithFrame:CGRectMake(115, 25, 170, 20)];
        
        
        _couponLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 45, 170, 20)];
        _couponValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(195, 43, 60, 20)];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 62, 80, 20)];
        _timeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 62, 80, 20)];
        
        
        _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 60, 40 , 20)];
        [_checkBtn setBackgroundColor:Orange];
        
        _checkBtn.layer.cornerRadius = 3.0;
        [_checkBtn setTitle:@"使用" forState:UIControlStateNormal];
        _checkBtn.font = [UIFont systemFontOfSize:12];
        
//        [_checkBtn addTarget:self action:@selector(userCoupon) forControlEvents:UIControlEventTouchUpInside];
        
        _couponLabel.text = @"兑换所需积分：";
        _timeLabel.text = @"有效期至：";
        
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _contentText.font = [UIFont systemFontOfSize:12];
        
        _couponLabel.font = [UIFont systemFontOfSize:12];
        _couponValueLabel.font = [UIFont systemFontOfSize:14];
        
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeValueLabel.font = [UIFont systemFontOfSize:12];
        
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 90)];
        [temp setBackgroundColor:[UIColor whiteColor]];
        
        self.backgroundColor = BackGray;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        _titleLabel.backgroundColor = [UIColor greenColor];
        
        [temp addSubview:_headImage];
        [temp addSubview:_titleLabel];
        [temp addSubview:_contentText];
        [temp addSubview:_couponLabel];
        [temp addSubview:_couponValueLabel];
        [temp addSubview:_timeLabel];
        [temp addSubview:_timeValueLabel];
        [temp addSubview:_checkBtn];
        
        
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

-(void)fillCellByModel:(CouponModel *)model
{
    _model = model;
    _titleLabel.text = model.title;
    [_headImage setImageWithURL:model.img placeholderImage:[UIImage imageNamed:@"默认图片1.png"] success:nil failure:nil];
    _contentText.text = model.myDescription;
    _couponValueLabel.text = [NSString stringWithFormat:@"%@分",model.extrcedit];
    _timeValueLabel.text = model.expiry;
}


@end
