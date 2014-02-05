//
//  SFSoundManager.h
//  soulfill
//
//  Created by Jason Marziani on 1/30/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SFSoundManager : NSObject

+(SFSoundManager *)shared;
@property(nonatomic, strong) AVAudioPlayer *player;

-(void)playTapSound;
-(void)playSwipeSound;

@end
