//
//  LargeImage_ViewController.h
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 1/3/13.
//  Copyright (c) 2013 Kosturko, Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LargeImage_ViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;

@end
