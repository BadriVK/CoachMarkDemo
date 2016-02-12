//
//  AVCoachmarkView.h
//  
//
//  Created by Arpit Vishwakarma on 10/02/16.
//  Copyright © 2016 Arpit Vishwakarma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AVCoachmarkViewDelegate;

@interface AVCoachmarkView : UIView  {
    
    //UIImageView object
    UIImageView *imageView;
}

@property (nonatomic, assign) id<AVCoachmarkViewDelegate> delegate;

@property (nonatomic, assign, getter=isAutoHideAfterInterval) BOOL autoHideAfterInterval;
@property (nonatomic, assign) float hideInterval;

/**
 *  initWithView create object of AVCoachmarkView
 *
 *  @param view      pass the current view
 *  @param imageName name to displayed as coach mark
 *
 *  @return return value description
 */
- (instancetype) initWithView:(UIView*)view coachMarkImageName:(NSString*)imageName;

/**
 *  Used to hide the AVCoachmarkView on tap
 */
-(void)hideCoachMark;

/**
 *  Used to show the AVCoachmarkView
 */
-(void)showCoachMark;

@end


@protocol AVCoachmarkViewDelegate <NSObject>

/**
 *  Delegate to get the signle tap on AVCoachmarkView
 *
 *  @param coachMarksView current AVCoachmarkView object
 *  @param sender         tap gesture object
 */
- (void)coachMarksView:(AVCoachmarkView*)coachMarksView didTapOnScreen:(id)sender;

@end

