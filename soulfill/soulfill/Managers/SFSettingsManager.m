//
//  SFSettingsManager.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFSettingsManager.h"

@implementation SFSettingsManager

@synthesize volume;
@synthesize speed;
@synthesize pitch;
@synthesize showText;
@synthesize tutorialsOn;


// SINGLETON INTERFACE
static SFSettingsManager *manager = nil;

+ (SFSettingsManager *)shared
{
    @synchronized(self) {
        if (!manager){
            manager = [[SFSettingsManager alloc] init];
            [manager start];
        }
    }
    return manager;
}

-(void)start
{
    // set up defaults
    self.volume = 1.0;
    self.pitch = 0.8;
    self.speed = 1.0;
    
    self.showText = YES;
    self.tutorialsOn = YES;
}

@end
