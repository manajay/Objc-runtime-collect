//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *tap = [NSString stringWithString:@"a short string"];
        NSNumber *nb = [NSNumber numberWithInt:123];
        NSLog(@"what is it? \n %@",tap);
        NSLog(@"what is it? \n %@",nb);

        NSLog(@"Hello, World! %@", [NSString class]);
    }
    return 0;
}
