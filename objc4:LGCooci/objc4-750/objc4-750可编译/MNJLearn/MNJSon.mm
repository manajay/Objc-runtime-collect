//
//  MNJSon.m
//  MNJLearn
//
//  Created by manajay on 2020/3/1.
//

#import "MNJSon.h"
#import "message.h"


struct __rw_objc_super {
    struct objc_object *object;
    struct objc_object *superClass;
    __rw_objc_super(struct objc_object *o, struct objc_object *s) : object(o), superClass(s) {}
};

static void _I_MNJSon_eat(MNJSon * self, SEL _cmd) {
    // 正确获取父类的方法, 真正获取的是 当前函数所在的 类对象的 superclass, 虽然子类可以缓存方法记录, 但是真正的实现只有一个, 对象方法在类对象中 当前文件的类对象中
    Class superclass = class_getSuperclass(objc_getClass("MNJSon"));
//    Class superclass = [self superclass]; 错误实现 导致堆栈移除

    __rw_objc_super superReceiver = (__rw_objc_super){
        (__bridge struct objc_object *)(id)self,
        (__bridge struct objc_object *)(id)superclass,
    };

    SEL sel = sel_registerName("eat");
    ((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)(&superReceiver, sel);
}

@implementation MNJSon

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"self class: %@", [self class]);
        NSLog(@"super class: %@",[super class]); // final call objc_object::getIsa()
    }
    return self;
}

/// 源码  -> 编译 -> 链接 -> 可执行文件->运行时加载->运行
/// 其中编译 :  预处理 -> 词法分析(token) -> 语法分析,语法树 -> 中间代码(IR 做了很多包括arc block weak) ----(后面是后端)---> 优化 -> 汇编 -> 链接
///  clang -> llvm (IR)
- (void)eat {
//    [super eat];
    /// objc_msgSendSuper 
    /// objc_msgSendSuper2
    /// 使用 clang 转换成 c++ 代码后, 这里看似是调用的 objc_msgSendSuper, 但真正是这样吗
    /// 最终验证实际上得在运行时去发现, 也就是运行时 查看汇编代码
    _I_MNJSon_eat(self,_cmd);
    NSLog(@"son eat");
}

@end
