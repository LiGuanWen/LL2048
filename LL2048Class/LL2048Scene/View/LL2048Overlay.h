//
//  LL2048Overlay.h
//  LL2048


#import <UIKit/UIKit.h>

@interface LL2048Overlay : UIView

@property (nonatomic, weak) IBOutlet UILabel *message;

@property (nonatomic, weak) IBOutlet UIButton *keepPlaying;

@property (nonatomic, weak) IBOutlet UIButton *restartGame;

@end
