//
//  TCEditViewController.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 21/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCEditViewController.h"
#import "TCDataContainer.h"
#import "TCRootController.h"
#import "CameraUtil.h"

#define TC_WIDTH1 20.0f
#define TC_WIDTH2 44.0f
#define TC_WIDTH3 15.0f
#define TC_HEIGHT1 44.0f
#define TC_HEIGHT2 44.0f

#define TC_KEY_SUBVIEW1 @"tcevc_subview1"
#define TC_KEY_SUBVIEW2 @"tcevc_subview2"
#define TC_KEY_SUBVIEW3 @"tcevc_subview3"
#define TC_KEY_SUBVIEW4 @"tcevc_subview4"
#define TC_KEY_SUBVIEW5 @"tcevc_subview5"

#define TC_KEY_WIDTH1 @"tcevc_width1"
#define TC_KEY_WIDTH2 @"tcevc_width2"
#define TC_KEY_WIDTH3 @"tcevc_width3"
#define TC_KEY_HEIGHT1 @"tcevc_height1"
#define TC_KEY_HEIGHT2 @"tcevc_height2"

#define TC_VISUALFORMAT_H @"H:|-(tcevc_width1)-[tcevc_subview1(tcevc_width2)]-(tcevc_width3)-[tcevc_subview2(tcevc_width2)]-(tcevc_width3)-[tcevc_subview3(tcevc_width2)]-(tcevc_width3)-[tcevc_subview4(tcevc_width2)]-(tcevc_width3)-[tcevc_subview5(tcevc_width2)]"
#define TC_VISUALFORMAT_V1 @"V:|-(tcevc_height1)-[tcevc_subview1(tcevc_height2)]"
#define TC_VISUALFORMAT_V2 @"V:|-(tcevc_height1)-[tcevc_subview2(tcevc_height2)]"
#define TC_VISUALFORMAT_V3 @"V:|-(tcevc_height1)-[tcevc_subview3(tcevc_height2)]"
#define TC_VISUALFORMAT_V4 @"V:|-(tcevc_height1)-[tcevc_subview4(tcevc_height2)]"
#define TC_VISUALFORMAT_V5 @"V:|-(tcevc_height1)-[tcevc_subview5(tcevc_height2)]"

@interface TCEditViewController ()

@property (strong, nonatomic) UICollectionViewController* collectionViewController;
@property (strong, nonatomic) NSArray* addButtons;
@property (strong, nonatomic) NSArray* changeButtons;
@property (strong, nonatomic) NSArray* imageViews;
@property (strong, nonatomic) CameraUtil* camerautil;

@end

@implementation TCEditViewController

