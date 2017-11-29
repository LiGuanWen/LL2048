//
//  LL2048GameViewController.h
//  Pods-LL2048
//
//  Created by Lilong on 2017/10/15.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>


@interface LL2048GameViewController : UIViewController

- (void)updateScore:(NSInteger)score;

- (void)endGame:(BOOL)won;

@end
