//
//  CameraUtil.h
//  ToiCameraMockUp
//
//  Created by 柴山 裕樹 on 29/12/2012.
//  Copyright (c) 2012 柴山 裕樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CameraUtil : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

+ (CameraUtil*)createInstance;

- (void)showCameraOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking;

- (void)showLibraryOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking;


- (void)showCameraOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
   completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
    completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow;

- (void)showLibraryOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
    completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
     completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow;
@end
