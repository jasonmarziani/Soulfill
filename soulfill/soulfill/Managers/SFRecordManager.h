//
//  SFRecordManager.h
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFRecordManager : NSObject

+(SFRecordManager *)shared;

@property (nonatomic) int score;


-(void)addScore:(int)toAdd;

@end
