//
//  MenuItemView.m
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuItemView.h"
#import "UIImageView+WebCache.h"

@implementation MenuItemView

- (id)initWithFrame:(CGRect)frame andDate:(NSDictionary *)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        

        
        //[image setImageWithURL:dic placeholderImage:nil];
        
        
        for (int i = 1; i<= [dic count]; i++) {
            //
            
            int row  = fabs(i%2 - 1);
            int colum = (i - 1)/2;
            
            
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(row*150 + 10 , colum*150 + 10, 130, 130)];
//            image.text = [NSString stringWithFormat:@"%d",i];
            
            
            image.userInteractionEnabled = YES;
            
            image.tag = i;
            
            UITapGestureRecognizer *imageTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTouch:)];
            
            [image addGestureRecognizer:imageTouch];
            
            image.backgroundColor = [UIColor blueColor];
            
            
            [self addSubview:image];
        }
        
        self.contentSize = CGSizeMake(320, [dic count]%2 == 0?150*([dic count]/2):150*([dic count]/2 + 1) );
        
        self.backgroundColor = [UIColor lightGrayColor];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/




-(void)imageTouch:(UIGestureRecognizer *)gesture
{
    
//    NSLog(@"touch") ;
    NSLog(@"%d",gesture.view.tag);


}



@end
