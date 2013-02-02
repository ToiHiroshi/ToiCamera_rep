//
//  TCLibraryViewController.m
//  ToiCamera
//
//  Created by 柴山 裕樹 on 26/01/2013.
//  Copyright (c) 2013 柴山 裕樹. All rights reserved.
//

#import "TCLibraryViewController.h"
#import "TCDataContainer.h"
#import "Movie.h"
#import "TCLibraryViewCollectionCell.h"

#define PADDING 1.0f
#define CELL_ID @"cellID"

@interface TCLibraryViewController ()

@property (strong, nonatomic) NSArray* movies;

@end

@implementation TCLibraryViewController

@synthesize movies = _movies;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithCollectionViewLayout:[TCLibraryViewController layout]];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[TCLibraryViewCollectionCell class] forCellWithReuseIdentifier:CELL_ID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMovies:(NSArray *)movies {
    _movies = movies;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showLog];
}

- (void)showLog {
    
    NSManagedObjectContext *managedObjectContext = [[TCDataContainer instance] managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    NSError *error;
    
    NSArray* mos = [managedObjectContext executeFetchRequest:request error:&error];
    
}


+ (UICollectionViewLayout*)layout {
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(80, 80)];
    [layout setMinimumLineSpacing:10.0f];
    [layout setMinimumInteritemSpacing:10.0f];
    
    return layout;
}


#pragma mark - UICollectionViewDatasource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [_movies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    TCLibraryViewCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    
    Movie* movie = [_movies objectAtIndex:indexPath.row];
    
    cell.label.text = [movie title];
    cell.imageView.image = [movie thumbnail];
    
    return cell;
}



#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(80, 80);
    CGFloat padding = PADDING;
    return CGSizeMake(size.width + padding * 2, size.height + padding * 2);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
}




@end
