//
//  SFVOViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFVOViewController.h"
#import "SFBaseView.h"
#import "SFRecordManager.h"
#import "SFSettingsManager.h"
#import "SFSoundManager.h"
#import "SFMacros.h"

@implementation SFVOViewController

@synthesize speak;
@synthesize delay;
//
@synthesize dontScore;
@synthesize muteSwipe;
@synthesize hideHelp;

// GESTURES
@synthesize tapto;
@synthesize doubletapto;
@synthesize leftswipeto;
@synthesize rightswipeto;

@synthesize upswipeto; // USE THESE TO OVERRIDE GAME ACTIONS
@synthesize downswipeto;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
    if(!hideHelp)
    {
        if(_baseView) [_baseView removeFromSuperview];
        _baseView = (SFBaseView*)[[[NSBundle mainBundle] loadNibNamed:@"SFStoryView"
                                                            owner:self options:nil] objectAtIndex:0];
        _baseView.text = speak;
        [self.view addSubview:_baseView];
    }
    
    if(speak != NULL)[self start];
}

-(void)start
{
    [[SFVoiceOver shared] say:speak withDelay:delay];
}

#pragma mark - NAVIGATION

-(void)gotoVOVC:(NSString*)id
{
    SFVOViewController *vc = (SFVOViewController*)[self controllerByIdentifier:id];
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)gotoNewQuest
{
    if([[SFSettingsManager shared].quests count] <= 0) return;
    
    // PUSH TO A RANDOM QUEST UIVIEWCONTROLLER
    float index = [SFMacros randomInRange:[[SFSettingsManager shared].quests count] andLow:0];
    NSString *target = (NSString*)[[SFSettingsManager shared].quests objectAtIndex:index];
    [self gotoVOVC:target];
}

-(void)gotoReveal
{
    if([[SFSettingsManager shared].reveals count] <= 0) return;
    
    // PUSH TO A RANDOM REVEAL UIVIEWCONTROLLER
    float index = [SFMacros randomInRange:[[SFSettingsManager shared].reveals count] andLow:0];
    NSString *target = (NSString*)[[SFSettingsManager shared].reveals objectAtIndex:index];
    if([target isEqualToString:@"revealed"])
    {
        [SFRecordManager shared].score = 0; // RESET SCORE
    }
    [self gotoVOVC:target];
}

#pragma mark - GESTURE HANDLERS

-(void)respondToTap:(id)sender
{
    // OVERRIDE, DON'T DO ANYTHING
}

-(void)respondToDubTap:(id)sender
{
    if(dontScore) return; // NO SPEAKING, NO POINTS!
    [[SFRecordManager shared] addScore:1];
    [_baseView updateScore];
    [[SFSoundManager shared] playTapSound];
}

-(void)respondToTripTap:(id)sender
{
    if([SFVoiceOver shared].isSpeaking) return;
    [self start];
}

-(void)respondToLeft:(id)sender
{
    if(leftswipeto == nil) return;
    if([SFVoiceOver shared].isSpeaking) return;
    if([leftswipeto isEqualToString:@"questproxy"])
    {
        [self gotoNewQuest];
    }
    else
    {
        [self gotoVOVC:leftswipeto];
    }
    if(!muteSwipe) [[SFSoundManager shared] playSwipeSound];
}

-(void)respondToRight:(id)sender
{
    if(rightswipeto == nil) return;
    if([SFVoiceOver shared].isSpeaking) return;
    
    [self gotoVOVC:rightswipeto];
    if(!muteSwipe) [[SFSoundManager shared] playSwipeSound];
}

-(void)respondToUp:(id)sender
{
    if(_baseView) [_baseView showHelpView];
}

-(void)respondToDown:(id)sender
{
    if(downswipeto != nil) return;
    if([SFVoiceOver shared].isSpeaking) return;
    
    [self gotoReveal];
    [[SFSoundManager shared] playSwipeSound];
}

@end
