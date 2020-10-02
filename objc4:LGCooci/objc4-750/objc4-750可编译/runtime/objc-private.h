/*
 * Copyright (c) 1999-2007 Apple Inc.  All Rights Reserved.
 * 
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*
 *    objc-private.h
 *    Copyright 1988-1996, NeXT Software, Inc.
 */

#ifndef _OBJC_PRIVATE_H_
#define _OBJC_PRIVATE_H_

#include "objc-config.h"

/* Isolate ourselves from the definitions of id and Class in the compiler 
 * and public headers.
 */

#ifdef _OBJC_OBJC_H_
#error include objc-private.h before other headers
#endif

#define OBJC_TYPES_DEFINED 1
#undef OBJC_OLD_DISPATCH_PROTOTYPES
#define OBJC_OLD_DISPATCH_PROTOTYPES 0

#include <cstddef>  // for nullptr_t
#include <stdint.h>
#include <assert.h>

struct objc_class;
struct objc_object;

typedef struct objc_class *Class;
typedef struct objc_object *id;

namespace {
    struct SideTable;
};

#include "isa.h"
//
//    nonpointer：0，代表普通的指针，存储着Class、Meta-Class对象的内存地址。 1，代表优化过，使用位域存储更多的信息
//    **  内存释放的优化 ** has_assoc：是否有设置过关联对象，如果没有，释放时会更快
//    **  内存释放的优化 ** has_cxx_dtor：是否有C++的析构函数（.cxx_destruct），如果没有，释放时会更快
//    **  内存释放的优化 ** weakly_referenced：是否有被弱引用指向过，如果没有，释放时会更快
//    **  访问class和元类的优化 **shiftcls：存储着Class、Meta-Class对象的内存地址信息
//    magic： 用于在调试时分辨对象是否未完成初始化
//    deallocating：对象是否正在释放
//    ***引用计数优化 *** extra_rc：里面存储的值是引用计数器减1
//    ***引用计数优化 *** has_sidetable_rc：引用计数器是否过大无法存储在isa中，如果为1，那么引用计数会存储在一个叫SideTable的类的属性中 ,
//
//    作者：RiverLi
//    链接：https://juejin.im/post/5c70bbcde51d4526db19c257
//    来源：掘金
//    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

/**
union isa_t
{
    Class cls;
    uintptr_t bits;
    struct {
        uintptr_t nonpointer        : 1;//->表示使用优化的isa指针
        uintptr_t has_assoc         : 1;//->是否包含关联对象
        uintptr_t has_cxx_dtor      : 1;//->是否包含析构函数
        uintptr_t shiftcls          : 33; // MACH_VM_MAX_ADDRESS 0x1000000000 ->类的指针
        uintptr_t magic             : 6;//->固定值,用于判断是否完成初始化
        uintptr_t weakly_referenced : 1;//->对象是否指向一个弱引用对象
        uintptr_t deallocating      : 1;//->对象是否正在销毁
        uintptr_t has_sidetable_rc  : 1;//1->在extra_rc存储引用计数将要溢出的时候,借助Sidetable(散列表)存储引用计数,has_sidetable_rc设置成1
        uintptr_t extra_rc          : 19;  //->存储引用计数
    };
};
 
 */

union isa_t {
    isa_t() { }
    isa_t(uintptr_t value) : bits(value) { }

    Class cls;
    uintptr_t bits;
#if defined(ISA_BITFIELD) // ??
    struct {
        ISA_BITFIELD;  // defined in isa.h
    };
#endif
};


struct objc_object {
private:
    isa_t isa; // 共聚体

public:

    // ISA() assumes this is NOT a tagged pointer object
    Class ISA();

    // getIsa() allows this to be a tagged pointer object // 内部 ISA
    Class getIsa();

    // initIsa() should be used to init the isa of new objects only.
    // If this object already has an isa, use changeIsa() for correctness.
    // initInstanceIsa(): objects with no custom RR/AWZ
    // initClassIsa(): class objects
    // initProtocolIsa(): protocol objects
    // initIsa(): other objects
    void initIsa(Class cls /*nonpointer=false*/);
    void initClassIsa(Class cls /*nonpointer=maybe*/);
    void initProtocolIsa(Class cls /*nonpointer=maybe*/);
    void initInstanceIsa(Class cls, bool hasCxxDtor);

