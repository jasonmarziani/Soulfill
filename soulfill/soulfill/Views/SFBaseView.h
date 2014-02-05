//
//  SFBaseView.h
//  soulfill
//
//  Created by Jason Marziani on 1/25/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBaseView : UIView

@property (nonatomic, retain) IBOutlet UITextView *textfield;
@property (nonatomic, retain) IBOutlet UIView *helpView;
@property (nonatomic, retain) NSString *text;

@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;

-(void)showHelpView;
-(void)updateScore;

@end
