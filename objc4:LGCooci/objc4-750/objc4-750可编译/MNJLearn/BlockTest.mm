//
//  BlockTest.m
//  MNJLearn
//
//  Created by manajay on 2020/3/7.
//

#import "BlockTest.h"

typedef void(^MNJBlock)(void);

@interface MNJBlockHolder : NSObject
@property (nonatomic, copy, readwrite) MNJBlock block;
+ (instancetype)object;
@end

#pragma mark -
/// ARC 下 通过 alloc init 创建的对象不会被 加入自动释放池, 使用 类方法的很多会很多会被添加自动释放池 比如

// ARC
void testGlobalBlock () {
    NSLog(@"----------------  testGlobalBlock ----------------");
    void(^globalBlock)(void) = ^{
        NSLog(@"I'am a global block , i'm related with nobody");
    };
    globalBlock();
    NSLog(@"globalBlock: %@",globalBlock);
    NSLog(@"----------------  testGlobalBlock ---------------- \n\n");
}

// ARC
void testMallocBlock () {
    NSLog(@"----------------  testMallocBlock ----------------");
    int i = 0;
    void(^mallocBlock)(void) = ^{
        NSLog(@"I'am a malloc block, by assigning to  variable mallocBlock and also capture auto variable i: %d",i);
    };
    mallocBlock();
    NSLog(@"mallocBlock: %@",mallocBlock);
    NSLog(@"----------------  testMallocBlock ----------------\n \n");
}

// ARC
void testStackBlock () {
    NSLog(@"----------------  testStackBlock ----------------");
    int i = 0;
    NSLog(@" stack block %@",^{
        NSLog(@"I'am still a stack block, although i capture auto variable i: %d",i);
    });
    
    ^{
        NSLog(@"I'am still a stack block, although i capture auto variable i: %d",i);
    }();
    NSLog(@"----------------  testStackBlock ----------------\n \n");
}

void testModifyAutoVariable() {
    NSLog(@"----------------  testModifyAutoVariable ----------------");
    // NSObject *obj = [NSObject new]; compile error
    __block NSObject *obj = [NSObject new];
    void(^mallocBlock)(void) = ^{
        NSLog(@"I'am a malloc block. By using __block , i can modify auto variable obj: %@",obj);
        obj = nil;
    };
    mallocBlock();
    NSLog(@"mallocBlock: %@",mallocBlock);
    NSLog(@"----------------  testModifyAutoVariable ----------------\n \n");
}

/**
 void testRetainCycleRelease() {
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_zq_f38dy0c541jf8k_ndpm3hcfm0000gn_T_BlockTest_f113f0_mii_18);
 __attribute__((objc_ownership(strong))) MNJBlockHolder * holder = __null;
 
 // 这里没有看到 释放池的 pop  使用 llvm 生成 中间代码才可以
 { __AtAutoreleasePool __autoreleasepool;
     holder = ((MNJBlockHolder *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("MNJBlockHolder"), sel_registerName("new"));
     ((void (*)(id, SEL, MNJBlock))(void *)objc_msgSend)((id)holder, sel_registerName("setBlock:"), ((void (*)())&__testRetainCycleRelease_block_impl_0((void *)__testRetainCycleRelease_block_func_0, &__testRetainCycleRelease_block_desc_0_DATA)));
     NSLog((NSString *)&__NSConstantStringImpl__var_folders_zq_f38dy0c541jf8k_ndpm3hcfm0000gn_T_BlockTest_f113f0_mii_20,holder);
 }
NSLog((NSString *)&__NSConstantStringImpl__var_folders_zq_f38dy0c541jf8k_ndpm3hcfm0000gn_T_BlockTest_f113f0_mii_21,holder);
NSLog((NSString *)&__NSConstantStringImpl__var_folders_zq_f38dy0c541jf8k_ndpm3hcfm0000gn_T_BlockTest_f113f0_mii_22);
}
 
 */
void testRetainCycleRelease() {
    NSLog(@"----------------  testRetainCycleRelease ----------------");
    __strong MNJBlockHolder * holder = nil;
    // symbol stub for: objc_autoreleasePoolPush
    // 可以添加 __autoreleasing 修饰符, 系统默认添加
    @autoreleasepool {
        holder = [MNJBlockHolder new];
        holder.block = ^{
            NSLog(@"inner log release Block");
        };
        NSLog(@"@autoreleasepool end log release holder : %@",holder);
    }
    // symbol stub for: objc_autoreleasePoolPop
    // 为什么 holder 没有释放呢 应该是释放了 只是没有被别的值覆盖掉
    // 那如何测试覆盖别的内存呢 虽然在 releaseUntil 打印出 确实是进行 release , 说明 retainCount -1 了
    NSLog(@"outer log nil release holder : %@",holder);
    NSLog(@"----------------  testRetainCycleRelease ----------------\n \n");
    // 奇怪的是 重写 MNJBlockHolder 的 dealloc 是在过了 上面的打印, 说明在这里才 真正释放, retainCount == 0;
}

