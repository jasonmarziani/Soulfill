//
//  SFMainMenuViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFMainMenuViewController.h"
#import "SFVoiceOver.h"

@interface SFMainMenuViewController ()

@end

@implementation SFMainMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[SFVoiceOver shared] play:@"ON WITH THE GAME" withBlock:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

// OVERRIDES

-(void)respondToDubTap:(id)sender
{
    NSLog(@"OVERRIDE A DOUBLE TAP");
    [super respondToDubTap:sender];
}

-(void)respondToDown:(id)sender
{
    NSLog(@"OVERRIDE A DOWN SWIPE");
    [super respondToDown:sender];
}

@end
