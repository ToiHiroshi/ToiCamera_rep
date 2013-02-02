//
//  TCLibraryViewCollectionCell.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 26/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCLibraryViewCollectionCell.h"

@implementation TCLibraryViewCollectionCell

@synthesize imageView = _imageView;
@synthesize label = _label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 60, 60)];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 80, 15)];
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_label];
        [_imageView setBackgroundColor:[UIColor redColor]];
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

@end