    // changeIsa() should be used to change the isa of existing objects.
    // If this is a new object, use initIsa() for performance.
    Class changeIsa(Class newCls);

    bool hasNonpointerIsa();
    bool isTaggedPointer();
    bool isBasicTaggedPointer();
    bool isExtTaggedPointer();
    bool isClass();

    // object may have associated objects?
    bool hasAssociatedObjects();
    void setHasAssociatedObjects();

    // object may be weakly referenced?
    bool isWeaklyReferenced();
    void setWeaklyReferenced_nolock();

    // object may have -.cxx_destruct implementation?
    bool hasCxxDtor();

    // Optimized calls to retain/release methods
    id retain();
    void release();
    id autorelease();

    // Implementations of retain/release methods
    id rootRetain();
    bool rootRelease();
    id rootAutorelease();
    bool rootTryRetain();
    bool rootReleaseShouldDealloc();
    uintptr_t rootRetainCount();

    // Implementation of dealloc methods
    bool rootIsDeallocating();
    void clearDeallocating();
    void rootDealloc();

private:
    void initIsa(Class newCls, bool nonpointer, bool hasCxxDtor);

    // Slow paths for inline control
    id rootAutorelease2();
    bool overrelease_error();

#if SUPPORT_NONPOINTER_ISA
    // Unified retain count manipulation for nonpointer isa
    id rootRetain(bool tryRetain, bool handleOverflow);
    bool rootRelease(bool performDealloc, bool handleUnderflow);
    id rootRetain_overflow(bool tryRetain);
    bool rootRelease_underflow(bool performDealloc);

    void clearDeallocating_slow();

    // Side table retain count overflow for nonpointer isa
    void sidetable_lock();
    void sidetable_unlock();

    void sidetable_moveExtraRC_nolock(size_t extra_rc, bool isDeallocating, bool weaklyReferenced);
    bool sidetable_addExtraRC_nolock(size_t delta_rc);
    size_t sidetable_subExtraRC_nolock(size_t delta_rc);
    size_t sidetable_getExtraRC_nolock();
#endif

    // Side-table-only retain count
    bool sidetable_isDeallocating();
    void sidetable_clearDeallocating();

    bool sidetable_isWeaklyReferenced();
    void sidetable_setWeaklyReferenced_nolock();

    id sidetable_retain();
    id sidetable_retain_slow(SideTable& table);

    uintptr_t sidetable_release(bool performDealloc = true);
    uintptr_t sidetable_release_slow(SideTable& table, bool performDealloc = true);

    bool sidetable_tryRetain();

    uintptr_t sidetable_retainCount();
#if DEBUG
    bool sidetable_present();
#endif
};


#if __OBJC2__
typedef struct method_t *Method;
typedef struct ivar_t *Ivar;
typedef struct category_t *Category;
typedef struct property_t *objc_property_t;
#else
typedef struct old_method *Method;
typedef struct old_ivar *Ivar;
typedef struct old_category *Category;
typedef struct old_property *objc_property_t;
#endif

// Public headers

#include "objc.h"
#include "runtime.h"
#include "objc-os.h"
#include "objc-abi.h"
#include "objc-api.h"
#include "objc-config.h"
#include "objc-internal.h"
#include "maptable.h"
#include "hashtable2.h"

/* Do not include message.h here. */
/* #include "message.h" */

#define __APPLE_API_PRIVATE
#include "objc-gdb.h"
#undef __APPLE_API_PRIVATE


// Private headers

#include "objc-ptrauth.h"

#if __OBJC2__
#include "objc-runtime-new.h"
#else
#include "objc-runtime-old.h"
#endif

#include "objc-references.h"
#include "objc-initialize.h"
#include "objc-loadmethod.h"


#if SUPPORT_PREOPT  &&  __cplusplus
#include <objc-shared-cache.h>
using objc_selopt_t = const objc_opt::objc_selopt_t;
#else
struct objc_selopt_t;
#endif


#define STRINGIFY(x) #x
#define STRINGIFY2(x) STRINGIFY(x)

__BEGIN_DECLS

struct header_info;

