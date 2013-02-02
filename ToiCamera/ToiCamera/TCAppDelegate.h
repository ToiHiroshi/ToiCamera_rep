//
//  TCAppDelegate.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 21/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
