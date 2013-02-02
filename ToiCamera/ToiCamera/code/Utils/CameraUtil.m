//
//  CameraUtil.m
//  ToiCameraMockUp
//
//  Created by 柴山 裕樹 on 29/12/2012.
//  Copyright (c) 2012 柴山 裕樹. All rights reserved.
//

#import "CameraUtil.h"

@interface CameraUtil ()

//UIImagePickerControllerDelegate
@property(readwrite,copy) void (^didFinishPickingMediaWithInfo)(UIImagePickerController *,NSDictionary *);
@property(readwrite,copy) void (^imagePickerControllerDidCancel)(UIImagePickerController *);

//UINavigationControllerDelegate
@property(readwrite,copy) void (^willShowViewController)(UINavigationController *, UIViewController *,BOOL);
@property(readwrite,copy) void (^didShowViewController)(UINavigationController *, UIViewController *,BOOL) ;


- (void)_show:(UIImagePickerControllerSourceType)stype
         OnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow;

@end

@implementation CameraUtil

#pragma --
#pragma UIImagePickerControllerDelegate

@synthesize didFinishPickingMediaWithInfo=_didFinishPickingMediaWithInfo;
@synthesize imagePickerControllerDidCancel=_imagePickerControllerDidCancel;

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSLog(@"respondsToSelector");
    
    if(aSelector == @selector(imagePickerController:didFinishPickingMediaWithInfo:)){
        NSLog(@"(imagePickerController:didFinishPickingMediaWithInfo:)");
        return self.didFinishPickingMediaWithInfo!=nil;
    }
    if(aSelector == @selector(imagePickerControllerDidCancel:)){
        NSLog(@"(imagePickerControllerDidCancel:)");
        return self.imagePickerControllerDidCancel!=nil;
    }
    if(aSelector == @selector(navigationController:willShowViewController:animated:)){
        NSLog(@"(navigationController:willShowViewController:animated:)");
        return self.willShowViewController!=nil;
    }
    if(aSelector == @selector(navigationController:didShowViewController:animated:)){
        NSLog(@"(navigationController:didShowViewController:animated:)");
        return self.didShowViewController!=nil;
    }
    return [super respondsToSelector:aSelector];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.didFinishPickingMediaWithInfo(picker,info);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    self.imagePickerControllerDidCancel(picker);
}

#pragma --
#pragma UINavigationControllerDelegate

@synthesize willShowViewController=_willShowViewController;
@synthesize didShowViewController=_didShowViewController;

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    self.willShowViewController(navigationController,viewController,animated);
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    self.didShowViewController(navigationController,viewController,animated);
}


#pragma --
#pragma CameraUtil Method

+ (CameraUtil*)createInstance {
    return [[CameraUtil alloc] init];
}

- (void)_show:(UIImagePickerControllerSourceType)stype
                           OnVC:(UIViewController*)vc
    completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
    completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
            completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
             completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow {
    
    if ([UIImagePickerController isSourceTypeAvailable:stype]) {
        self.didFinishPickingMediaWithInfo = completion_didFinishPicking;
        self.imagePickerControllerDidCancel = completion_didCancelPicking;
        self.willShowViewController = completion_willShow;
        self.didShowViewController = completion_didShow;
        
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.sourceType = stype;
        picker.delegate = self;
        [vc presentViewController:picker animated:YES completion:^{NSLog(@"completion");}];
    }else {
        
        NSString* sname = nil;
        
        if (stype==UIImagePickerControllerSourceTypeCamera)
            sname = @"UIImagePickerControllerSourceTypeCamera";
        else if (stype==UIImagePickerControllerSourceTypePhotoLibrary)
            sname = @"UIImagePickerControllerSourceTypePhotoLibrary";
        else if (stype==UIImagePickerControllerSourceTypeSavedPhotosAlbum)
            sname = @"UIImagePickerControllerSourceTypeSavedPhotosAlbum";
        
        NSLog(@"source type(%@) is available.",sname);
    }
    
}

- (void)showCameraOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking {
    [self _show:UIImagePickerControllerSourceTypeCamera
                 OnVC:vc completion_didFinishPicking:completion_didFinishPicking
completion_didCancelPicking:completion_didCancelPicking completion_willShow:^(UINavigationController* nc, UIViewController* vc, BOOL bl){}
   completion_didShow:^(UINavigationController* nc, UIViewController* vc, BOOL bl){}];
}

- (void)showLibraryOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking {
    [self _show:UIImagePickerControllerSourceTypePhotoLibrary OnVC:vc completion_didFinishPicking:completion_didFinishPicking completion_didCancelPicking:completion_didCancelPicking completion_willShow:^(UINavigationController* nc, UIViewController* vc, BOOL bl){NSLog(@"completion_willShow");} completion_didShow:^(UINavigationController* nc, UIViewController* vc, BOOL bl){NSLog(@"completion_didShow");}];
}

- (void)showCameraOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
   completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
    completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow {
    [self _show:UIImagePickerControllerSourceTypeCamera OnVC:vc completion_didFinishPicking:completion_didFinishPicking completion_didCancelPicking:completion_didCancelPicking completion_willShow:completion_willShow completion_didShow:completion_didShow];
}

- (void)showLibraryOnVC:(UIViewController*)vc
completion_didFinishPicking:(void (^)(UIImagePickerController*, NSDictionary*))completion_didFinishPicking
completion_didCancelPicking:(void (^)(UIImagePickerController*))completion_didCancelPicking
completion_willShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_willShow
    completion_didShow:(void (^)(UINavigationController*, UIViewController*, BOOL))completion_didShow {
    [self _show:UIImagePickerControllerSourceTypePhotoLibrary OnVC:vc completion_didFinishPicking:completion_didFinishPicking completion_didCancelPicking:completion_didCancelPicking completion_willShow:completion_willShow completion_didShow:completion_didShow];
}
@end
