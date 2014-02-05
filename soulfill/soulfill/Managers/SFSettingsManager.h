//
//  SFSettingsManager.h
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSettingsManager : NSObject

+(SFSettingsManager *)shared;

// AUDIO PLAYBACK SETTINGS
@property (nonatomic) float volume;
@property (nonatomic) float pitch;
@property (nonatomic) float speed;

// VISUAL SETTINGS
@property (nonatomic) BOOL showText;

// PLAYTHROUGH SEETINGS
@property (nonatomic) BOOL tutorialsOn;


// PROXIES
@property(nonatomic, strong) NSArray *quests;
@property(nonatomic, strong) NSArray *reveals;

@end
