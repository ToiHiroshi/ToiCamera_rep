//
//  Photo.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 26/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Movie;

@interface Photo : NSManagedObject

@property (nonatomic, retain) UIImage* image;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) Movie *movie;

@end
