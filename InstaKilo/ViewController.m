//
//  ViewController.m
//  InstaKilo
//
//  Created by Chelsea Liu on 6/25/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //initialize UICollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.collectionView];
    
    NSArray *tempArray = @[@"toronto.png",@"vancouver.png",@"newyork.png",@"shanghai.png",@"tokyo.png",@"alaska.jpg", @"venice.jpg",@"london.jpg",@"paris.jpg",@"rio.jpg"];
    self.imagesArray = [[NSMutableArray alloc] initWithArray:tempArray];
    

//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
    
}


- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imagesArray count];
}



- (UICollectionViewCell *) collectionView: (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //this is where you set what is inside each cell
    
    self.myCell = [[CollectionViewCell alloc] init];
    self.myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    UIImageView* tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.myCell.frame.size.width, self.myCell.frame.size.height)];
    tempImageView.image = [UIImage imageNamed:self.imagesArray[indexPath.row]];

    [self.myCell.contentView addSubview: tempImageView];
    return self.myCell;
 
}


- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(185, 130);
    //size of each cell in collection
    //header and footer use similar method

}


- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}












@end
