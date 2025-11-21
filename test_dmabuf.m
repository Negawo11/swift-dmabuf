#import "DMABuf/Classes/DMABuf.h"
#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    NSLog(@"Starting DMABuf tests...");

    // Test 1: Set buffer and verify values
    int width = 100;
    int height = 200;
    void *buf = (void *)0x12345678;
    [DMABuf setBuf:buf width:width height:height];

    if ([DMABuf buf] != buf) {
      NSLog(@"FAIL: buf mismatch");
      return 1;
    }
    if ([DMABuf width] != width) {
      NSLog(@"FAIL: width mismatch");
      return 1;
    }
    if ([DMABuf height] != height) {
      NSLog(@"FAIL: height mismatch");
      return 1;
    }
    NSLog(@"PASS: Basic setBuf/getters");

    // Test 2: Set buffer with handle
    uint64_t handle = 0x87654321;
    [DMABuf setBufWithHandle:handle width:width height:height];
    if ((uint64_t)(uintptr_t)[DMABuf buf] != handle) {
      NSLog(@"FAIL: buf handle mismatch. Expected %llx, got %p", handle,
            [DMABuf buf]);
      return 1;
    }
    NSLog(@"PASS: setBufWithHandle");

    // Test 3: Get buffer handle
    if ([DMABuf bufHandle] != handle) {
      NSLog(@"FAIL: bufHandle mismatch");
      return 1;
    }
    NSLog(@"PASS: bufHandle");

    // Test 4: Callback
    __block BOOL callbackInvoked = NO;
    [DMABuf setFrameChangeCallback:^{
      callbackInvoked = YES;
      NSLog(@"Callback invoked!");
    }];

    [DMABuf emitFrameChangeEvent];

    if (!callbackInvoked) {
      NSLog(@"FAIL: Callback not invoked");
      return 1;
    }
    NSLog(@"PASS: Callback invocation");

    // Test 5: Null callback
    [DMABuf setFrameChangeCallback:nil];
    // Should not crash
    [DMABuf emitFrameChangeEvent];
    NSLog(@"PASS: Null callback safety");

    NSLog(@"All tests passed!");
  }
  return 0;
}
