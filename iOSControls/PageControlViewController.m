//
//  PageControlViewController.m
//  iOSAutomationTestApp
//
//  Created by Chanikya on 11/2/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import "PageControlViewController.h"
#import "ImageCollectionViewCell.h"

@interface PageControlViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@end

@implementation PageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Page Controller";
    
    [self.pageController addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
    self.pageController.numberOfPages = 3;
    self.pageController.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)pageControlChanged:(id)sender {
    UIPageControl *pageControl = sender;
    CGFloat pageWidth = self.collectionView.frame.size.width;
    CGPoint scrollTo = CGPointMake(pageWidth * pageControl.currentPage, 0);
    self.collectionView.contentOffset = scrollTo;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"bed"];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"comfortSofa"];
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"ChestDrawer"];
            break;
        default:
            cell.imageView.image = [UIImage imageNamed:@"bed"];
            break;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemsPerRow = 1;
    CGFloat hardCodedPadding = 0;
    double itemWidth = (collectionView.bounds.size.width/itemsPerRow) - hardCodedPadding;
    double itemHeight = collectionView.bounds.size.height - (2*hardCodedPadding);
    return CGSizeMake(itemWidth, itemHeight);
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageController.currentPage = self.collectionView.contentOffset.x/pageWidth;
}



@end