// Split out the rw data from header info.  For now put it in a huge array
// that more than exceeds the space needed.  In future we'll just allocate
// this in the shared cache builder.
typedef struct header_info_rw {

    bool getLoaded() const {
        return isLoaded;
    }

    void setLoaded(bool v) {
        isLoaded = v ? 1: 0;
    }

    bool getAllClassesRealized() const {
        return allClassesRealized;
    }

    void setAllClassesRealized(bool v) {
        allClassesRealized = v ? 1: 0;
    }

    header_info *getNext() const {
        return (header_info *)(next << 2);
    }

    void setNext(header_info *v) {
        next = ((uintptr_t)v) >> 2;
    }

private:
#ifdef __LP64__
    uintptr_t isLoaded              : 1;
    uintptr_t allClassesRealized    : 1;
    uintptr_t next                  : 62;
#else
    uintptr_t isLoaded              : 1;
    uintptr_t allClassesRealized    : 1;
    uintptr_t next                  : 30;
#endif
} header_info_rw;

struct header_info_rw* getPreoptimizedHeaderRW(const struct header_info *const hdr);

typedef struct header_info {
private:
    // Note, this is no longer a pointer, but instead an offset to a pointer
    // from this location.
    intptr_t mhdr_offset;

    // Note, this is no longer a pointer, but instead an offset to a pointer
    // from this location.
    intptr_t info_offset;

    // Do not add fields without editing ObjCModernAbstraction.hpp
public:

    header_info_rw *getHeaderInfoRW() {
        header_info_rw *preopt =
            isPreoptimized() ? getPreoptimizedHeaderRW(this) : nil;
        if (preopt) return preopt;
        else return &rw_data[0];
    }

    const headerType *mhdr() const {
        return (const headerType *)(((intptr_t)&mhdr_offset) + mhdr_offset);
    }

    void setmhdr(const headerType *mhdr) {
        mhdr_offset = (intptr_t)mhdr - (intptr_t)&mhdr_offset;
    }

    const objc_image_info *info() const {
        return (const objc_image_info *)(((intptr_t)&info_offset) + info_offset);
    }

    void setinfo(const objc_image_info *info) {
        info_offset = (intptr_t)info - (intptr_t)&info_offset;
    }

    bool isLoaded() {
        return getHeaderInfoRW()->getLoaded();
    }

    void setLoaded(bool v) {
        getHeaderInfoRW()->setLoaded(v);
    }

    bool areAllClassesRealized() {
        return getHeaderInfoRW()->getAllClassesRealized();
    }

    void setAllClassesRealized(bool v) {
        getHeaderInfoRW()->setAllClassesRealized(v);
    }

    header_info *getNext() {
        return getHeaderInfoRW()->getNext();
    }

    void setNext(header_info *v) {
        getHeaderInfoRW()->setNext(v);
    }

    bool isBundle() {
        return mhdr()->filetype == MH_BUNDLE;
    }

    const char *fname() const {
        return dyld_image_path_containing_address(mhdr());
    }

    bool isPreoptimized() const;

#if !__OBJC2__
    struct old_protocol **proto_refs;
    struct objc_module *mod_ptr;
    size_t              mod_count;
# if TARGET_OS_WIN32
    struct objc_module **modules;
    size_t moduleCount;
    struct old_protocol **protocols;
    size_t protocolCount;
    void *imageinfo;
    size_t imageinfoBytes;
    SEL *selrefs;
    size_t selrefCount;
    struct objc_class **clsrefs;
    size_t clsrefCount;    
    TCHAR *moduleName;
# endif
#endif

private:
    // Images in the shared cache will have an empty array here while those
    // allocated at run time will allocate a single entry.
    header_info_rw rw_data[];
} header_info;

extern header_info *FirstHeader;
extern header_info *LastHeader;
extern int HeaderCount;

extern void appendHeader(header_info *hi);
extern void removeHeader(header_info *hi);

extern objc_image_info *_getObjcImageInfo(const headerType *head, size_t *size);
extern bool _hasObjcContents(const header_info *hi);


// Mach-O segment and section names are 16 bytes and may be un-terminated.

static inline bool segnameEquals(const char *lhs, const char *rhs) {
    return 0 == strncmp(lhs, rhs, 16);
}

static inline bool segnameStartsWith(const char *segname, const char *prefix) {
    return 0 == strncmp(segname, prefix, strlen(prefix));
}

static inline bool sectnameEquals(const char *lhs, const char *rhs) {
    return segnameEquals(lhs, rhs);
}

static inline bool sectnameStartsWith(const char *sectname, const char *prefix){
    return segnameStartsWith(sectname, prefix);
}


/* selectors */
extern void sel_init(size_t selrefCount);
extern SEL sel_registerNameNoLock(const char *str, bool copy);

