//
//  Movie.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 26/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo;

@interface Movie : NSManagedObject

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) UIImage* thumbnail;
@property (nonatomic, retain) NSSet *photos;
@end

@interface Movie (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end
