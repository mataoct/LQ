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




- (void)setDataSource:(NSArray *)arr
{

        
        //[image setImageWithURL:dic placeholderImage:nil];
        
        
        for (int i = 1; i<= [arr count]; i++) {
            //
            
            int row  = fabs(i%2 - 1);
            int colum = (i - 1)/2;
            
            
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(row*150 + 10 , colum*150 + 10, 130, 130)];
//            image.text = [NSString stringWithFormat:@"%d",i];

            HotModel *model = [arr objectAtIndex:i-1];
            
            
            image.userInteractionEnabled = YES;
            
            [image setImageWithURL:model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
            
            image.tag = i-1;
            
            UITapGestureRecognizer *imageTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTouch:)];
            
            [image addGestureRecognizer:imageTouch];
            
//            image.backgroundColor = [UIColor blueColor];
            
            
            [self addSubview:image];
        }
        
        self.contentSize = CGSizeMake(320, [arr count]%2 == 0?150*([arr count]/2):150*([arr count]/2 + 1) );
        
        self.backgroundColor = [UIColor lightGrayColor];
        
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
    
    
    if ([self.menuDelegate respondsToSelector:@selector(menuItemClick:)]) {
        //
        [self.menuDelegate menuItemClick:gesture.view.tag];
    }
//    NSLog(@"touch") ;
//    NSLog(@"%d",gesture.view.tag);


}



@end