extern SEL SEL_load;
extern SEL SEL_initialize;
extern SEL SEL_resolveClassMethod;
extern SEL SEL_resolveInstanceMethod;
extern SEL SEL_cxx_construct;
extern SEL SEL_cxx_destruct;
extern SEL SEL_retain;
extern SEL SEL_release;
extern SEL SEL_autorelease;
extern SEL SEL_retainCount;
extern SEL SEL_alloc;
extern SEL SEL_allocWithZone;
extern SEL SEL_dealloc;
extern SEL SEL_copy;
extern SEL SEL_new;
extern SEL SEL_forwardInvocation;
extern SEL SEL_tryRetain;
extern SEL SEL_isDeallocating;
extern SEL SEL_retainWeakReference;
extern SEL SEL_allowsWeakReference;

/* preoptimization */
extern void preopt_init(void);
extern void disableSharedCacheOptimizations(void);
extern bool isPreoptimized(void);
extern bool noMissingWeakSuperclasses(void);
extern header_info *preoptimizedHinfoForHeader(const headerType *mhdr);

extern objc_selopt_t *preoptimizedSelectors(void);

extern Protocol *getPreoptimizedProtocol(const char *name);

extern unsigned getPreoptimizedClassUnreasonableCount();
extern Class getPreoptimizedClass(const char *name);
extern Class* copyPreoptimizedClasses(const char *name, int *outCount);

extern bool sharedRegionContains(const void *ptr);

extern Class _calloc_class(size_t size);

/* method lookup */
extern IMP lookUpImpOrNil(Class, SEL, id obj, bool initialize, bool cache, bool resolver);
extern IMP lookUpImpOrForward(Class, SEL, id obj, bool initialize, bool cache, bool resolver);

extern IMP lookupMethodInClassAndLoadCache(Class cls, SEL sel);
extern bool class_respondsToSelector_inst(Class cls, SEL sel, id inst);

extern bool objcMsgLogEnabled;
extern bool logMessageSend(bool isClassMethod,
                    const char *objectsClass,
                    const char *implementingClass,
                    SEL selector);

/* message dispatcher */
extern IMP _class_lookupMethodAndLoadCache3(id, SEL, Class);

#if !OBJC_OLD_DISPATCH_PROTOTYPES
extern void _objc_msgForward_impcache(void);
#else
extern id _objc_msgForward_impcache(id, SEL, ...);
#endif

/* errors */
extern void __objc_error(id, const char *, ...) __attribute__((format (printf, 2, 3), noreturn));
extern void _objc_inform(const char *fmt, ...) __attribute__((format (printf, 1, 2)));
extern void _objc_inform_on_crash(const char *fmt, ...) __attribute__((format (printf, 1, 2)));
extern void _objc_inform_now_and_on_crash(const char *fmt, ...) __attribute__((format (printf, 1, 2)));
extern void _objc_inform_deprecated(const char *oldname, const char *newname) __attribute__((noinline));
extern void inform_duplicate(const char *name, Class oldCls, Class cls);

/* magic */
extern Class _objc_getFreedObjectClass (void);

/* map table additions */
extern void *NXMapKeyCopyingInsert(NXMapTable *table, const void *key, const void *value);
extern void *NXMapKeyFreeingRemove(NXMapTable *table, const void *key);

/* hash table additions */
extern unsigned _NXHashCapacity(NXHashTable *table);
extern void _NXHashRehashToCapacity(NXHashTable *table, unsigned newCapacity);

/* property attribute parsing */
extern const char *copyPropertyAttributeString(const objc_property_attribute_t *attrs, unsigned int count);
extern objc_property_attribute_t *copyPropertyAttributeList(const char *attrs, unsigned int *outCount);
extern char *copyPropertyAttributeValue(const char *attrs, const char *name);

/* locking */
extern void lock_init(void);

class monitor_locker_t : nocopy_t {
    monitor_t& lock;
  public:
    monitor_locker_t(monitor_t& newLock) : lock(newLock) { lock.enter(); }
    ~monitor_locker_t() { lock.leave(); }
};

class recursive_mutex_locker_t : nocopy_t {
    recursive_mutex_t& lock;
  public:
    recursive_mutex_locker_t(recursive_mutex_t& newLock) 
        : lock(newLock) { lock.lock(); }
    ~recursive_mutex_locker_t() { lock.unlock(); }
};


