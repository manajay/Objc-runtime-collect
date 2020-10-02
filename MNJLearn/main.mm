//
//  main.m
//  MNJLearn
//
//  Created by manajay on 2020/2/26.
//

#import <Foundation/Foundation.h>
#import "BlockTest.h"
#import "OCMemoryTest.h"

int main(int argc, const char * argv[]) {
    //    testAlloc();
    //    testTaggedPointer();
    //    testWeak();
    //    testAutoReleasePool();
    //    testSuper();
//    testSEL();
    testBlock();
    
    /// 不让进程退出,保活
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [runLoop run];
    }
    return 0;
}
