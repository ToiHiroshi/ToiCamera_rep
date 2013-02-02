//
//  TCRootController.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 21/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCRootController.h"

#import "TCHomeViewController.h"
#import "TCEditViewController.h"
#import "TCLibraryViewController.h"

#import "TCDataContainer.h"

@implementation TCRootController

@synthesize navigationController = _navigationController;
@synthesize homeViewController = _homeViewController;
@synthesize editViewController = _editViewController;
@synthesize libraryViewController = _libraryViewController;

#pragma ---
#pragma singleton

static TCRootController *instance = nil;

+ (TCRootController*)instance {
    @synchronized(self) {
        if (instance == nil) {
            [[self alloc] init];
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

#pragma ---
#pragma initialization

- (void)initialize {
    
    // create view controllers
    _homeViewController = [[TCHomeViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    _editViewController = [[TCEditViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    _libraryViewController = [[TCLibraryViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
    [_navigationController setNavigationBarHidden:YES];
    
}


#pragma ---
#pragma controll view controllers

- (void)moveToEditView {
    [[TCDataContainer instance] resetData];
    [_navigationController pushViewController:_editViewController animated:YES];
}
- (void)moveToLibraryView {
    [_libraryViewController setMovies:[TCMovie getMovies]];
    [_navigationController pushViewController:_libraryViewController animated:YES];
}
- (void)backToHomeView {
    [_navigationController popToRootViewControllerAnimated:YES];
}

@end
