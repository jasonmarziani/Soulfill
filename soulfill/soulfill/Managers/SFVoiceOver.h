//
//  SFVoiceOver.h
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@class SFVoiceOver;


/*!
 @typedef
 
 @abstract Block type used to define blocks called by <SFVoiceOver> for state updates
 @discussion
 */
typedef void (^SFVoiceOverStateHandler)(SFVoiceOver *manager, NSError *error);

@interface SFVoiceOver : NSObject
<AVSpeechSynthesizerDelegate>
// SINGLETON
+(SFVoiceOver *)shared;

// PROPERTIES
@property (nonatomic, retain) AVSpeechSynthesizer *speechSynthesizer;
@property (nonatomic) float volume;
@property (nonatomic) float pitch;
@property (nonatomic) float rate;
@property (nonatomic) float preDelay;
@property (nonatomic) float postDelay;
@property (nonatomic, strong)  AVSpeechSynthesisVoice *voice;

@property (nonatomic) BOOL isSpeaking; // CHECK FOR VC'S TO BLOCK PROGRESS WHILE READING

// METHODS
-(void)say:(NSString*)string;
-(void)say:(NSString*)string withDelay:(float)delay;
-(void)stop;

@end
