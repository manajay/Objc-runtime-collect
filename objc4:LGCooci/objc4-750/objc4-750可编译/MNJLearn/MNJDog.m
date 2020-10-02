//
//  MNJDog.m
//  MNJLearn
//
//  Created by manajay on 2020/2/26.
//

#import "MNJDog.h"

@implementation MNJDog

/// init 系统仅仅是一个模板占位方法 , 提供给调用者进行自定义处理的
- (instancetype)init
{
    self = [super init];
    if (self) {
        _legNumber = 4;
        const char* clsName = object_getClassName(self);
        NSLog(@"clsName: %s",clsName);
    }
    return self;
}

- (void)dealloc {
    ///置空
    self.name = nil;
    NSLog(@"%s",__func__);
}

@end
