//
//  MNJAnimal.m
//  MNJLearn
//
//  Created by manajay on 2020/2/26.
//

#import "MNJAnimal.h"

@implementation MNJAnimal
- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"怪物";
    }
    return self;
}

- (void)dealloc {
    NSLog(@"name: %@",self.name);
}

@end
