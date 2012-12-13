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
    
    //take quotes from Tumblr feed
    quotesJson = [self getQuotesfromTublr];
    
    [self getNextQuote];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getNextQuote {
    
    //Set Quote Text
    _quoteLabel.text = [self extractRandomQuoteFromJSON:quotesJson];
}

- (NSDictionary *)getQuotesfromTublr {
    NSData *tumblrQuotes = [NSData dataWithContentsOfURL:[NSURL URLWithString:[@"http://api.tumblr.com/v2/blog/jessicakosturko.tumblr.com/posts/quote?api_key=sJ9SZ1WpUGIN3cvfUNeg4SzjPpktwGeJxzTXE6c4gBuzOyTC8u" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    if (tumblrQuotes) {
        quotesJson = [NSJSONSerialization JSONObjectWithData:tumblrQuotes options:kNilOptions error:nil];
    }
    
    return quotesJson;
}

- (NSString *)extractRandomQuoteFromJSON:(NSDictionary *)tumblrDictionary {
   
    //extract quote from text field in Dictionary
    NSArray *quoteTextArray = [[[tumblrDictionary valueForKey:@"response"] valueForKey:@"posts"] valueForKey:@"text"];
    
    //Randomize quote
    int randNumb =  (arc4random() % ([quoteTextArray count]-0+1)) + 0 ;
    NSString *nextquote = [quoteTextArray objectAtIndex:randNumb];
    
    return [self stringByStrippingHTML:nextquote];
    
}

- (NSString *)stringByStrippingHTML:(NSString *)inputString
{
    NSMutableString *outString;
    
    if (inputString)
    {
        outString = [[NSMutableString alloc] initWithString:inputString];
        
        if ([inputString length] > 0)
        {
            NSRange r;
            
            while ((r = [outString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
            {
                [outString deleteCharactersInRange:r];
            }      
        }
    }
    
    return outString; 
}

- (IBAction)swipeQuoteGesture:(UISwipeGestureRecognizer *)sender {

    [self getNextQuote];
}

@end
