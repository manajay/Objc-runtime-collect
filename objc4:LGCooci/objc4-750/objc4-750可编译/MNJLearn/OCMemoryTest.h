//
//  OCMemoryTest.h
//  MNJLearn
//
//  Created by manajay on 2020/3/7.
//

#import <Foundation/Foundation.h>

void testAlloc(void);
void testTaggedPointer(void);
void testWeak(void);
void testAutoReleasePool (void);
void testSuper(void);
void testSEL(void);

static  unsigned mnj_xorHash(unsigned hash) ;
static unsigned mnj_mapStrHash(const void *key) ;
