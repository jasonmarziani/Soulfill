//
//  SFBaseViewController.h
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Categories.h"
#import "SFVoiceOver.h"
#import "SFRecordManager.h"

@interface SFBaseViewController : UIViewController

// METHODS

-(void)respondToTap:(id)sender; // MAKE SURE TO CALL SUPER
-(void)respondToDubTap:(id)sender;
-(void)respondToTripTap:(id)sender;
//
-(void)respondToLeft:(id)sender;
-(void)respondToRight:(id)sender;
-(void)respondToUp:(id)sender;
-(void)respondToDown:(id)sender;

@end
