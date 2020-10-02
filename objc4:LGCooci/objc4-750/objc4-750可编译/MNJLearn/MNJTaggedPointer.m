//
//  MNJTaggedPointer.m
//  MNJLearn
//
//  Created by manajay on 2020/3/1.
//

#import "MNJTaggedPointer.h"

@interface MNJTaggedPointer ()
//@property (nonatomic, copy, readwrite) NSString *test;

/**
 https://stackoverflow.com/questions/3227176/error-writable-atomic-property-cannot-pair-a-synthesized-setter-getter-with-a-u
 
 I had the same problem and after doing a bit of research, here is my conclusion about this issue:
 
 The compiler warns you about a @property that you declared as atomic (i.e. by omitting the nonatomic keyword), yet you provide an incomplete implementation of how to synchronize access to that property.
 
 To make that warning disappear:
 
 If you declare a @property to be atomic then do one of the following:
 
 use @dynamic or;
 use @synthesize and keep the synthesized setter and getter or;
 provide a manual implementation of both the setter and the getter (without using one of the above directives).
 If you declare the @property with (nonatomic) then you can mix manual and synthesized implementations of getters and setters.
 
 Update: A Note on Property Auto-Synthesis
 
 As of LLVM 4.0, CLang provides auto-synthesis for declared properties that are not @dynamic. By default, even if you leave out the @synthesize, the compiler will provide getter and setter methods for you. However, the rule for atomic properties is still the same: Either let the compiler provide both the getter and the setter, OR implement them both yourself!
 
 */
@property (atomic, copy, readwrite) NSString *test;

@end

@implementation MNJTaggedPointer


/// 代码来自 https://juejin.im/post/5d77751ce51d4561eb0b2714
/// 相关知识有 Tagged Pointer , 多线程, nonatomic

- (void)testShortStr {
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{ // _Block_copy -> _NSConcreteMallocBlock
            self.test = [NSString stringWithFormat:@"%@",@"123"];
            // 这里之所以不崩溃 是因为 objc_storeStrong 实现中调用 objc_release 然后 发现 isTaggedPointer 这里直接 return了
        });
    }
}

- (void)testLongStr {
    // 断点调用 disassemble
    // 显示 call   0x1000029fe (函数地址)               ; symbol stub for: objc_storeStrong
    // test 1
    self.test = [NSString stringWithFormat:@"%@",@"abababababababababababababab"];
    self.test = [NSString stringWithFormat:@"%@",@"ababababababab"];
    // test 2
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{// 这里在release的时候就会崩溃
            // set 方法会 保留新值, 释放旧值, 因为这里多线程访问对象, 有的线程 release , 有的线程进行读取操作 最后崩溃在 hasDefaultRR 的读取数据的地方
            self.test = [NSString stringWithFormat:@"%@",@"abababababababababababababab"];
        });
    }
}

/*
 *
 
 objc_storeStrong(id *location, id obj)
 {
 id prev = *location;
 if (obj == prev) {
 return;
 }
 objc_retain(obj);
 *location = obj;
 /// 多线程在这里会 crash, 因为这里不是对象
 objc_release(prev);
 }
 
 */

/// Writable atomic property 'test' cannot pair a synthesized getter with a user defined setter 仍然会崩溃的
//- (void)setTest:(NSString *)test {
//    _test = test;
//}

/**
    仍然会崩溃的
 https://juejin.im/post/5b8fda5ce51d450e664afb2f
 
 @synthesize  test = innerTest;
 
 - (void)setTest:(NSString *)test {
 innerTest = test;
 }
 
 - (NSString *)test {
 return innerTest;
 }
 
 */

@end
