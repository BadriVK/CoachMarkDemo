## AVCoachmarkView

## Description
Add coach mark on any view controller using AVCoachmarkView in **Objective-C**

1. Implement delegate if you want to hide coach mark view on single tap or
2. Just enable ```setAutoHideAfterInterval``` to hide coach view automatically after given intervals.


##Requirements
>Objective-C (Xcode 7+)

>iOS 8+

>ARC

##Usage

Create object of AVCoachmarkView and assign coach mark image
```
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
 ```

AVCoachmarkView Delegate

```
- (void)coachMarksView:(AVCoachmarkView*)coachMarksView didTapOnScreen:(id)sender {
   [coachMarksView hideCoachMark];
}
```
## Author
([@badriVishwakarma](https://www.twitter.com/badrivk))