/* Exceptions */
struct alt_handler_list;
extern void exception_init(void);
extern void _destroyAltHandlerList(struct alt_handler_list *list);

/* Class change notifications (gdb only for now) */
#define OBJC_CLASS_ADDED (1<<0)
#define OBJC_CLASS_REMOVED (1<<1)
#define OBJC_CLASS_IVARS_CHANGED (1<<2)
#define OBJC_CLASS_METHODS_CHANGED (1<<3)
extern void gdb_objc_class_changed(Class cls, unsigned long changes, const char *classname)
    __attribute__((noinline));


// Settings from environment variables
#define OPTION(var, env, help) extern bool var;
#include "objc-env.h"
#undef OPTION

extern void environ_init(void);

extern void logReplacedMethod(const char *className, SEL s, bool isMeta, const char *catName, IMP oldImp, IMP newImp);


// objc per-thread storage
typedef struct {
    struct _objc_initializing_classes *initializingClasses; // for +initialize
    struct SyncCache *syncCache;  // for @synchronize
    struct alt_handler_list *handlerList;  // for exception alt handlers
    char *printableNames[4];  // temporary demangled names for logging

    // If you add new fields here, don't forget to update 
    // _objc_pthread_destroyspecific()

} _objc_pthread_data;

extern _objc_pthread_data *_objc_fetch_pthread_data(bool create);
extern void tls_init(void);

// encoding.h
extern unsigned int encoding_getNumberOfArguments(const char *typedesc);
extern unsigned int encoding_getSizeOfArguments(const char *typedesc);
extern unsigned int encoding_getArgumentInfo(const char *typedesc, unsigned int arg, const char **type, int *offset);
extern void encoding_getReturnType(const char *t, char *dst, size_t dst_len);
extern char * encoding_copyReturnType(const char *t);
extern void encoding_getArgumentType(const char *t, unsigned int index, char *dst, size_t dst_len);
extern char *encoding_copyArgumentType(const char *t, unsigned int index);

// sync.h
extern void _destroySyncCache(struct SyncCache *cache);

// arr
extern void arr_init(void);
extern id objc_autoreleaseReturnValue(id obj);

// block trampolines
extern IMP _imp_implementationWithBlockNoCopy(id block);

// layout.h
typedef struct {
    uint8_t *bits;
    size_t bitCount;
    size_t bitsAllocated;
    bool weak;
} layout_bitmap;
extern layout_bitmap layout_bitmap_create(const unsigned char *layout_string, size_t layoutStringInstanceSize, size_t instanceSize, bool weak);
extern layout_bitmap layout_bitmap_create_empty(size_t instanceSize, bool weak);
extern void layout_bitmap_free(layout_bitmap bits);
extern const unsigned char *layout_string_create(layout_bitmap bits);
extern void layout_bitmap_set_ivar(layout_bitmap bits, const char *type, size_t offset);
extern void layout_bitmap_grow(layout_bitmap *bits, size_t newCount);
extern void layout_bitmap_slide(layout_bitmap *bits, size_t oldPos, size_t newPos);
extern void layout_bitmap_slide_anywhere(layout_bitmap *bits, size_t oldPos, size_t newPos);
extern bool layout_bitmap_splat(layout_bitmap dst, layout_bitmap src, 
                                size_t oldSrcInstanceSize);
extern bool layout_bitmap_or(layout_bitmap dst, layout_bitmap src, const char *msg);
extern bool layout_bitmap_clear(layout_bitmap dst, layout_bitmap src, const char *msg);
extern void layout_bitmap_print(layout_bitmap bits);


// fixme runtime
extern bool MultithreadedForkChild;
extern id objc_noop_imp(id self, SEL _cmd);
extern Class look_up_class(const char *aClassName, bool includeUnconnected, bool includeClassHandler);
extern "C" void map_images(unsigned count, const char * const paths[],
                           const struct mach_header * const mhdrs[]);
extern void map_images_nolock(unsigned count, const char * const paths[],
                              const struct mach_header * const mhdrs[]);
extern void load_images(const char *path, const struct mach_header *mh);
extern void unmap_image(const char *path, const struct mach_header *mh);
extern void unmap_image_nolock(const struct mach_header *mh);
extern void _read_images(header_info **hList, uint32_t hCount, int totalClasses, int unoptimizedTotalClass);
extern void _unload_image(header_info *hi);

extern const header_info *_headerForClass(Class cls);

