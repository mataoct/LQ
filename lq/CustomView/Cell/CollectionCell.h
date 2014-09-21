//
//  CollectionCell.h
//  lq
//
//  Created by  matao on 14-9-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterFlowModel.h"
#import "UIImageView+WebCache.h"

@interface CollectionCell : UICollectionViewCell

@property (nonatomic,strong) WaterFlowModel *model;

@property (nonatomic,strong) IBOutlet UIImageView *imageView;

-(void)fillCellWithModel:(WaterFlowModel *)model;


@end
