//
//  Pictures_ViewController.h
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 1/3/13.
//  Copyright (c) 2013 Kosturko, Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pictures_ViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;

- (IBAction)tapCell:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@end
