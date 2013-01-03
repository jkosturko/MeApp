//
//  Pictures_ViewController.m
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 1/3/13.
//  Copyright (c) 2013 Kosturko, Jessica. All rights reserved.
//

#import "Pictures_ViewController.h"
#import "CollectionViewCell.h"

@interface Pictures_ViewController ()

@end

@implementation Pictures_ViewController{
    NSArray *arrayOfImages;
    NSArray *arrayOfDescription;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [[self myCollectionView]setDelegate:self];
    [[self myCollectionView]setDataSource:self];
    
    
    arrayOfImages = [[NSArray alloc] initWithObjects:@"duck.jpeg", @"duck1.jpeg", @"duck2.jpeg", @"duck3.jpeg",@"peru1.jpg", nil];
    arrayOfDescription = [[NSArray alloc]initWithObjects:@"Duck 0", @"duck 1", @"duck 2", @"duck 3", @"Peru", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//datasoucre and delegate method
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [arrayOfDescription count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [[cell myButton]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]] forState:UIControlStateNormal];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapCell:(UIButton *)sender {
    
    NSLog(@"%@", [sender imageForState:UIControlStateNormal]);
    
    _largeImage.image = [sender imageForState:UIControlStateNormal];
    _largeImage.hidden = NO;
    

    
    
}

@end
