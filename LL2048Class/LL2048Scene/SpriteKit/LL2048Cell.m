//
//  LL2048Cell.m
//  LL2048


#import "LL2048Cell.h"
#import "LL2048Tile.h"

@implementation LL2048Cell

- (instancetype)initWithPosition:(LL2048Position)position
{
  if (self = [super init]) {
    self.position = position;
    self.tile = nil;
  }
  return self;
}


- (void)setTile:(LL2048Tile *)tile
{
  _tile = tile;
  if (tile) tile.cell = self;
}

@end
