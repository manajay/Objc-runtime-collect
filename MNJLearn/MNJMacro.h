//
//  MNJMacro.h
//  objc
//
//  Created by manajay on 2020/2/26.
//

#ifndef MNJMacro_h
#define MNJMacro_h

// Log
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s %s:%d %s\t%s\n",__TIME__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__,__func__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

#endif /* MNJMacro_h */
