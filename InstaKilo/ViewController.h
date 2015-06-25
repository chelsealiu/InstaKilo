//
//  ViewController.h
//  InstaKilo
//
//  Created by Chelsea Liu on 6/25/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) CollectionViewCell *myCell;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *imagesArray;

@property (retain, nonatomic) UICollectionReusableView *sectionHeader;

@property (retain, nonatomic) UILabel *headerLabel;

@end

