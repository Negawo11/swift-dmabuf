#import <Foundation/Foundation.h>

@interface DMABuf : NSObject

+ (void)setBuf:(void *)buf width:(int)width height:(int)height;
+ (void *)buf;
+ (int)width;
+ (int)height;

+ (void)setFrameChangeCallback:(void (^)(void))callback;
+ (void)emitFrameChangeEvent;
+ (void)setBufWithHandle:(uint64_t)handle width:(int)width height:(int)height;
+ (uint64_t)bufHandle;

@end
