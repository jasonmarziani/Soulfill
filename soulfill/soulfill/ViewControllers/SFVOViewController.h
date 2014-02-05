//
//  SFVOViewController.h
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFBaseViewController.h"
#import "SFBaseView.h"

@interface SFVOViewController : SFBaseViewController

@property (nonatomic, strong) SFBaseView *baseView;

// SPEAKING
@property (nonatomic, strong) NSString *speak;
@property (nonatomic) float delay;

// BOOLS
@property (nonatomic) BOOL dontScore;
@property (nonatomic) BOOL muteSwipe;
@property (nonatomic) BOOL hideHelp;

// GESTURES
@property (nonatomic, strong) NSString *tapto;
@property (nonatomic, strong) NSString *doubletapto;
@property (nonatomic, strong) NSString *rightswipeto;
@property (nonatomic, strong) NSString *leftswipeto;

@property (nonatomic, strong) NSString *upswipeto;
@property (nonatomic, strong) NSString *downswipeto;


-(void)gotoVOVC:(NSString*)id;

@end
