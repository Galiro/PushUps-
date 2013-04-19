//
//  YourPushUpsViewController.h
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface YourPushUpsViewController : UIViewController{
    int loadedScore;
    int lowest;
    int highest;
}
@property (retain, nonatomic) IBOutlet UILabel *lastTimeLabel;
@property (retain, nonatomic) IBOutlet UILabel *lowestLabel;
@property (retain, nonatomic) IBOutlet UILabel *highestLabel;

@end
