//
//  TCRootController.h
//  ToiCamera
//
//  Created by 柴山 裕樹 on 21/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TCHomeViewController;
@class TCEditViewController;
@class TCLibraryViewController;

@interface TCRootController : NSObject

+ (TCRootController*)instance;
- (void)initialize;
- (void)moveToEditView;
- (void)moveToLibraryView;
- (void)backToHomeView;

@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) TCHomeViewController* homeViewController;
@property (strong, nonatomic) TCEditViewController* editViewController;
@property (strong, nonatomic) TCLibraryViewController* libraryViewController;

@end
