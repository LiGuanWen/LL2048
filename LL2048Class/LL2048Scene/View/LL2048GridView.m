//
//  LL2048GridView.m
//  LL2048


#import "LL2048GridView.h"
#import "LL2048Grid.h"
#import "LL2048GlobalState.h"
@implementation LL2048GridView

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
      self.backgroundColor = [GSTATE scoreBoardColor];
    self.layer.cornerRadius = GSTATE.cornerRadius;
    self.layer.masksToBounds = YES;
  }
  return self;
}


- (instancetype)init
{
  NSInteger side = GSTATE.dimension * (GSTATE.tileSize + GSTATE.borderWidth) + GSTATE.borderWidth;
  CGFloat verticalOffset = [[UIScreen mainScreen] bounds].size.height - GSTATE.verticalOffset;
  return [self initWithFrame:CGRectMake(GSTATE.horizontalOffset, verticalOffset - side, side, side)];
}


+ (UIImage *)gridImageWithGrid:(LL2048Grid *)grid
{
  UIView *backgroundView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  backgroundView.backgroundColor = [GSTATE backgroundColor];
  
  LL2048GridView *view = [[LL2048GridView alloc] init];
  [backgroundView addSubview:view];
  
  [grid forEach:^(LL2048Position position) {
    CALayer *layer = [CALayer layer];
    CGPoint point = [GSTATE locationOfPosition:position];
    
    CGRect frame = layer.frame;
    frame.size = CGSizeMake(GSTATE.tileSize, GSTATE.tileSize);
    frame.origin = CGPointMake(point.x, [[UIScreen mainScreen] bounds].size.height - point.y - GSTATE.tileSize);
    layer.frame = frame;
    
    layer.backgroundColor = [GSTATE boardColor].CGColor;
    layer.cornerRadius = GSTATE.cornerRadius;
    layer.masksToBounds = YES;
    [backgroundView.layer addSublayer:layer];
  } reverseOrder:NO];
  
  return [LL2048GridView snapshotWithView:backgroundView];
}


+ (UIImage *)gridImageWithOverlay
{
  UIView *backgroundView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  backgroundView.backgroundColor = [UIColor clearColor];
  backgroundView.opaque = NO;
  
  LL2048GridView *view = [[LL2048GridView alloc] init];
  view.backgroundColor = [[GSTATE backgroundColor] colorWithAlphaComponent:0.8];
  [backgroundView addSubview:view];
  
  return [LL2048GridView snapshotWithView:backgroundView];
}


+ (UIImage *)snapshotWithView:(UIView *)view
{
  // This is a little hacky, but is probably the best generic way to do this.
  // [UIColor colorWithPatternImage] doesn't really work with SpriteKit, and we need
  // to take a retina-quality screenshot. But then in SpriteKit we need to shrink the
  // corresponding node back to scale 1.0 in order for it to display properly.
  UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque, 0.0);
  [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
