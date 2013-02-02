//
//  TCMovie.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 24/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCMovie.h"
#import "Movie.h"
#import "Photo.h"
#import "TCDataContainer.h"
#import "NSManagedObjectContext+na.h"
#import "NSManagedObject+na.h"

@implementation TCMovie

@synthesize photos = _photos;
@synthesize title = _title;

- (id)init
{
    self = [super init];
    if (self) {
        _photos = [NSMutableArray array];
        _title = @"SAMPLE";
    }
    return self;
}

- (void)addPhotosObject:(UIImage *)object {
    [_photos addObject:object];
}
- (void)replacePhoto:(UIImage *)img atIndex:(NSInteger)idx {
    [_photos replaceObjectAtIndex:idx withObject:img];
}

- (void)save {
    
    if ([_photos count]==0)
        return;
    
    NSManagedObjectContext* managedObjectContext = [[TCDataContainer instance] managedObjectContext];
    
	Movie *movie = (Movie *)[Movie create:@{} options:@{}];
    
    NSDate* date = [NSDate date];
    int count = 0;
    NSMutableSet* photoset = [NSMutableSet set];
    
    for (NSObject* obj in _photos) {
        Photo *photo = (Photo *)[Photo create:@{@"timestamp":date,@"image":obj,@"index":[NSNumber numberWithInt:count]} options:@{}];
        if (count==0)
            [movie setThumbnail:(UIImage*)obj];
        [photoset addObject:photo];
        count ++;
    }
    
	[movie setTimestamp:date];
    [movie setTitle:_title];
    [movie setPhotos:photoset];
    
	NSError *error = nil;
	if (![managedObjectContext save:&error]) {
		// Handle the error.
        NSLog(@"coredata save error-------------------------------------");
	}
    
    NSLog(@"%@",movie);
}

+ (NSArray*)getMovies {
    return [Movie filter:@{} options:@{}];
}


@end
