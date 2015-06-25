//
//  ViewController.m
//  InstaKilo
//
//  Created by Chelsea Liu on 6/25/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "Photo.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //initialize UICollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.collectionView];
    
    
    self.photo1 = [[Photo alloc] init];
    self.photo1.imageName = @"toronto.png";
    self.photo1.imageLocation = @"Canada";
    self.photo1.imageSubject = @"City";
    
    self.photo2 = [[Photo alloc] init];
    self.photo2.imageName = @"vancouver.png";
    self.photo2.imageLocation = @"Canada";
    self.photo2.imageSubject = @"City";
    
    self.photo3 = [[Photo alloc] init];
    self.photo3.imageName = @"newyork.png";
    self.photo3.imageLocation = @"Foreign";
    self.photo3.imageSubject = @"City";
    
    self.photo4 = [[Photo alloc] init];
    self.photo4.imageName = @"shanghai.png";
    self.photo4.imageLocation = @"Foreign";
    self.photo4.imageSubject = @"City";
    
    self.photo5 = [[Photo alloc] init];
    self.photo5.imageName = @"tokyo.png";
    self.photo5.imageLocation = @"Foreign";
    self.photo5.imageSubject = @"City";
    
    self.photo6 = [[Photo alloc] init];
    self.photo6.imageName = @"alaska.jpg";
    self.photo6.imageLocation = @"Foreign";
    self.photo6.imageSubject = @"Other";
    
    self.photo7 = [[Photo alloc] init];
    self.photo7.imageName = @"venice.jpg";
    self.photo7.imageLocation = @"Foreign";
    self.photo7.imageSubject = @"Other";
    
    self.photo8 = [[Photo alloc] init];
    self.photo8.imageName = @"london.jpg";
    self.photo8.imageLocation = @"Foreign";
    self.photo8.imageSubject = @"City";
    
    self.photo9 = [[Photo alloc] init];
    self.photo9.imageName = @"paris.jpg";
    self.photo9.imageLocation = @"Foreign";
    self.photo9.imageSubject = @"City";
    
    self.photo10 = [[Photo alloc] init];
    self.photo10.imageName = @"rio.jpg";
    self.photo10.imageLocation = @"Foreign";
    self.photo10.imageSubject = @"City";
    
    self.imagesArray = @[self.photo1,self.photo2,self.photo3,self.photo4,self.photo5,self.photo6,self.photo7,self.photo8,self.photo9,self.photo10];
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    self.tempArray1 = [[NSArray alloc] init];
    self.tempArray2 = [[NSArray alloc] init];
    
    if ([self.sortTypeControl isEnabledForSegmentAtIndex: 0]) {
        self.sortKey = @"Subject";
    } else if ([self.sortTypeControl isEnabledForSegmentAtIndex: 1]) {
        self.sortKey = @"Location";
    } else {
        self.sortKey = @"Subject";
    }
    
    [self setTempArrays];

}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {

        return [self.tempArray1 count];
    }
    else if (section == 1) {

        return [self.tempArray2 count];
    }
    return 0;
}


-(void) setTempArrays {
    
    NSMutableArray* tempArray_1 = [[NSMutableArray alloc] init];
    NSMutableArray* tempArray_2 = [[NSMutableArray alloc] init];
    
    if ([self.sortKey isEqualToString:@"Location"]) {
        for (Photo *photo in self.imagesArray) {
            if ([photo.imageLocation isEqualToString:@"Canada"]) {
                [tempArray_1 addObject: photo];
            } else if ([photo.imageLocation isEqualToString:@"Foreign"]) {
                [tempArray_2 addObject: photo];
            }
        }
    }
    else if ([self.sortKey isEqualToString:@"Subject"]) {
        for (Photo *photo in self.imagesArray) {
            if ([photo.imageSubject isEqualToString:@"City"]) {

                [tempArray_1 addObject:photo];
            } else if ([photo.imageSubject isEqualToString:@"Other"]) {

                
                [tempArray_2 addObject:photo];
            }
        }
    }
    
    self.tempArray1 = tempArray_1;
    self.tempArray2 = tempArray_2;
    
 
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    UICollectionReusableView *sectionHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    UILabel *headerLabel1 = [[UILabel alloc] init];
    UILabel *headerLabel2 = [[UILabel alloc] init];
    
    headerLabel1=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 45)];
    headerLabel1.textColor = [UIColor whiteColor];
    headerLabel1.backgroundColor = [UIColor darkGrayColor];
    
    headerLabel2=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 45)];
    headerLabel2.textColor = [UIColor whiteColor];
    headerLabel2.backgroundColor = [UIColor darkGrayColor];

    if ([self.sortKey isEqualToString: @"Location"]) {
        
        if (indexPath.section == 0) {
            NSString *title1 = @"Canada";
            headerLabel1.text=title1;
            [sectionHeader addSubview:headerLabel1];
            
        } else if (indexPath.section == 1) {
            NSString *title2 = @"Foreign";
            headerLabel2.text=title2;
            [sectionHeader addSubview:headerLabel2];
        }
        
    } else if ([self.sortKey isEqualToString:@"Subject"]) {

        if (indexPath.section == 0) {
            NSString *title1 = @"City";
            headerLabel1.text=title1;
            [sectionHeader addSubview:headerLabel1];
            
        } else if (indexPath.section == 1) {
            NSString *title2 = @"Other";
            headerLabel2.text=title2;
            [sectionHeader addSubview:headerLabel2];
            
        }
}

    return sectionHeader;
}

//this is where you set what is inside each cell
- (UICollectionViewCell *) collectionView: (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    UICollectionViewCell *myCell = [[UICollectionViewCell alloc] init];
    myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView* tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, myCell.frame.size.width, myCell.frame.size.height)];
    
    Photo *tempPhoto = [[Photo alloc] init];

    if (indexPath.section == 0) {
        tempPhoto = self.tempArray1[indexPath.row];
        tempImageView.image = [UIImage imageNamed:tempPhoto.imageName];
//        NSLog(@"%@", self.tempArray1);
        [myCell.contentView addSubview: tempImageView];

        return myCell;

    } else if (indexPath.section == 1) {

        tempPhoto = self.tempArray2[indexPath.row];
        tempImageView.image = [UIImage imageNamed:tempPhoto.imageName];
        [myCell.contentView addSubview: tempImageView];
        return myCell;

    }
    return nil;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(self.view.frame.size.width, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(185, 130);
    //size of each cell in collection
    //header and footer use similar method
    
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section

{
    return 1;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section

{
    return 4;
}

- (IBAction)sortType:(UISegmentedControl*)sender {
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.sortKey = @"Subject";
    } else if (selectedSegment == 1) {
        self.sortKey = @"Location";
    }
    [self setTempArrays];

    [self.collectionView reloadData];

}




@end
