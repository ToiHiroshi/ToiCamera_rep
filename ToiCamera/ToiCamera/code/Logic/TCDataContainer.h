//
//  TCDataContainer.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 24/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCMovie.h"

@interface TCDataContainer : NSObject

+ (TCDataContainer*)instance;
- (void)resetData;

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) TCMovie* movie;

@end
