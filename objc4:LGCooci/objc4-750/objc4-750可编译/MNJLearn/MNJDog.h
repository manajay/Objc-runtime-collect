//
//  MNJDog.h
//  MNJLearn
//
//  Created by manajay on 2020/2/26.
//

#import "MNJAnimal.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNJDog : MNJAnimal
@property (nonatomic, copy, readwrite) NSString *nickname;
@property (nonatomic, assign, readwrite) NSInteger legNumber;
@end

NS_ASSUME_NONNULL_END
