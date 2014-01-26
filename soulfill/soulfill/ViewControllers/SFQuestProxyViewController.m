//
//  SFQuestProxyViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFQuestProxyViewController.h"
#import "SFMacros.h"

@interface SFQuestProxyViewController ()

@property (nonatomic, strong) NSArray *questArray;

@end

@implementation SFQuestProxyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.questArray = [self.quests componentsSeparatedByString:@","];
    
    if([self.questArray count] <= 0) return;
    
    // ANY TIME THIS IN INITIALIZED, IT PUSHES TO A RANDOM UIVIEWCONTROLLER
    float index = [SFMacros randomInRange:[self.questArray count] andLow:0];
    NSString *target = (NSString*)[self.questArray objectAtIndex:index];
    NSLog(@"TARGET: %@", target);
    [self gotoVOVC:target];
}


@end
