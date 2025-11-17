#import "DMABuf.h"

static void *_buf;
static int _width;
static int _height;

@implementation DMABuf

+ (void)setBuf:(void *)buf width:(int)width height:(int)height {
    _buf = buf;
    _width = width;
    _height = height;
}

+ (void *)buf {
    return _buf;
}

+ (int)width {
    return _width;
}

+ (int)height {
    return _height;
}

@end
