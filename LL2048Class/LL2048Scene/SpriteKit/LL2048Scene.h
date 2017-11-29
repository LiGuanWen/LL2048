//
//  LL2048Scene.h
//  LL2048


#import <SpriteKit/SpriteKit.h>

@class LL2048Grid;
@class LL2048GameViewController;

@interface LL2048Scene : SKScene

@property (nonatomic, weak) LL2048GameViewController *delegate;

- (void)startNewGame;

- (void)loadBoardWithGrid:(LL2048Grid *)grid;

@end