void testStrongRelease() {
    NSLog(@"----------------  testStrongRelease ----------------");
    /// 奇怪 到底什么时候释放呢
    __strong MNJBlockHolder * holder = nil;
    // symbol stub for: objc_autoreleasePoolPush
    @autoreleasepool {
        for (int i =0;i<4;i++) {
            @autoreleasepool {
                holder = [MNJBlockHolder new];
                NSLog(@"inner log release Block : %@ \n\n",holder);
                NSLog(@"________    \n _________\n");
            }
        }
        NSLog(@"@autoreleasepool holder : %@",holder);
        NSLog(@"________    \n _________\n");
        NSLog(@"________    \n _________\n");
    }
    NSLog(@"outer log nil release holder : %@",holder); // 这里发现并没有dealloc 呀,
    NSLog(@"----------------  testRetainCycleRelease ----------------\n \n");
}

void testRetainCycle() {
    NSLog(@"==============  testRetainCycle ============");
//    testRetainCycleRelease();
    MNJBlockHolder * holder = nil;
    @autoreleasepool {
        holder = [MNJBlockHolder new];
        holder.block = ^{
            NSLog(@"inner log Block: %@",holder);
        };
    }
    NSLog(@"outer log retain cycle holder : %@",holder);
    NSLog(@"==============  testRetainCycle ============\n \n");
}

void testBreakRetainCycleUsingWeak() {
    NSLog(@"==============  testBreakRetainCycleUsingWeak ============");
//    testRetainCycleRelease();

    MNJBlockHolder * holder = nil;
    @autoreleasepool {
        holder = [MNJBlockHolder new];
        __weak MNJBlockHolder *weakHolder = holder;
        holder.block = ^{
            NSLog(@"inner log weak Block: %@",weakHolder);
        };
    }
    NSLog(@"outer log weak nil holder : %@",holder);
    NSLog(@"==============  testBreakRetainCycleUsingWeak ============\n \n");
}


void testBreakRetainCycleUsingWeakStrongDance() {
    NSLog(@"==============  testBreakRetainCycleUsingWeakStrongDance ============");
//    testRetainCycleRelease();
    MNJBlockHolder * holder = nil;
    @autoreleasepool {
        holder = [MNJBlockHolder new];
        __weak MNJBlockHolder *weakHolder = holder;
        holder.block = ^{
            __strong MNJBlockHolder *strongHolder = weakHolder;
            NSLog(@"inner log weak strong dance Block: %@",strongHolder);
        };
    }
    NSLog(@"outer log  weak strong dance holder : %@",holder);
    NSLog(@"==============  testBreakRetainCycleUsingWeakStrongDance ============\n \n");
}

#pragma mark -
// https://github.com/LeoMobileDeveloper/Blogs/blob/master/iOS/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3ARC.md
void testStrong (){
    MNJBlockHolder *obj = nil;
    {
        obj = [[MNJBlockHolder alloc] init];
        NSLog(@"inner obj:%@",obj);
    };
    NSLog(@"outer obj:%@",obj);
    // 临时对象的作用域是什么
}

void testWeak0(){
    __weak MNJBlockHolder *obj = nil;
    {
        obj = [[MNJBlockHolder alloc] init]; // 返回引用计数为1的对象
         // 立即释放
        NSLog(@"inner obj:%@",obj);
    };
    NSLog(@"outer obj:%@",obj);
    // 临时对象的作用域是什么
}


void testWeak1(){
    __weak MNJBlockHolder *obj = nil;
    {
        obj = [MNJBlockHolder object]; // 返回一个自动释放的对象
        NSLog(@"inner obj:%@",obj);
    };
    NSLog(@"outer obj:%@",obj);
    // 后面也没有释放
    // 临时对象的作用域是什么
}


void testWeak2(){
    __weak MNJBlockHolder *obj = nil;
    @autoreleasepool {
        obj = [MNJBlockHolder object]; // 返回一个自动释放的对象
        NSLog(@"inner obj:%@",obj);
    };
    // 后面释放
    NSLog(@"outer obj:%@",obj);
    // 临时对象的作用域是什么
}


void testBlock (void) {
//   test();
//    testWeak0();
    testWeak2();

    
//    testStackBlock();
//    NSLog(@"\n  --- \n --- \n");
//    testMallocBlock();
//    NSLog(@"\n  --- \n --- \n");
//    testGlobalBlock();
//    NSLog(@"\n  --- \n --- \n");
//    testRetainCycle();
//    NSLog(@"\n  --- \n --- \n");
//    NSLog(@"\n  --- \n --- \n");
//    testRetainCycleRelease();
//    testStrongRelease();
//    NSLog(@"\n  --- \n --- \n");
//    testBreakRetainCycleUsingWeak();
//    NSLog(@"\n  --- \n --- \n");
//    testBreakRetainCycleUsingWeakStrongDance();
//    NSLog(@"\n  --- \n --- \n");
}

@implementation MNJBlockHolder

+ (instancetype)object {
    return [MNJBlockHolder new];
}
 - (void)dealloc {
     NSLog(@"MNJBlockHolder dealloc : %@",self);
     NSLog(@"________    \n _________\n");
     NSLog(@"________    \n _________\n");
     NSLog(@"________    \n _________\n");
 }
@end
