//
//  SFRecordManager.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFRecordManager.h"
#import "AFNetworking.h"

@implementation SFRecordManager

@synthesize score;

static SFRecordManager *manager = nil;

+ (SFRecordManager *)shared
{
    @synchronized(self)
    {
        if (!manager)
        {
            manager = [[SFRecordManager alloc] init];
            manager.score = 0;
        }
    }
    return manager;
}

-(void)addScore:(int)toAdd
{
    self.score += toAdd;
    score = 1;
}

-(IBAction)submitScore:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/soulfill/hiscore"];
    AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
    [manager POST:url.absoluteString
       parameters:@{
                    @"score":[NSString stringWithFormat:@"%d",score],
                    }
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
              //NSLog(@"JSON: %@", responseObject);
          }
          failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }
     ];
}

@end
