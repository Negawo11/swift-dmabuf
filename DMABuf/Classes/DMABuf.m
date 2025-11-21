#import "DMABuf.h"

static void *_buf;
static int _width;
static int _height;
static int _bytesPerRow;

@implementation DMABuf

+ (void)setBuf:(void *)buf
          width:(int)width
         height:(int)height
    bytesPerRow:(int)bytesPerRow {
  _buf = buf;
  _width = width;
  _height = height;
  _bytesPerRow = bytesPerRow;
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

+ (int)bytesPerRow {
  return _bytesPerRow;
}

static void (^_frameChangeCallback)(void);

+ (void)setFrameChangeCallback:(void (^)(void))callback {
  _frameChangeCallback = [callback copy];
}

+ (void)emitFrameChangeEvent {
  if (_frameChangeCallback) {
    _frameChangeCallback();
  }
}

+ (void)setBufWithHandle:(uint64_t)handle width:(int)width height:(int)height {
  [self setBuf:(void *)(uintptr_t)handle
            width:width
           height:height
      bytesPerRow:width * 4];
}

+ (uint64_t)bufHandle {
  return (uint64_t)(uintptr_t)_buf;
}

@end
