//
//  LL2048GameManager.h
//  LL2048


#import <Foundation/Foundation.h>

@class LL2048Scene;
@class LL2048Grid;

typedef NS_ENUM(NSInteger, LL2048Direction) {
  LL2048DirectionUp,
  LL2048DirectionLeft,
  LL2048DirectionDown,
  LL2048DirectionRight
};

@interface LL2048GameManager : NSObject

/**
 * Starts a new session with the provided scene.
 *
 * @param scene The scene in which the game happens.
 */
- (void)startNewSessionWithScene:(LL2048Scene *)scene;

/**
 * Moves all movable tiles to the desired direction, then add one more tile to the grid.
 * Also refreshes score and checks game status (won/lost).
 *
 * @param direction The direction of the move (up, right, down, left).
 */
- (void)moveToDirection:(LL2048Direction)direction;

@end
