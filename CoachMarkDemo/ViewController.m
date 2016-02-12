//
//  ViewController.m
//  CoachMarkDemo
//
//  Created by Arpit Vishwakarma on 12/02/16.
//  Copyright © 2016 Arpit Vishwakarma. All rights reserved.
//

#import "ViewController.h"
#import "AVCoachmarkView.h"

@interface ViewController ()<AVCoachmarkViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AVCoachmarkView *coachView = [[AVCoachmarkView alloc]initWithView:self.view coachMarkImageName:@"coachImage"];
    coachView.delegate = self;
    
    /**
     *  If auto hide enable no need to implement delegate
     */
    [coachView setAutoHideAfterInterval:FALSE];
    [coachView setHideInterval:3.0];
    
    /**
     *  Show coach mark
     */
    [coachView showCoachMark];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AVCoachmarkView Delegate

- (void)coachMarksView:(AVCoachmarkView*)coachMarksView didTapOnScreen:(id)sender {
    [coachMarksView hideCoachMark];
}


@end
