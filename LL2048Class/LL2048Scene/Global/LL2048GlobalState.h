//
//  LL2048GlobalState.h


#import <Foundation/Foundation.h>
#import "LL2048Position.h"

#define GSTATE [LL2048GlobalState state]
#define Settings [NSUserDefaults standardUserDefaults]
#define NotifCtr [NSNotificationCenter defaultCenter]

typedef NS_ENUM(NSInteger, LL2048GameType) {
  LL2048GameTypeFibonacci = 2,
  LL2048GameTypePowerOf2 = 0,
  LL2048GameTypePowerOf3 = 1
};

@interface LL2048GlobalState : NSObject

@property (nonatomic, readonly) NSInteger dimension;
@property (nonatomic, readonly) NSInteger winningLevel;
@property (nonatomic, readonly) NSInteger tileSize;
@property (nonatomic, readonly) NSInteger borderWidth;
@property (nonatomic, readonly) NSInteger cornerRadius;
@property (nonatomic, readonly) NSInteger horizontalOffset;
@property (nonatomic, readonly) NSInteger verticalOffset;
@property (nonatomic, readonly) NSTimeInterval animationDuration;
@property (nonatomic, readonly) LL2048GameType gameType;

@property (nonatomic) BOOL needRefresh;

/** The singleton instance of state. */
+ (LL2048GlobalState *)state;

/** Refreshes global state to reflect user choice. */
- (void)loadGlobalState;

/**
 * Whether the two levels can merge with each other to form another level. 
 * This behavior is commutative.
 *
 * @param level1 The first level.
 * @param level2 The second level.
 * @return YES if the two levels are actionable with each other.
 */
- (BOOL)isLevel:(NSInteger)level1 mergeableWithLevel:(NSInteger)level2;

/**
 * The resulting level of merging the two incoming levels.
 *
 * @param level1 The first level.
 * @param level2 The second level.
 * @return The resulting level, or 0 if the two levels are not actionable.
 */
- (NSInteger)mergeLevel:(NSInteger)level1 withLevel:(NSInteger)level2;

/**
 * The numerical value of the specified level.
 *
 * @param level The level we are interested in.
 * @return The numerical value of the level.
 */
- (NSInteger)valueForLevel:(NSInteger)level;

/**
 * The background color of the specified level.
 *
 * @param level The level we are interested in.
 * @return The color of the level.
 */
- (UIColor *)colorForLevel:(NSInteger)level;

/**
 * The text color of the specified level.
 *
 * @param level The level we are interested in.
 * @return The color of the level.
 */
- (UIColor *)textColorForLevel:(NSInteger)level;

- (UIColor *)backgroundColor;

- (UIColor *)boardColor;

- (UIColor *)scoreBoardColor;

- (UIColor *)buttonColor;

- (NSString *)boldFontName;

- (NSString *)regularFontName;

/**
 * The text size of the specified value.
 *
 * @param value The value we are interested in.
 * @return The text size of the value.
 */
- (CGFloat)textSizeForValue:(NSInteger)value;

/**
 * The starting location of the position.
 *
 * @param position The position we are interested in.
 * @return The location in points, relative to the grid.
 */
- (CGPoint)locationOfPosition:(LL2048Position)position;

/**
 * The starting x location of the position.
 *
 * @param position The position we are interested in.
 * @return The x location in points, relative to the grid.
 */
- (CGFloat)xLocationOfPosition:(LL2048Position)position;

/**
 * The starting y location of the position.
 *
 * @param position The position we are interested in.
 * @return The y location in points, relative to the grid.
 */
- (CGFloat)yLocationOfPosition:(LL2048Position)position;


- (CGVector)distanceFromPosition:(LL2048Position)oldPosition toPosition:(LL2048Position)newPosition;

@end
