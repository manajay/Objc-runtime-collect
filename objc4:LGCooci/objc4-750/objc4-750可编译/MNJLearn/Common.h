//
//  Common.h
//  objc
//
//  Created by manajay on 2020/3/7.
//

#ifndef Common_h
#define Common_h


#if __clang__
#define __PRAGMA_PUSH_UNUSED_VARIABLE_WARNINGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wunused-variable\"")

#define __PRAGMA_POP_UNUSED_VARIABLE_WARNINGS _Pragma("clang diagnostic pop")
#else
#define __PRAGMA_PUSH_UNUSED_VARIABLE_WARNINGS
#define __PRAGMA_POP_UNUSED_VARIABLE_WARNINGS
#endif

#endif /* Common_h */
