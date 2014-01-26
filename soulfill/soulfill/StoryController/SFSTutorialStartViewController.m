//
//  SFSTutorialStartViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFSTutorialStartViewController.h"

@interface SFSTutorialStartViewController ()

@end

@implementation SFSTutorialStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *story = @"These souls will thank us one day.  Or perhaps not.  That will be determined by our success.  Our kind possess a great internal energy.  It's the stuff that brings vigor to the body, laughter to the lips, and passion to the heart. We transfer this energy through the eyes.    To being, make eye contact with someone nearby.";
    [[SFVoiceOver shared] say:story withDelay:0.3f andBlock:nil];
}

@end
