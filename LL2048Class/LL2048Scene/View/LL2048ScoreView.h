//
//  LL2048ScoreView.h
//  LL2048


#import <UIKit/UIKit.h>

@interface LL2048ScoreView : UIView

@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *score;

/** Updates the appearance of subviews and itself. */
- (void)updateAppearance;

@end
