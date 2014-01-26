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
@synthesize swipePrompt;

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // ADD IMAGE IF EXISTS
    CGRect rect = [[UIScreen mainScreen] bounds];
    rect.size.height -= 20;
    [textfield setFrame:rect];
    helpView.hidden = YES;
    
    scoreLabel.text = [NSString stringWithFormat:@"%i",[SFRecordManager shared].score];
    
    swipePrompt.hidden = YES;
}

-(void)setText:(NSString *)text
{
    _text = text;
    //textfield.selectable = YES;
    //textfield.text = _text;
    //textfield.selectable = NO;
    NSLog(@"%@",_text);
}

-(void)showHelpView
{
    if(helpView.hidden){
        helpView.alpha = 0;
        helpView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            helpView.alpha = 1;
        }];
    }else{
        [self hideHelpView];
    }
}

-(void)hideHelpView
{
    [UIView animateWithDuration:0.3 animations:^{
        helpView.alpha = 0;
    } completion: ^(BOOL finished) {//creates a variable (BOOL) called "finished" that is set to *YES* when animation IS completed.
        helpView.hidden = finished;//if animation is finished ("finished" == *YES*), then hidden = "finished" ... (aka hidden = *YES*)
    }];
}

-(void)showSwipePrompt
{
    swipePrompt.alpha = 0;
    swipePrompt.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        swipePrompt.alpha = 1;
    }];
}


@end
