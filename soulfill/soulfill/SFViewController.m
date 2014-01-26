//
//  SFViewController.m
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFViewController.h"
#import "SFVoiceOver.h"


@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Replace to be spoken with your Text
    //NSString *toBeSpoken = @"Some random text that you want to be spoken";
    //[self speakText:toBeSpoken];
}

/*
 Take the current contents of the TextView and output it through the speakers of the user's device
 */
- (void)speakText:(NSString *)toBeSpoken{
    
    [[SFVoiceOver shared] play:toBeSpoken withBlock:nil];
}

/*
 Increase or decrease the rate at which the text will be spoken
 */
- (IBAction)speechSpeedShouldChange:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger val = lround(slider.value);
    NSLog(@"%@",[NSString stringWithFormat:@"%ld",(long)val]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
