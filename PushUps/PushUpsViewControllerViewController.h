//
//  PushUpsViewControllerViewController.h
//  PushUps
//
//  Created by Bob on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushUpsViewControllerViewController : UIViewController{
    int pushUpAmount;
    int highest;
    int lowest;
}


@property (retain, nonatomic) IBOutlet UILabel *pushUpOutput;
@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (retain, nonatomic) IBOutlet UIButton *stopButton;

@end
