//
//  main.m
//  LGTest
//
//  Created by cooci on 2019/2/7.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSObject *objc1 = [NSObject alloc];
        id __weak objc2 = objc1; // objc_initWeak
        id __weak objc3 = objc2;
        // 对象相等 = hash 

        NSObject *temp = nil;
        @autoreleasepool { //objc_autoreleasePoolPush
            temp = [[NSObject alloc] init];
            NSLog(@"in pool temp: %@, %p",temp,temp);
        }
        NSLog(@"out pool temp: %@, %p",temp,temp);
     }
    return 0;
}