extern Class _class_remap(Class cls);
extern Class _class_getNonMetaClass(Class cls, id obj);
extern Ivar _class_getVariable(Class cls, const char *name);

extern unsigned _class_createInstancesFromZone(Class cls, size_t extraBytes, void *zone, id *results, unsigned num_requested);
extern id _objc_constructOrFree(id bytes, Class cls);

extern const char *_category_getName(Category cat);
extern const char *_category_getClassName(Category cat);
extern Class _category_getClass(Category cat);
extern IMP _category_getLoadMethod(Category cat);

extern id object_cxxConstructFromClass(id obj, Class cls);
extern void object_cxxDestruct(id obj);

extern void _class_resolveMethod(Class cls, SEL sel, id inst);

extern void fixupCopiedIvars(id newObject, id oldObject);
extern Class _class_getClassForIvar(Class cls, Ivar ivar);


#define OBJC_WARN_DEPRECATED \
    do { \
        static int warned = 0; \
        if (!warned) { \
            warned = 1; \
            _objc_inform_deprecated(__FUNCTION__, NULL); \
        } \
    } while (0) \

__END_DECLS


#ifndef STATIC_ASSERT
#   define STATIC_ASSERT(x) _STATIC_ASSERT2(x, __LINE__)
#   define _STATIC_ASSERT2(x, line) _STATIC_ASSERT3(x, line)
#   define _STATIC_ASSERT3(x, line)                                     \
        typedef struct {                                                \
            int _static_assert[(x) ? 0 : -1];                           \
        } _static_assert_ ## line __attribute__((unavailable)) 
#endif

#define countof(arr) (sizeof(arr) / sizeof((arr)[0]))


static __inline uint32_t _objc_strhash(const char *s) {
    uint32_t hash = 0;
    for (;;) {
    int a = *s++;
    if (0 == a) break;
    hash += (hash << 8) + a;
    }
    return hash;
}

#if __cplusplus

template <typename T>
static inline T log2u(T x) {
    return (x<2) ? 0 : log2u(x>>1)+1;
}

template <typename T>
static inline T exp2u(T x) {
    return (1 << x);
}

template <typename T>
static T exp2m1u(T x) { 
    return (1 << x) - 1; 
}

#endif

// Misalignment-safe integer types
__attribute__((aligned(1))) typedef uintptr_t unaligned_uintptr_t;
__attribute__((aligned(1))) typedef  intptr_t unaligned_intptr_t;
__attribute__((aligned(1))) typedef  uint64_t unaligned_uint64_t;
__attribute__((aligned(1))) typedef   int64_t unaligned_int64_t;
__attribute__((aligned(1))) typedef  uint32_t unaligned_uint32_t;
__attribute__((aligned(1))) typedef   int32_t unaligned_int32_t;
__attribute__((aligned(1))) typedef  uint16_t unaligned_uint16_t;
__attribute__((aligned(1))) typedef   int16_t unaligned_int16_t;


// Global operator new and delete. We must not use any app overrides.
// This ALSO REQUIRES each of these be in libobjc's unexported symbol list.
#if __cplusplus
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winline-new-delete"
#include <new>
inline void* operator new(std::size_t size) throw (std::bad_alloc) { return malloc(size); }
inline void* operator new[](std::size_t size) throw (std::bad_alloc) { return malloc(size); }
inline void* operator new(std::size_t size, const std::nothrow_t&) throw() { return malloc(size); }
inline void* operator new[](std::size_t size, const std::nothrow_t&) throw() { return malloc(size); }
inline void operator delete(void* p) throw() { free(p); }
inline void operator delete[](void* p) throw() { free(p); }
inline void operator delete(void* p, const std::nothrow_t&) throw() { free(p); }
inline void operator delete[](void* p, const std::nothrow_t&) throw() { free(p); }
#pragma clang diagnostic pop
#endif


class TimeLogger {
    uint64_t mStart;
    bool mRecord;
 public:
    TimeLogger(bool record = true) 
     : mStart(nanoseconds())
     , mRecord(record) 
    { }

    void log(const char *msg) {
        if (mRecord) {
            uint64_t end = nanoseconds();
            _objc_inform("%.2f ms: %s", (end - mStart) / 1000000.0, msg);
            mStart = nanoseconds();
        }
    }
};

enum { CacheLineSize = 64 };

