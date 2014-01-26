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

@interface SFVOViewController ()

@property (nonatomic, strong) SFBaseView *baseView;

@end


@implementation SFVOViewController

@synthesize speak;
@synthesize delay;

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
    if(speak == nil) return;
    
    if(_baseView) [_baseView removeFromSuperview];
    _baseView = (SFBaseView*)[[[NSBundle mainBundle] loadNibNamed:@"SFStoryView"
                                                            owner:self options:nil] objectAtIndex:0];
    _baseView.text = speak;
    [self.view addSubview:_baseView];
    [self start];
}

-(void)start
{
    [[SFVoiceOver shared] say:speak withDelay:delay];
}

-(void)gotoVOVC:(NSString*)id
{
    SFVOViewController *vc = (SFVOViewController*)[self controllerByIdentifier:id];
    [self.navigationController pushViewController:vc animated:NO];
}

// GESTURE HANDLERS

-(void)respondToTap:(id)sender
{
    /*
    if(tapto == nil) return;
    if([SFVoiceOver shared].isSpeaking) return;
    
    // THIS IS NAVIGATION, IT SHOULD BE RECORD COLLECTION??
    NSLog(@"ONETAP");   
    [self gotoVOVC:tapto];
     */
}

-(void)respondToDubTap:(id)sender
{
    NSLog(@"DUBTAP");
    // SHOULD PROBABLY PLAY SOME AUDIO HERE.
    [[SFRecordManager shared] addScore:1];

}

-(void)respondToLeft:(id)sender
{
    if(leftswipeto == nil) return;
    if([SFVoiceOver shared].isSpeaking) return; // DON"T MOVE WHEN NARRATING (ALL HELL BREAKS LOSE)
    NSLog(@"LEFTSWIPE");
    [self gotoVOVC:leftswipeto];
}

-(void)respondToRight:(id)sender
{
    if(rightswipeto == nil) return;
    if([SFVoiceOver shared].isSpeaking) return; // DON"T MOVE WHEN NARRATING (BABIES CRAY CRAY)
    
    NSLog(@"RIGHTSWIPE");
    [self gotoVOVC:rightswipeto];
}

-(void)respondToUp:(id)sender
{
    NSLog(@"UPSWIPE");
    if(_baseView){
        // SHOW THE CONTROLS SUBVIEW
        [_baseView showHelpView];
    }
}

-(void)respondToDown:(id)sender
{
    NSLog(@"DOWNSWIPE");
    if(downswipeto != nil) return;
    
    [[SFVoiceOver shared] stop];
    [self gotoVOVC:@"revealproxy"];
}

@end
