//
//  SFRecordManager.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFRecordManager.h"

@implementation SFRecordManager

@synthesize score;

static SFRecordManager *manager = nil;

+ (SFRecordManager *)shared
{
    @synchronized(self) {
        if (!manager){
            manager = [[SFRecordManager alloc] init];
            manager.score = 0;
        }
    }
    return manager;
}

-(void)addScore:(int)toAdd
{
    self.score += toAdd;
}

@end
