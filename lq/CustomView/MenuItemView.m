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
            
            
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(row*160 + 5 , colum*110 + 5, 150, 100)];
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
    
    float contentHeight = [arr count]%2 == 0?110*([arr count]/2):110*([arr count]/2 + 1);
    
    
    NSLog(@"%f,%f",contentHeight,self.frame.size.height );
    
    self.contentSize = CGSizeMake(320, self.frame.size.height >contentHeight ?self.frame.size.height:contentHeight );
        
    self.backgroundColor = BackGray;
        
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
