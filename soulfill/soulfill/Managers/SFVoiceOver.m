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
    self.volume = 0.8f;
    self.pitch = 1.1f;
    self.rate = 0.15f;
    self.preDelay = 0;
    self.postDelay = 0;
    self.voice = [AVSpeechSynthesisVoice voiceWithLanguage: @"en-US"];
}


-(void)play:(NSString*)copy withBlock:(SFVoiceOverStateHandler)handler
{
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:copy];
    utt.volume = self.volume;
    utt.pitchMultiplier = self.pitch;
    utt.rate = self.rate;
    utt.preUtteranceDelay = self.preDelay;
    utt.postUtteranceDelay = self.postDelay;
    [self.speechSynthesizer speakUtterance:utt];
}

-(void)say:(NSString*)string withDelay:(float)delay andBlock:(SFVoiceOverStateHandler)handler
{
    self.preDelay = delay;
    [self play:string withBlock:handler];
}

-(void)stop
{
    // STOP PLAYING VO
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
}


-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"SPEECH COMPLETE");
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"CANCELED SPEECH");
}

@end
