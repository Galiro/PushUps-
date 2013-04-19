//
//  SecondViewController.m
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KissViewController.h"

@interface KissViewController ()

@end

@implementation KissViewController
@synthesize pushUpButton;
@synthesize pushUpOutput;

- (void)viewDidLoad
{
    pushUps = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setPushUpButton:nil];
    [self setPushUpOutput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(IBAction)justKissed:(id)sender{
    pushUps++;
    pushUpOutput.text = [NSString stringWithFormat:@"%i",pushUps];
}

-(IBAction)saveButton:(id)sender{
    [self savePushUps:pushUps];
}
-(void)savePushUps: (int)amount{
    
     NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:amount forKey:@"score"];
    [prefs synchronize];
}

- (void)dealloc {
    [pushUpButton release];
    [pushUpOutput release];
    [super dealloc];
}
@end