// StripedMap<T> is a map of void* -> T, sized appropriately 
// for cache-friendly lock striping. 
// For example, this may be used as StripedMap<spinlock_t>
// or as StripedMap<SomeStruct> where SomeStruct stores a spin lock.
/// https://blog.csdn.net/u013378438/article/details/82790332 这里讲解的
/// 自旋锁等待时不会休眠 所以适合 等待时间短的操作
/// 锁的技巧 分离锁和分拆锁的区别, 这里使用的分拆锁的扩展 -> 分离锁  见  https://www.jianshu.com/p/ef6d9bf8fe59

/**
 bool lock = false; // 一开始没有锁上，任何线程都可以申请锁
 do {
 while(test_and_set(&lock); // test_and_set 是一个原子操作
 Critical section  // 临界区
 lock = false; // 相当于释放锁，这样别的线程可以进入临界区
 Reminder section // 不需要锁保护的代码
 }

 */

/// 这里的泛型 T 指的就是 SideTable
/// StripedMap 提供了一套拥有将地址作为 key 的 hash table 解决方案，而该方案采用了模板类，是拥有泛型性的
template<typename T>
class StripedMap {
#if TARGET_OS_IPHONE && !TARGET_OS_SIMULATOR
    enum { StripeCount = 8 }; // 这里iOS真机变成了8个了, 以前还是64个来着, 看来源码升级了
#else
    enum { StripeCount = 64 }; // iOS 模拟器的是 64个存储空间
#endif

    struct PaddedT {
        T value alignas(CacheLineSize); // 64位内存对齐
    };

    PaddedT array[StripeCount]; // 也就是存储的对象 一定是 64位的倍数

    /// 以指针为key , 然后转换成 整数值, 再经过位运算 ,再取余后得到没有越界的索引值
    static unsigned int indexForPointer(const void *p) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(p);
        return ((addr >> 4) ^ (addr >> 9)) % StripeCount;
    }

 public:
    // 根据地址 取值 的操作符 内部使用 indexForPointer 将地址转换为索引
    T& operator[] (const void *p) { 
        return array[indexForPointer(p)].value; 
    }
    /// 返回不可变元素的取值操作符
    const T& operator[] (const void *p) const { 
        return const_cast<StripedMap<T>>(this)[p]; 
    }

    // Shortcuts for StripedMaps of locks. 为所有的元素加锁, 调用的是结构体中的自旋锁 spin lock 即 spinlock_t 它的内部封装的 os_unfair_lock
    void lockAll() {
        for (unsigned int i = 0; i < StripeCount; i++) {
            array[i].value.lock();
        }
    }

    // 解锁所有元素
    void unlockAll() {
        for (unsigned int i = 0; i < StripeCount; i++) {
            array[i].value.unlock();
        }
    }

    // 应该是复位,重新生成一个 新的自选锁
    /**
     void forceReset() {
         lockdebug_mutex_unlock(this); // 尝试解锁
         // bzero 功能：置字节字符串s的前n个字节为零 (BSD 函数 POSIX标准)  vs memset (c函数) 见  https://blog.csdn.net/xingxu0207/article/details/62053966
         bzero(&mLock, sizeof(mLock));
         mLock = os_unfair_lock OS_UNFAIR_LOCK_INIT;
     }
     
     */
    void forceResetAll() {
        for (unsigned int i = 0; i < StripeCount; i++) {
            array[i].value.forceReset();
        }
    }

    void defineLockOrder() {
        for (unsigned int i = 1; i < StripeCount; i++) {
            lockdebug_lock_precedes_lock(&array[i-1].value, &array[i].value);
        }
    }

    void precedeLock(const void *newlock) {
        // assumes defineLockOrder is also called
        lockdebug_lock_precedes_lock(&array[StripeCount-1].value, newlock);
    }

    void succeedLock(const void *oldlock) {
        // assumes defineLockOrder is also called
        lockdebug_lock_precedes_lock(oldlock, &array[0].value);
    }

    const void *getLock(int i) {
        if (i < StripeCount) return &array[i].value;
        else return nil;
    }
    
#if DEBUG
    StripedMap() { /// 调试时 验证内存对齐
        // Verify alignment expectations.
        uintptr_t base = (uintptr_t)&array[0].value;
        uintptr_t delta = (uintptr_t)&array[1].value - base;
        assert(delta % CacheLineSize == 0);
        assert(base % CacheLineSize == 0);
    }
#else
    constexpr StripedMap() {}
