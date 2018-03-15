//
//  DemoCollectionViewCell.m
//  collectionView
//
//  Created by PatrickY on 2018/3/15.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "DemoCollectionViewCell.h"

@implementation DemoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置单元格
        CGFloat cellWidth = self.frame.size.width;
        
        CGFloat imageViewWidth = 100;
        CGFloat imageViewHeight = 100;
        CGFloat topView = 10;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth - imageViewWidth) / 2, topView, imageViewWidth, imageViewHeight)];
        
        [self addSubview:_imageView];
        
        CGFloat labelWidth = 100;
        CGFloat labelHeight = 16;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth - labelWidth) / 2, topView + 100, labelWidth, labelHeight)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_label];
        
    }
    return self;
}

@end
