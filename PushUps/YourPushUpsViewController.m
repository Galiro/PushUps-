//
//  YourPushUpsViewController.m
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YourPushUpsViewController.h"

@interface YourPushUpsViewController ()

@end

@implementation YourPushUpsViewController

@synthesize lastTimeLabel;
@synthesize lowestLabel;
@synthesize highestLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadPushUps];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPushUps];
	// Do any additional setup after loading the view.
}

-(void)loadPushUps{
    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    loadedScore = [defualts integerForKey:@"score"];
    lowest = [defualts integerForKey:@"lowest"];
    highest = [defualts integerForKey:@"highest"];
    
    lastTimeLabel.text = [NSString stringWithFormat:@"%i",loadedScore];
    lowestLabel.text = [NSString stringWithFormat:@"%i",lowest];
    highestLabel.text = [NSString stringWithFormat:@"%i",highest];

}



- (IBAction)sendPushUpTweet:(id)sender {
    // Set up the built-in twitter composition view controller.
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    
    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    loadedScore = [defualts integerForKey:@"score"];
    
    
    // Set the initial tweet text. See the framework for additional properties that can be set.
    [tweetViewController setInitialText:[NSString stringWithFormat:@"I just did %i pushups with the Push Ups+ App :)  You can get it here: http://goo.gl/I9sfA  #GaliroROCKS", loadedScore]];
    
    
    // Create the completion handler block.
    [tweetViewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
        NSString *output;
        
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                // The cancel button was tapped.
                output = @"Tweet cancelled.";
                break;
            case TWTweetComposeViewControllerResultDone:
                // The tweet was sent.
                output = @"Tweet was sent!";
                break;
            default:
                break;
        }
        
        //   [self performSelectorOnMainThread:@selector(displayText:) withObject:output waitUntilDone:NO];
        
        // Dismiss the tweet composition view controller.
        [self dismissModalViewControllerAnimated:YES];
    }];
    
    // Present the tweet composition view controller modally.
    [self presentModalViewController:tweetViewController animated:YES];
}


- (void)viewDidUnload
{
    [self setLastTimeLabel:nil];
    //[self setlowestLabel:nil];
    [self setLowestLabel:nil];
    [self setHighestLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [lastTimeLabel release];
    [lowestLabel release];
    [highestLabel release];
    [super dealloc];
}
@end
