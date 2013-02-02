//
//  TCDataContainer.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 24/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCDataContainer.h"
#import "Photo.h"
#import "Movie.h"
#import "NSManagedObject+na.h"

@implementation TCDataContainer

@synthesize managedObjectContext = _managedObjectContext;
@synthesize movie = _movie;

static TCDataContainer *instance = nil;

+ (TCDataContainer*)instance {
    @synchronized(self) {
        if (instance == nil) {
            [[self alloc] init];
            [instance resetData];
        }
    }
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)resetData {
    _movie = [[TCMovie alloc] init];
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    _managedObjectContext = managedObjectContext;
    [Photo setMainContext:managedObjectContext];
    [Movie setMainContext:managedObjectContext];
}

@end
