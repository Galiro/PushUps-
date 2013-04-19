//
//  PushUpsViewControllerViewController.m
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PushUpsViewControllerViewController.h"

@interface PushUpsViewControllerViewController ()

@end

@implementation PushUpsViewControllerViewController
@synthesize pushUpOutput;
@synthesize startButton;
@synthesize stopButton;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:) 
                                                 name:@"UIDeviceProximityStateDidChangeNotification" object:nil];
}

-(void)sensorStateChange:(NSNotificationCenter *)notification{
    
    if ([[UIDevice currentDevice] proximityState] == TRUE) {
        NSLog(@"A PUSH UP WAS JUST DONE");
        pushUpAmount++;
        pushUpOutput.text = [NSString stringWithFormat:@"%i",pushUpAmount];
    } else {
        NSLog(@"NOTHING WAS DONE...TRY MOVING CLOSER");
    }
    
}
- (IBAction)startButton:(id)sender {
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];

}
- (IBAction)stopButton:(id)sender{
 
    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    
    if (pushUpAmount > highest) {
        [self saveHighest];
        [self savePushUps:pushUpAmount];
        
    } else if (pushUpAmount < highest && pushUpAmount < lowest) {
        
        [self saveLowest];
        [self savePushUps:pushUpAmount];
    }
    
}

-(void)savePushUps: (int)amount{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:amount forKey:@"score"];
    
    [prefs synchronize];
}
-(void)saveHighest{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:highest forKey:@"highest"];
      [prefs synchronize];
}
-(void)saveLowest{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:lowest forKey:@"lowest"];
    [prefs synchronize];
}
    

- (void)viewDidUnload
{
    [self setPushUpOutput:nil];
    [self setStartButton:nil];
    [self setStopButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)dealloc {
    [pushUpOutput release];
    [startButton release];
    [stopButton release];
    [super dealloc];
}
@end
