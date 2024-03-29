//
//  Quotes_ViewController.h
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 12/11/12.
//  Copyright (c) 2012 Kosturko, Jessica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quotes_ViewController : UIViewController {
    NSDictionary *quotesJson;
}

@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;

- (NSString *)stringByStrippingHTML:(NSString *)inputString;
- (IBAction)swipeQuoteGesture:(UISwipeGestureRecognizer *)sender;

@end