@synthesize collectionViewController = _collectionViewController;
@synthesize addButtons = _addButtons;
@synthesize imageViews = _imageViews;
@synthesize camerautil = _camerautil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _camerautil = [CameraUtil createInstance];
        
        UIButton* saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveButton setBackgroundColor:[UIColor clearColor]];
        [saveButton setTitle:@"save" forState:UIControlStateNormal];
        [saveButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.view addSubview:saveButton];
        [saveButton addTarget:self action:@selector(saveButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [saveButton setFrame:CGRectMake(10+2*40, 10, 40, 40)];
        
        UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
        UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
        UIButton* btn3 = [UIButton buttonWithType:UIButtonTypeContactAdd];
        UIButton* btn4 = [UIButton buttonWithType:UIButtonTypeContactAdd];
        UIButton* btn5 = [UIButton buttonWithType:UIButtonTypeContactAdd];
        
        UIButton* cbtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* cbtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* cbtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* cbtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton* cbtn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn1 setTag:1];
        [btn2 setTag:2];
        [btn3 setTag:3];
        [btn4 setTag:4];
        [btn5 setTag:5];
        
        [cbtn1 setTag:11];
        [cbtn2 setTag:12];
        [cbtn3 setTag:13];
        [cbtn4 setTag:14];
        [cbtn5 setTag:15];
        
        UIImageView* imgview1 = [[UIImageView alloc] init];
        UIImageView* imgview2 = [[UIImageView alloc] init];
        UIImageView* imgview3 = [[UIImageView alloc] init];
        UIImageView* imgview4 = [[UIImageView alloc] init];
        UIImageView* imgview5 = [[UIImageView alloc] init];
        
        _addButtons = [NSArray arrayWithObjects:btn1,btn2,btn3,btn4,btn5,nil];
        _changeButtons = [NSArray arrayWithObjects:cbtn1,cbtn2,cbtn3,cbtn4,cbtn5,nil];
        _imageViews = [NSArray arrayWithObjects:imgview1,imgview2,imgview3,imgview4,imgview5,nil];
        
        for (UIImageView* imgview in _imageViews) {
            [imgview setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self.view addSubview:imgview];
            [imgview setHidden:YES];
        }
        for (UIButton* btn in _addButtons) {
            [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(addButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
            [btn setHidden:YES];
        }
        for (UIButton* btn in _changeButtons) {
            [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(changeButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
            [btn setHidden:YES];
        }
        [btn1 setHidden:NO];
        
        NSDictionary* btns = @{TC_KEY_SUBVIEW1:btn1,TC_KEY_SUBVIEW2:btn2,TC_KEY_SUBVIEW3:btn3,TC_KEY_SUBVIEW4:btn4,TC_KEY_SUBVIEW5:btn5};
        NSDictionary* cbtns = @{TC_KEY_SUBVIEW1:cbtn1,TC_KEY_SUBVIEW2:cbtn2,TC_KEY_SUBVIEW3:cbtn3,TC_KEY_SUBVIEW4:cbtn4,TC_KEY_SUBVIEW5:cbtn5};
        NSDictionary* imgviews = @{TC_KEY_SUBVIEW1:imgview1,TC_KEY_SUBVIEW2:imgview2,TC_KEY_SUBVIEW3:imgview3,TC_KEY_SUBVIEW4:imgview4,TC_KEY_SUBVIEW5:imgview5};
        
        
        NSMutableArray* crs = [NSMutableArray array];
        NSDictionary* sizemetrics = @{TC_KEY_WIDTH1:@(TC_WIDTH1),TC_KEY_WIDTH2:@(TC_WIDTH2),TC_KEY_WIDTH3:@(TC_WIDTH3),TC_KEY_HEIGHT1:@(TC_HEIGHT1),TC_KEY_HEIGHT2:@(TC_HEIGHT2)};
        
        NSMutableDictionary* metrics = [NSMutableDictionary dictionaryWithDictionary:sizemetrics];
        [metrics setValue:btn1 forKey:TC_KEY_SUBVIEW1];
        [metrics setValue:btn2 forKey:TC_KEY_SUBVIEW2];
        [metrics setValue:btn3 forKey:TC_KEY_SUBVIEW3];
        [metrics setValue:btn4 forKey:TC_KEY_SUBVIEW4];
        [metrics setValue:btn5 forKey:TC_KEY_SUBVIEW5];
        
        [crs addObjectsFromArray:[self createSubviewLayoutConstraint:metrics :btns]];
        
        metrics = [NSMutableDictionary dictionaryWithDictionary:sizemetrics];
        [metrics setValue:cbtn1 forKey:TC_KEY_SUBVIEW1];
        [metrics setValue:cbtn2 forKey:TC_KEY_SUBVIEW2];
        [metrics setValue:cbtn3 forKey:TC_KEY_SUBVIEW3];
        [metrics setValue:cbtn4 forKey:TC_KEY_SUBVIEW4];
        [metrics setValue:cbtn5 forKey:TC_KEY_SUBVIEW5];
        
        [crs addObjectsFromArray:[self createSubviewLayoutConstraint:metrics :cbtns]];
        
        metrics = [NSMutableDictionary dictionaryWithDictionary:sizemetrics];
        [metrics setValue:imgview1 forKey:TC_KEY_SUBVIEW1];
        [metrics setValue:imgview2 forKey:TC_KEY_SUBVIEW2];
        [metrics setValue:imgview3 forKey:TC_KEY_SUBVIEW3];
        [metrics setValue:imgview4 forKey:TC_KEY_SUBVIEW4];
        [metrics setValue:imgview5 forKey:TC_KEY_SUBVIEW5];
        
        [crs addObjectsFromArray:[self createSubviewLayoutConstraint:metrics :imgviews]];
        
        [self.view addConstraints:crs];
    }
    return self;
}

- (NSArray*)createSubviewLayoutConstraint:(NSDictionary*)metrics :(NSDictionary*)subviews {
    
    NSMutableArray* crs = [NSMutableArray array];
    
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_H
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_V1
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_V2
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_V3
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_V4
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:TC_VISUALFORMAT_V5
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:subviews]];
    
    return crs;
    
}

- (void)reload {
    NSArray* photos = [[[TCDataContainer instance] movie] photos];
    int count = [photos count];
    for (int i=0;i<5;i++) {
        if (i<count) {
            [[_imageViews objectAtIndex:i] setImage:[photos objectAtIndex:i]];
            [[_imageViews objectAtIndex:i] setHidden:NO];
            [[_addButtons objectAtIndex:i] setHidden:YES];
            [[_changeButtons objectAtIndex:i] setHidden:NO];
        }else if (i==count) {
            [[_imageViews objectAtIndex:i] setHidden:YES];
            [[_addButtons objectAtIndex:i] setHidden:NO];
            [[_changeButtons objectAtIndex:i] setHidden:YES];
        }else {
            [[_imageViews objectAtIndex:i] setHidden:YES];
            [[_addButtons objectAtIndex:i] setHidden:YES];
            [[_changeButtons objectAtIndex:i] setHidden:YES];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveButtonTouched:(id)sender {
    
    UIAlertView* alertView = [UIAlertView alertViewWithTitle:@"MOVIE TITLE" message:@"Please type your movie's title."];
    
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [alertView addButtonWithTitle:@"OK" handler:^{
        TCMovie* movie = [[TCDataContainer instance] movie];
        [movie setTitle:[[alertView textFieldAtIndex:0] text]];
        [movie save];
        [[TCRootController instance] backToHomeView];
    }];
    
    [alertView show];
}

- (void)addButtonTouched:(id)sender {
    
    UIButton* btn = (UIButton*)sender;
    int tagindex = [btn tag];
    
    [_camerautil showLibraryOnVC:self
     completion_didFinishPicking:^(UIImagePickerController *picker, NSDictionary *dic) {
         [picker dismissViewControllerAnimated:YES completion:^{
             
             UIImage* pickedImage = [dic objectForKey:UIImagePickerControllerOriginalImage];
             TCMovie* movie = [[TCDataContainer instance] movie];
             UIImageView* imgview;
             
             if (tagindex<10) {
                 imgview = [_imageViews objectAtIndex:tagindex-1];
                 [movie addPhotosObject:pickedImage];
             }else {
                 imgview = [_imageViews objectAtIndex:tagindex-11];
                 [movie replacePhoto:pickedImage atIndex:tagindex-11];
             }
             [imgview setImage:pickedImage];
             
             
             
             [self reload];
             
         }];
     } completion_didCancelPicking:^(UIImagePickerController *picker) {
         [picker dismissViewControllerAnimated:YES completion:^{
         }];
     }];
    
}

- (void)changeButtonTouched:(id)sender {
    
    [self addButtonTouched:sender];
    
}


@end
