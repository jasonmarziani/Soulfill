//
//  SFViewController.h
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SFViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *speedSlider;

- (IBAction)speechSpeedShouldChange:(id)sender;

@end
