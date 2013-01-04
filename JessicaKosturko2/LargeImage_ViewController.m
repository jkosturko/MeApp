//
//  LargeImage_ViewController.m
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 1/3/13.
//  Copyright (c) 2013 Kosturko, Jessica. All rights reserved.
//

#import "LargeImage_ViewController.h"

@interface LargeImage_ViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;

@end

@implementation LargeImage_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        _largeImageView.image = _detailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
