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
    NSArray *newImageArray;
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
    
    [self setImages];
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
    
    return [newImageArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *imageLink = [[[newImageArray objectAtIndex:indexPath.item] objectForKey:@"media"]objectForKey:@"m"];
    
    [[cell myButton]setImage:[self urlToImage:imageLink] forState:UIControlStateNormal];
    
    return cell;
    
}
- (IBAction)tapCell:(UIButton *)sender {
    

}

-(void)setImages{
    
    NSDictionary *jsonDictionary = [self urlToJson:self.detailItem];
    newImageArray = [self imagesIntoArray:jsonDictionary];
    

    
    if ([self.detailItem isEqualToString:@"Peru"])
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg",@"peru1.jpg", nil];
    }
    else if ([self.detailItem isEqualToString:@"Hawaii"])
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg",@"Hawaii1.jpg", nil];
        
    }
    else
    {
        arrayOfImages = [[NSArray alloc] initWithObjects:@"duck.jpeg",@"duck.jpeg",@"duck.jpeg",@"duck.jpeg", nil];

 
    }
}

- (NSDictionary *)urlToJson:(NSString *)category {
    NSString *baseUrl = @"http://api.flickr.com/services/feeds/photos_public.gne?id=38381313@N06&format=json&nojsoncallback=1&tags=";
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@", baseUrl, self.detailItem];
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:fullUrl]];
    
    NSDictionary *jsonImages = nil;
    if (jsonData) {
        jsonImages = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    }
    
    return jsonImages;
}

-(NSArray *)imagesIntoArray:(NSDictionary *)jsonDictionary {
    NSArray *imageArray = [[NSArray alloc] initWithArray:[jsonDictionary objectForKey:@"items"]];
    
    return imageArray;
    
}

-(UIImage *)urlToImage:(NSString *)imageURL {
    UIImage *pImage=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    
  //  [[cell myButton]setImage:[UIImage imageNamed:pImage forState:UIControlStateNormal];
   // [imageView setImage:pImage];
     
     return pImage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if ([[segue identifier] isEqualToString:@"ToLargeImage"]) {
//        NSLog(@"%@", sender.imageView.image);


//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:sender.imageView.image];
    }
}
@end
