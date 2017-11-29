//
//  LL2048Position.h
//
//  Created by Lilong on 2017/11/12.
//

typedef struct Position {
    NSInteger x;
    NSInteger y;
} LL2048Position;

CG_INLINE LL2048Position LL2048PositionMake(NSInteger x, NSInteger y)
{
    LL2048Position position;
    position.x = x; position.y = y;
    return position;
}
