//
//  LL2048Cell.h
//  LL20480


#import <Foundation/Foundation.h>
#import "LL2048Position.h"
@class LL2048Tile;

@interface LL2048Cell : NSObject

/** The position of the cell. */
@property (nonatomic) LL2048Position position;

/** The tile in the cell, if any. */
@property (nonatomic, strong) LL2048Tile *tile;

/**
 * Initialize a LL2048Cell at the specified position with no tile in it.
 *
 * @param position The position of the cell.
 */
- (instancetype)initWithPosition:(LL2048Position)position;

@end
