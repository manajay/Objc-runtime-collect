//
//  OCMemoryTest.m
//  MNJLearn
//
//  Created by manajay on 2020/3/7.
//

#import "OCMemoryTest.h"

#import "MNJDog.h"
#import "MNJAnimal.h"
#import "MNJTaggedPointer.h"
#import "MNJGrandSon.h"
#import "Common.h"

void testAlloc(void) {
    MNJDog *dog = [MNJDog new];
    dog.nickname = @"snose";
    NSLog(@"dog: %@",dog.name);
    
    MNJDog *dog2 = [[MNJDog alloc] init];
    dog2.name = @"正常创建";
    NSLog(@"dog2: %@",dog2.name);
}

union mnj_isa_t {
    mnj_isa_t() { }
    mnj_isa_t(uintptr_t value) : bits(value) { }
    uintptr_t bits;
    
    struct {
        uintptr_t nonpointer        : 1;                                       \
        uintptr_t has_assoc         : 1;                                       \
        uintptr_t has_cxx_dtor      : 1;                                       \
        uintptr_t shiftcls          : 33; /*MACH_VM_MAX_ADDRESS 0x1000000000*/ \
        uintptr_t magic             : 6;                                       \
        uintptr_t weakly_referenced : 1;                                       \
        uintptr_t deallocating      : 1;                                       \
        uintptr_t has_sidetable_rc  : 1;                                       \
        uintptr_t extra_rc          : 19;
    };
};

void testISA_T(){
    mnj_isa_t isa(0);
    isa.bits = 0;
    NSLog(@"%lu",isa.bits);
}

void testWeak(void) {
    // clang -rewrite-objc -fobjc-arc -mmacosx-version-min=10.12 -fobjc-runtime=macosx-10.12 path/to/main.m
    NSObject *p = [[NSObject alloc] init];
    __PRAGMA_PUSH_UNUSED_VARIABLE_WARNINGS
    __weak NSObject *p1 = p;
    __PRAGMA_POP_UNUSED_VARIABLE_WARNINGS
}

void testAutoReleasePool (void) {
    MNJDog *dog = nil;
    @autoreleasepool {
        dog = [[MNJDog alloc] init];
        dog.name = @"puppy";
        NSLog(@"Hello, World!");
    }
    NSLog(@"dog: %@",dog);
}


void testTaggedPointer(void) {
    MNJTaggedPointer *pointer = [MNJTaggedPointer new];
    [pointer testShortStr];
    @try {
        [pointer testLongStr];
    } @catch (id e) {
        NSLog(@"obj catch: %@",e);
    } @catch (...) {
        NSLog(@"c++ catch");
    }
}

void testSuper(void) {
    MNJGrandSon *grandson = [MNJGrandSon new];
    [grandson eat];
}


void testSEL(void){
    // unsafe way crash
    __PRAGMA_PUSH_UNUSED_VARIABLE_WARNINGS
    const char *name = "new";
    __PRAGMA_POP_UNUSED_VARIABLE_WARNINGS
    //    SEL sel = (SEL)name;  // safe way
    SEL sel = @selector(new);
    NSObject *obj = [NSObject performSelector:sel];
    NSLog(@"obj:%@",obj);
    
    unsigned char s[21];
    for (int i = 0; i < 20; i++) {
        s[i] = i + 20;
    }
    s[20] = '\0';
    
    mnj_mapStrHash((void * )(&s));
}

static unsigned mnj_mapStrHash(const void *key) {
    // 最终返回值 无符号 防止溢出问题 unsigned(-1) 0xFFFFFFFF  size: 4字节 : 4294967295
    unsigned        hash = 0;
    unsigned char    *s = (unsigned char *)key;
    /* unsigned to avoid a sign-extend */
    /* unroll the loop */
    
    // 分别按照unsigned 的4个字节为单位进行异或处理 <<0 第一个字节 <<8 第二个字节 << 16 第三个 <<24 第四个
    // 这里是可能是 为了将二进制位都进行 同等概率的计算, 这样生成的hashcode 冲突会低一些
    if (s) for (; ; ) {
        if (*s == '\0') break;
        hash ^= *s++;
        if (*s == '\0') break;
        hash ^= *s++ << 8;
        if (*s == '\0') break;
        hash ^= *s++ << 16;
        if (*s == '\0') break;
        hash ^= *s++ << 24;
    }
    
    // xorHash 是一个非常有效的 hash , 查看参考文档 http://www.iotshare.org/archives/137.html 对于字符串hash函数的介绍
    return mnj_xorHash(hash);
}

static  unsigned mnj_xorHash(unsigned hash) {
    unsigned xored = (hash & 0xffff) ^ (hash >> 16);// 右移两个字节 相等于只取 unsigned 的一半高位
    return ((xored * 65521) + hash);
}
