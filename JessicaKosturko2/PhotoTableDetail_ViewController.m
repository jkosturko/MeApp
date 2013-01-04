//
//  PhotoTableDetail_ViewController.m
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 1/3/13.
//  Copyright (c) 2013 Kosturko, Jessica. All rights reserved.
//

#import "PhotoTableDetail_ViewController.h"
#import "CollectionViewCell.h"

@interface PhotoTableDetail_ViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
-(void)configureView;
@end

@implementation PhotoTableDetail_ViewController{
    NSArray *arrayOfImages;
    NSArray *arrayOfDescription;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    _detailDescriptionLabel.textColor = [UIColor redColor];
    
    
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.title = self.detailItem;
        self.navigationItem.title = self.detailItem;
    }
    
//    if (self.detailItem isEqualToString:@"Hawaii") {
//        _myGridImage
//    }
    
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
    
    
    [self setImages];
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//datasoucre and delegate method
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"%u", [arrayOfImages count]);
    return [arrayOfImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [[cell myButton]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]] forState:UIControlStateNormal];
    
    NSLog(@"%@", [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]);
    
    return cell;
    
}
- (IBAction)tapCell:(UIButton *)sender {
    
    NSLog(@"%@", [sender imageForState:UIControlStateNormal]);
    
    //    _largeImage.image = [sender imageForState:UIControlStateNormal];
    //    _largeImage.hidden = NO;
    //

}

-(void)setImages{
    
    if ([self.detailItem isEqualToString:@"Peru"])
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg", nil];
    }
    else if ([self.detailItem isEqualToString:@"Hawaii"])
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg", nil];
        
        NSLog(@"%@", arrayOfImages);
        
    }
    else
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"duck.jpeg",@"duck.jpeg",@"duck.jpeg",@"duck.jpeg", nil];

    }
}
@end
