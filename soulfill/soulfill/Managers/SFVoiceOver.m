//
//  SFVoiceOver.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFVoiceOver.h"

@implementation SFVoiceOver

@synthesize speechSynthesizer;
@synthesize volume;
@synthesize pitch;
@synthesize rate;
@synthesize preDelay;
@synthesize postDelay;
@synthesize voice;
@synthesize isSpeaking;


// SINGLETON INTERFACE
static SFVoiceOver *manager = nil;

+ (SFVoiceOver *)shared
{
    @synchronized(self) {
        if (!manager){
            manager = [[SFVoiceOver alloc] init];
            manager.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
            [manager.speechSynthesizer setDelegate:manager];
            [manager defaults];
        }
    }
    return manager;
}

-(void)defaults
{
    // PULL THESE FROM SETTINGS MANAGER
    self.volume = 0.8f;
    self.pitch = 1.1f;
    self.rate = 0.15f;
    self.preDelay = 0;
    self.postDelay = 0;
    self.voice = [AVSpeechSynthesisVoice voiceWithLanguage: @"en-US"];
    self.isSpeaking = false;
}


-(void)say:(NSString*)string
{
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:string];
    utt.volume = self.volume;
    utt.pitchMultiplier = self.pitch;
    utt.rate = self.rate;
    utt.preUtteranceDelay = self.preDelay;
    utt.postUtteranceDelay = self.postDelay;
    [speechSynthesizer speakUtterance:utt];
}

-(void)say:(NSString*)string withDelay:(float)delay
{
    self.preDelay = delay;
    self.isSpeaking = YES;
    [self say:string];
}

-(void)stop
{
    // STOP PLAYING VO
    //[self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    //[self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    self.isSpeaking = NO;
}


-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.isSpeaking = NO;
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.isSpeaking = NO;
}

@end
