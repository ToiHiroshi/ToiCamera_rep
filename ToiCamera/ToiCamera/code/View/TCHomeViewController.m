//
//  TCHomeViewController.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 21/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCHomeViewController.h"

#import "TCRootController.h"

@interface TCHomeViewController ()

@end

@implementation TCHomeViewController

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
        
        UIButton* editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [editButton setBackgroundImage:[UIImage imageNamed:@"selectbox.bmp"] forState:UIControlStateNormal];
        UIButton* libraryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [libraryButton setBackgroundImage:[UIImage imageNamed:@"selectbox.bmp"] forState:UIControlStateNormal];
        
        UILabel* editLabel = [[UILabel alloc] init];
        UILabel* libraryLabel = [[UILabel alloc] init];
        
        [editLabel setText:@"NEW MOVIE"];
        [libraryLabel setText:@"YOUR LIBRARY"];
        
        [editLabel setBackgroundColor:[UIColor clearColor]];
        [libraryLabel setBackgroundColor:[UIColor clearColor]];
        [editLabel setTextAlignment:NSTextAlignmentCenter];
        [libraryLabel setTextAlignment:NSTextAlignmentCenter];
        [editLabel setFont:[UIFont fontWithName:@"Arial-Bold" size:14]];
        [libraryLabel setFont:[UIFont fontWithName:@"Arial-Bold" size:14]];
        [editLabel setTextColor:[UIColor darkGrayColor]];
        [libraryLabel setTextColor:[UIColor darkGrayColor]];
        
        [editButton addTarget:self action:@selector(editButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [libraryButton addTarget:self action:@selector(libraryButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:editButton];
        [self.view addSubview:editLabel];
        [self.view addSubview:libraryButton];
        [self.view addSubview:libraryLabel];
        
        [editButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [editLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [libraryButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [libraryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSDictionary* subviews = NSDictionaryOfVariableBindings(editButton,editLabel,libraryButton,libraryLabel);
        NSMutableArray* crs = [NSMutableArray array];
        
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[editButton(280)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[editLabel(280)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[libraryButton(280)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[libraryLabel(280)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[editButton(44)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[editLabel(44)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[libraryButton(44)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        [crs addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[libraryLabel(44)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:subviews]];
        
        
        [crs addObject:[NSLayoutConstraint constraintWithItem:editButton
                                                    attribute:NSLayoutAttributeBottom
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.view
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0
                                                     constant:-22.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:libraryButton
                                                    attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.view
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0
                                                     constant:22.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:editButton
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.view
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.0
                                                     constant:0.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:libraryButton
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.view
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.0
                                                     constant:0.0f]];
        
        [crs addObject:[NSLayoutConstraint constraintWithItem:editButton
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:editLabel
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.0
                                                     constant:0.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:editButton
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:editLabel
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0
                                                     constant:0.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:libraryButton
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:libraryLabel
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.0
                                                     constant:0.0f]];
        [crs addObject:[NSLayoutConstraint constraintWithItem:libraryButton
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:libraryLabel
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0
                                                     constant:0.0f]];
        
        [self.view addConstraints:crs];
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

- (void)editButtonTouched:(id)sender {
    [[TCRootController instance] moveToEditView];
}
- (void)libraryButtonTouched:(id)sender {
    [[TCRootController instance] moveToLibraryView];
}

@end