#endif
};


// DisguisedPtr<T> acts like pointer type T*, except the 
// stored value is disguised to hide it from tools like `leaks`.
// nil is disguised as itself so zero-filled memory works as expected, 
// which means 0x80..00 is also disguised as itself but we don't care.
// Note that weak_entry_t knows about this encoding.
/// 封装的
template <typename T>
// 这里保存值进行了取反, 包装了一下
class DisguisedPtr {
    uintptr_t value;

    static uintptr_t disguise(T* ptr) {
        return -(uintptr_t)ptr;
    }

    static T* undisguise(uintptr_t val) {
        return (T*)-val;
    }

 public:
    DisguisedPtr() { }
    DisguisedPtr(T* ptr) 
        : value(disguise(ptr)) { }
    DisguisedPtr(const DisguisedPtr<T>& ptr) 
        : value(ptr.value) { }

    DisguisedPtr<T>& operator = (T* rhs) {
        value = disguise(rhs);
        return *this;
    }
    DisguisedPtr<T>& operator = (const DisguisedPtr<T>& rhs) {
        value = rhs.value;
        return *this;
    }

    operator T* () const {
        return undisguise(value);
    }
    T* operator -> () const { 
        return undisguise(value);
    }
    T& operator * () const { 
        return *undisguise(value);
    }
    T& operator [] (size_t i) const {
        return undisguise(value)[i];
    }

    // pointer arithmetic operators omitted 
    // because we don't currently use them anywhere
};

// fixme type id is weird and not identical to objc_object*
static inline bool operator == (DisguisedPtr<objc_object> lhs, id rhs) {
    return lhs == (objc_object *)rhs;
}
static inline bool operator != (DisguisedPtr<objc_object> lhs, id rhs) {
    return lhs != (objc_object *)rhs;
}


// Storage for a thread-safe chained hook function.
// get() returns the value for calling.
// set() installs a new function and returns the old one for chaining.
// More precisely, set() writes the old value to a variable supplied by
// the caller. get() and set() use appropriate barriers so that the
// old value is safely written to the variable before the new value is
// called to use it.
//
// T1: store to old variable; store-release to hook variable
// T2: load-acquire from hook variable; call it; called hook loads old variable

template <typename Fn>
class ChainedHookFunction {
    std::atomic<Fn> hook{nil};

public:
    ChainedHookFunction(Fn f) : hook{f} { };

    Fn get() {
        return hook.load(std::memory_order_acquire);
    }

    void set(Fn newValue, Fn *oldVariable)
    {
        Fn oldValue = hook.load(std::memory_order_relaxed);
        do {
            *oldVariable = oldValue;
        } while (!hook.compare_exchange_weak(oldValue, newValue,
                                             std::memory_order_release,
                                             std::memory_order_relaxed));
    }
};


// Pointer hash function.
// This is not a terrific hash, but it is fast 
// and not outrageously flawed for our purposes.

// Based on principles from http://locklessinc.com/articles/fast_hash/
// and evaluation ideas from http://floodyberry.com/noncryptohashzoo/
#if __LP64__
static inline uint32_t ptr_hash(uint64_t key)
{
    key ^= key >> 4;
    key *= 0x8a970be7488fda55;
    key ^= __builtin_bswap64(key);
    return (uint32_t)key;
}
#else
static inline uint32_t ptr_hash(uint32_t key)
{
    key ^= key >> 4;
    key *= 0x5052acdb;
    key ^= __builtin_bswap32(key);
    return key;
}
#endif

/*
  Higher-quality hash function. This is measurably slower in some workloads.
#if __LP64__
 uint32_t ptr_hash(uint64_t key)
{
    key -= __builtin_bswap64(key);
    key *= 0x8a970be7488fda55;
    key ^= __builtin_bswap64(key);
    key *= 0x8a970be7488fda55;
    key ^= __builtin_bswap64(key);
    return (uint32_t)key;
}
#else
static uint32_t ptr_hash(uint32_t key)
{
    key -= __builtin_bswap32(key);
    key *= 0x5052acdb;
    key ^= __builtin_bswap32(key);
    key *= 0x5052acdb;
    key ^= __builtin_bswap32(key);
    return key;
}
#endif
*/



// Lock declarations
#include "objc-locks.h"

// Inlined parts of objc_object's implementation
#include "objc-object.h"

#endif /* _OBJC_PRIVATE_H_ */

