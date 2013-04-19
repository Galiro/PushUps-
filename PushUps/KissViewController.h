//
//  SecondViewController.h
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KissViewController : UIViewController{
    int pushUps;
}

@property (retain, nonatomic) IBOutlet UIButton *pushUpButton;
@property (retain, nonatomic) IBOutlet UILabel *pushUpOutput;
@end
