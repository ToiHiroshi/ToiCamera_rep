//
//  TCBaseViewController.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 23/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCBaseViewController.h"
#import "TCRootController.h"

@interface TCBaseViewController ()

@end

@implementation TCBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage* backgroundImage = [UIImage imageNamed:@"kurozara.bmp"];
        UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
        [backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:backgroundImageView];
        
        NSMutableArray* crs_back = [NSMutableArray array];
        [crs_back addObject:[NSLayoutConstraint constraintWithItem:backgroundImageView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0f]];
        [crs_back addObject:[NSLayoutConstraint constraintWithItem:backgroundImageView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0f]];
        [self.view addConstraints:crs_back];
        
        UIImage* homeImg = [UIImage imageNamed:@"home.png"];
        UIButton* homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [homeButton setBackgroundImage:homeImg forState:UIControlStateNormal];
        [self.view addSubview:homeButton];
        [homeButton addTarget:self action:@selector(homeButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [homeButton setFrame:CGRectMake(10, 10, homeImg.size.width*0.2, homeImg.size.height*0.2)];
        
        UIImage* playImg = [UIImage imageNamed:@"play.png"];
        UIButton* playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [playButton setBackgroundImage:playImg forState:UIControlStateNormal];
        [self.view addSubview:playButton];
        [playButton addTarget:self action:@selector(homeButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [playButton setFrame:CGRectMake(10+40, 10, playImg.size.width*0.2, playImg.size.height*0.2)];
    }
    return self;
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

- (void)homeButtonTouched:(id)sender {
    [[TCRootController instance] backToHomeView];
}

@end
