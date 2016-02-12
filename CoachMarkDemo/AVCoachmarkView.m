//
//  AVCoachmarkView.m
//  
//
//  Created by Arpit Vishwakarma on 10/02/16.
//  Copyright © 2016 Arpit Vishwakarma. All rights reserved.
//

#import "AVCoachmarkView.h"
#import "AppDelegate.h"


@implementation AVCoachmarkView

/**
 *  initWithView create object of AVCoachmarkView
 *
 *  @param view      pass the current view
 *  @param imageName name to displayed as coach mark
 *
 *  @return return value description
 */

- (instancetype) initWithView:(UIView*)view coachMarkImageName:(NSString*)imageName {
   
    self = [super init];
    if (self) {
        
        self.frame = [[UIScreen mainScreen] bounds];
        
        imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.alpha = 0.0;

        [self addSubview:imageView];
        
        // Capture touches
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(userDidTap:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        [self setBackgroundColor:[UIColor clearColor]];

        [view addSubview:self];
        //[appDelegate.window addSubview:self];

    }
        
    return self;
}

/**
 *  Used to show the AVCoachmarkView
 */

-(void)showCoachMark {
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         imageView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         if (_autoHideAfterInterval == TRUE) {
                             [self performSelector:@selector(hideCoachMark) withObject:nil afterDelay:_hideInterval];
                         }
                     }];
}

/**
 *  Used to hide the AVCoachmarkView on tap
 */

-(void)hideCoachMark {

    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         imageView.alpha = 0.0;
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [imageView removeFromSuperview];
                         [self removeFromSuperview];

                     }];
}

#pragma mark - Touch handler

/**
 *  Detect single tap on coach view to hide 
 *
 *  @param recognizer UITapGestureRecognizer
 */

- (void)userDidTap:(UITapGestureRecognizer *)recognizer {
    
    if ([self.delegate respondsToSelector:@selector(coachMarksView:didTapOnScreen:)]) {
        [self.delegate coachMarksView:self didTapOnScreen:recognizer.view];
    }
}

@end


