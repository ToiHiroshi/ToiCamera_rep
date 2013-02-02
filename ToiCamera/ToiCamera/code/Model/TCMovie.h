//
//  TCMovie.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 24/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCMovie : NSObject

- (void)save;
- (void)addPhotosObject:(UIImage *)object;
+ (NSArray*)getMovies;
- (void)replacePhoto:(UIImage *)img atIndex:(NSInteger)idx;

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSMutableArray * photos;

@end
