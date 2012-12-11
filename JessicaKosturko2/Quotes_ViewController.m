//
//  Quotes_ViewController.m
//  JessicaKosturko2
//
//  Created by Kosturko, Jessica on 12/11/12.
//  Copyright (c) 2012 Kosturko, Jessica. All rights reserved.
//

#import "Quotes_ViewController.h"

@interface Quotes_ViewController ()

@end

@implementation Quotes_ViewController


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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSDictionary *quotesJson = [self getQuotesfromTublr];
    
    NSArray *quoteTextArray = [[[quotesJson valueForKey:@"response"] valueForKey:@"posts"] valueForKey:@"text"];
    
    int randNumb =  (arc4random() % ([quoteTextArray count]-0+1)) + 0 ;

    _quoteLabel.text =  [quoteTextArray objectAtIndex:randNumb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)getQuotesfromTublr {
    NSData *tumblrQuotes = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.tumblr.com/v2/blog/jessicakosturko.tumblr.com/posts/quote?api_key=sJ9SZ1WpUGIN3cvfUNeg4SzjPpktwGeJxzTXE6c4gBuzOyTC8u"]];
    
    NSDictionary *quotesJson = nil;
    if (tumblrQuotes) {
        quotesJson = [NSJSONSerialization JSONObjectWithData:tumblrQuotes options:kNilOptions error:nil];
    }
    

    
    return quotesJson;
}

- (void)removeEntitiesFromHTML {

    
}

@end
