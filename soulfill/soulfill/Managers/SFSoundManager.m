//
//  SFSoundManager.m
//  soulfill
//
//  Created by Jason Marziani on 1/30/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFSoundManager.h"


@implementation SFSoundManager

static SFSoundManager *manager = nil;

+ (SFSoundManager *)shared
{
    @synchronized(self) {
        if (!manager){
            manager = [[SFSoundManager alloc] init];
        }
    }
    return manager;
}


-(void)playTapSound
{
    NSLog(@"PLAY TAP SOUND");
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"doubletap"
                                              withExtension:@"mp3"];
    [self playSound:soundURL atVolume:0.4f];
}

-(void)playSwipeSound
{
    NSLog(@"PLAY SWIPE SOUND");
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"theswipe"
                                                             withExtension:@"mp3"];
    [self playSound:soundURL atVolume:0.4f];
}


-(void)playSound:(NSURL*)url atVolume:(float)volume
{
    NSLog(@"PLAY URL: %@", [url description]);
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _player.numberOfLoops = 0; //Infinite
    [_player prepareToPlay];
    [_player play];
}

@end
