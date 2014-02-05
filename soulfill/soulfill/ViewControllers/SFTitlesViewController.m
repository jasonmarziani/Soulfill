//
//  SFTitlesViewController.m
//  soulfill
//
//  Created by Jason Marziani on 2/4/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFTitlesViewController.h"

@interface SFTitlesViewController ()

@end

@implementation SFTitlesViewController

// FADE IN A VIEW AFTER PLAYING THE AUDIO SEQUENCE
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //_titleView.alpha = 0;
    self.view.alpha = 0;
    _promptView.alpha = 0;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.7f delay:_fadeDelay options:0 animations:^{
        self.view.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.7f delay:1.5f options:0 animations:^{
            _promptView.alpha = 1;
        } completion:^(BOOL finished) {
        }];

    }];
}

@end
