//
//  SFBaseView.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFBaseView.h"
#import "SFRecordManager.h"

@implementation SFBaseView

@synthesize textfield;
@synthesize text = _text;
@synthesize helpView;

@synthesize scoreLabel;

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // ADD IMAGE IF EXISTS
    CGRect rect = [[UIScreen mainScreen] bounds];
    rect.size.height -= 20;
    [textfield setFrame:rect];
    
    helpView.alpha = 0.1;
    [self updateScore];
}

-(void)updateScore
{
    scoreLabel.text = [NSString stringWithFormat:@"%i",[SFRecordManager shared].score];
}

-(void)setText:(NSString *)text
{
    _text = text;
    NSLog(@"%@",_text);
}

-(void)showHelpView
{
    [self updateScore];
    if(helpView.alpha < 1){
        helpView.alpha = 0.1;
        [UIView animateWithDuration:0.4 animations:^{
            helpView.alpha = 1;
        }];
    }else{
        [self hideHelpView];
    }
}

-(void)hideHelpView
{
    [UIView animateWithDuration:0.4 animations:^{
        helpView.alpha = 0.1;
    }];
}

@end
