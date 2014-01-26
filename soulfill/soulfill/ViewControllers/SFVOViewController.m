//
//  SFVOViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFVOViewController.h"

@interface SFVOViewController ()

@end

@implementation SFVOViewController

@synthesize speak;
@synthesize delay;
@synthesize tapto;
@synthesize doubletapto;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(speak == nil) return;
    [self start];
}

-(void)start
{
    [[SFVoiceOver shared] say:speak withDelay:delay andBlock:nil];
}

-(void)respondToTap:(id)sender
{
    if(tapto == nil) return;
    
    SFVOViewController *vc = (SFVOViewController*)[self controllerByIdentifier:tapto];
    [self.navigationController pushViewController:vc animated:NO];
}


@end
