//
//  SFBaseViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFBaseViewController.h"
#import "SFRecordManager.h"


@interface SFBaseViewController ()

@end

@implementation SFBaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TAPS 1, 2, 3
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTap:)];
     tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    UITapGestureRecognizer *dubTapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToDubTap:)];
    dubTapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:dubTapRecognizer];
    
    UITapGestureRecognizer *tripTapRecognizer = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(respondToTripTap:)];
    tripTapRecognizer.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:tripTapRecognizer];
    
    
    // SWIPES R, L, D, U
    UISwipeGestureRecognizer *lSwipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToLeft:)];
    [lSwipeRec setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:lSwipeRec];
    
    UISwipeGestureRecognizer *rSwipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToRight:)];
    [rSwipeRec setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:rSwipeRec];
    
    UISwipeGestureRecognizer *uSwipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToUp:)];
    [uSwipeRec setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:uSwipeRec];
    
    UISwipeGestureRecognizer *dSwipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToDown:)];
    [dSwipeRec setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:dSwipeRec];
    
}

-(void)respondToTap:(id)sender
{
    NSLog(@"SINGLE TAP");
    [[SFRecordManager shared] addScore:1];
}

-(void)respondToDubTap:(id)sender
{
    NSLog(@"DUBS TAP");
    
    // STOP VOICE
    [[SFVoiceOver shared] stop];
    
    // TYPICALLY A CONTINUE.
}

-(void)respondToTripTap:(id)sender
{
    NSLog(@"TRIPS TAP");
    
    // NOT DEFINED
}

//

-(void)respondToLeft:(id)sender
{
    NSLog(@"LEFT SWIPE");
}

-(void)respondToRight:(id)sender
{
    NSLog(@"RIGHT SWIPE");
}

-(void)respondToUp:(id)sender
{
    NSLog(@"UP SWIPE");
}

-(void)respondToDown:(id)sender
{
    NSLog(@"DOWN SWIPE");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
