//
//  TCLibraryViewController.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 26/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCLibraryViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

- (void)setMovies:(NSArray *)movies;

@end
