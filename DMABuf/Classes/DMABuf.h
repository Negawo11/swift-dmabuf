#import <Foundation/Foundation.h>

@interface DMABuf : NSObject

+ (void)setBuf:(void *)buf width:(int)width height:(int)height;
+ (void *)buf;
+ (int)width;
+ (int)height;

@end
