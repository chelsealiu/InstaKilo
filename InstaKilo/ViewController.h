//
//  ViewController.h
//  InstaKilo
//
//  Created by Chelsea Liu on 6/25/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "Photo.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *imagesArray;

@property (nonatomic, strong) NSArray *tempArray1;
@property (nonatomic, strong) NSArray *tempArray2;

@property (strong, nonatomic) Photo *photo1;
@property (strong, nonatomic) Photo *photo2;
@property (strong, nonatomic) Photo *photo3;
@property (strong, nonatomic) Photo *photo4;
@property (strong, nonatomic) Photo *photo5;
@property (strong, nonatomic) Photo *photo6;
@property (strong, nonatomic) Photo *photo7;
@property (strong, nonatomic) Photo *photo8;
@property (strong, nonatomic) Photo *photo9;
@property (strong, nonatomic) Photo *photo10;


@property (strong, nonatomic) NSString* sortKey; 

@end

