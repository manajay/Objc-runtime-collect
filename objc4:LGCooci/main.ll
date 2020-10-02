; ModuleID = 'objc4-750/objc4-750可编译/MNJLearn/main.m'
source_filename = "objc4-750/objc4-750\E5\8F\AF\E7\BC\96\E8\AF\91/MNJLearn/main.m"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%0 = type opaque
%1 = type opaque
%2 = type opaque
%3 = type opaque
%4 = type opaque
%struct._class_t = type { %struct._class_t*, %struct._class_t*, %struct._objc_cache*, i8* (i8*, i8*)**, %struct._class_ro_t* }
%struct._objc_cache = type opaque
%struct._class_ro_t = type { i32, i32, i32, i8*, i8*, %struct.__method_list_t*, %struct._objc_protocol_list*, %struct._ivar_list_t*, i8*, %struct._prop_list_t* }
%struct.__method_list_t = type { i32, i32, [0 x %struct._objc_method] }
%struct._objc_method = type { i8*, i8*, i8* }
%struct._objc_protocol_list = type { i64, [0 x %struct._protocol_t*] }
%struct._protocol_t = type { i8*, i8*, %struct._objc_protocol_list*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct._prop_list_t*, i32, i32, i8**, i8*, %struct._prop_list_t* }
%struct._ivar_list_t = type { i32, i32, [0 x %struct._ivar_t] }
%struct._ivar_t = type { i64*, i8*, i8*, i32, i32 }
%struct._prop_list_t = type { i32, i32, [0 x %struct._prop_t] }
%struct._prop_t = type { i8*, i8* }
%struct.__NSConstantString_tag = type { i32*, i32, i8*, i64 }
%struct._objc_typeinfo = type { i8**, i8*, %struct._class_t* }

@"OBJC_CLASS_$_MNJDog" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_" = private global %struct._class_t* @"OBJC_CLASS_$_MNJDog", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_ = private unnamed_addr constant [4 x i8] c"new\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_ = private externally_initialized global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@__CFConstantStringClassReference = external global [0 x i32]
@.str = private unnamed_addr constant [6 x i8] c"snose\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_ = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 5 }, section "__DATA,__cfstring", align 8
@OBJC_METH_VAR_NAME_.1 = private unnamed_addr constant [13 x i8] c"setNickname:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.2 = private externally_initialized global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.3 = private unnamed_addr constant [8 x i8] c"dog: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.4 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i64 7 }, section "__DATA,__cfstring", align 8
@OBJC_METH_VAR_NAME_.5 = private unnamed_addr constant [5 x i8] c"name\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.6 = private externally_initialized global i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.5, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.7 = private unnamed_addr constant [5 x i8] c"init\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.8 = private externally_initialized global i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.7, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.9 = private unnamed_addr constant [5 x i16] [i16 27491, i16 24120, i16 21019, i16 24314, i16 0], section "__TEXT,__ustring", align 2
@_unnamed_cfstring_.10 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 2000, i8* bitcast ([5 x i16]* @.str.9 to i8*), i64 4 }, section "__DATA,__cfstring", align 8
@OBJC_METH_VAR_NAME_.11 = private unnamed_addr constant [9 x i8] c"setName:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.12 = private externally_initialized global i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_NAME_.11, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.13 = private unnamed_addr constant [9 x i8] c"dog2: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.14 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0), i64 8 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASS_$_NSObject" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_.15" = private global %struct._class_t* @"OBJC_CLASS_$_NSObject", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@.str.16 = private unnamed_addr constant [6 x i8] c"puppy\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.17 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i64 5 }, section "__DATA,__cfstring", align 8
@.str.18 = private unnamed_addr constant [14 x i8] c"Hello, World!\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.19 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), i64 13 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASS_$_MNJTaggedPointer" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_.20" = private global %struct._class_t* @"OBJC_CLASS_$_MNJTaggedPointer", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.21 = private unnamed_addr constant [13 x i8] c"testShortStr\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.22 = private externally_initialized global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @OBJC_METH_VAR_NAME_.21, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@OBJC_EHTYPE_id = external global %struct._objc_typeinfo
@OBJC_METH_VAR_NAME_.23 = private unnamed_addr constant [12 x i8] c"testLongStr\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.24 = private externally_initialized global i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_NAME_.23, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.25 = private unnamed_addr constant [14 x i8] c"obj catch: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.26 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.25, i32 0, i32 0), i64 13 }, section "__DATA,__cfstring", align 8
@.str.27 = private unnamed_addr constant [10 x i8] c"c++ catch\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.28 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.27, i32 0, i32 0), i64 9 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASS_$_MNJGrandSon" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_.29" = private global %struct._class_t* @"OBJC_CLASS_$_MNJGrandSon", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.30 = private unnamed_addr constant [4 x i8] c"eat\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.31 = private externally_initialized global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_.30, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@llvm.compiler.used = appending global [20 x i8*] [i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.2 to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.5, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.6 to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.7, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.8 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_NAME_.11, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.12 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.15" to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.20" to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @OBJC_METH_VAR_NAME_.21, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.22 to i8*), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_NAME_.23, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.24 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.29" to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_.30, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.31 to i8*)], section "llvm.metadata"

; Function Attrs: noinline optnone ssp uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void @testWeak()
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define void @testWeak() #0 {
  %1 = alloca %0*, align 8
  %2 = alloca %0*, align 8
  %3 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.15", align 8
  %4 = bitcast %struct._class_t* %3 to i8*
  %5 = call i8* @objc_alloc(i8* %4)
  %6 = bitcast i8* %5 to %0*
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.8, align 8, !invariant.load !9
  %8 = bitcast %0* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = bitcast i8* %9 to %0*
  store %0* %10, %0** %1, align 8
  %11 = load %0*, %0** %1, align 8
  %12 = bitcast %0** %2 to i8**
  %13 = bitcast %0* %11 to i8*
  %14 = call i8* @llvm.objc.initWeak(i8** %12, i8* %13) #3
  %15 = bitcast %0** %2 to i8**
  call void @llvm.objc.destroyWeak(i8** %15) #3
  %16 = bitcast %0** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %16, i8* null) #3
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define void @testAlloc() #0 {
  %1 = alloca %1*, align 8
  %2 = alloca %1*, align 8
  %3 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %5 = bitcast %struct._class_t* %3 to i8*
  %6 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %5, i8* %4)
  %7 = bitcast i8* %6 to %1*
  store %1* %7, %1** %1, align 8
  %8 = load %1*, %1** %1, align 8
  %9 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  %10 = bitcast %1* %8 to i8*
  call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, %2*)*)(i8* %10, i8* %9, %2* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to %2*))
  %11 = load %1*, %1** %1, align 8
  %12 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.6, align 8, !invariant.load !9
  %13 = bitcast %1* %11 to i8*
  %14 = call %2* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %2* (i8*, i8*)*)(i8* %13, i8* %12)
  %15 = bitcast %2* %14 to i8*
  %16 = notail call i8* @llvm.objc.retainAutoreleasedReturnValue(i8* %15) #3
  %17 = bitcast i8* %16 to %2*
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.4 to i8*), %2* %17)
  %18 = bitcast %2* %17 to i8*
  call void @llvm.objc.release(i8* %18) #3, !clang.imprecise_release !9
  %19 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %20 = bitcast %struct._class_t* %19 to i8*
  %21 = call i8* @objc_alloc(i8* %20)
  %22 = bitcast i8* %21 to %1*
  %23 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.8, align 8, !invariant.load !9
  %24 = bitcast %1* %22 to i8*
  %25 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %24, i8* %23)
  %26 = bitcast i8* %25 to %1*
  store %1* %26, %1** %2, align 8
  %27 = load %1*, %1** %2, align 8
  %28 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.12, align 8, !invariant.load !9
  %29 = bitcast %1* %27 to i8*
  call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, %2*)*)(i8* %29, i8* %28, %2* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.10 to %2*))
  %30 = load %1*, %1** %2, align 8
  %31 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.6, align 8, !invariant.load !9
  %32 = bitcast %1* %30 to i8*
  %33 = call %2* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %2* (i8*, i8*)*)(i8* %32, i8* %31)
  %34 = bitcast %2* %33 to i8*
  %35 = notail call i8* @llvm.objc.retainAutoreleasedReturnValue(i8* %34) #3
  %36 = bitcast i8* %35 to %2*
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.14 to i8*), %2* %36)
  %37 = bitcast %2* %36 to i8*
  call void @llvm.objc.release(i8* %37) #3, !clang.imprecise_release !9
  %38 = bitcast %1** %2 to i8**
  call void @llvm.objc.storeStrong(i8** %38, i8* null) #3
  %39 = bitcast %1** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %39, i8* null) #3
  ret void
}

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) #1

declare void @NSLog(i8*, ...) #2

; Function Attrs: nounwind
declare i8* @llvm.objc.retainAutoreleasedReturnValue(i8*) #3

; Function Attrs: nounwind
declare void @llvm.objc.release(i8*) #3

declare i8* @objc_alloc(i8*)

; Function Attrs: nounwind
declare void @llvm.objc.storeStrong(i8**, i8*) #3

; Function Attrs: nounwind
declare i8* @llvm.objc.initWeak(i8**, i8*) #3

; Function Attrs: nounwind
declare void @llvm.objc.destroyWeak(i8**) #3

; Function Attrs: noinline optnone ssp uwtable
define void @testAutoReleasePool() #0 {
  %1 = alloca %1*, align 8
  store %1* null, %1** %1, align 8
  %2 = call i8* @llvm.objc.autoreleasePoolPush() #3
  %3 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %4 = bitcast %struct._class_t* %3 to i8*
  %5 = call i8* @objc_alloc(i8* %4)
  %6 = bitcast i8* %5 to %1*
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.8, align 8, !invariant.load !9
  %8 = bitcast %1* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = bitcast i8* %9 to %1*
  %11 = load %1*, %1** %1, align 8
  store %1* %10, %1** %1, align 8
  %12 = bitcast %1* %11 to i8*
  call void @llvm.objc.release(i8* %12) #3, !clang.imprecise_release !9
  %13 = load %1*, %1** %1, align 8
  %14 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.12, align 8, !invariant.load !9
  %15 = bitcast %1* %13 to i8*
  call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, %2*)*)(i8* %15, i8* %14, %2* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.17 to %2*))
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.19 to i8*))
  call void @llvm.objc.autoreleasePoolPop(i8* %2)
  %16 = load %1*, %1** %1, align 8
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.4 to i8*), %1* %16)
  %17 = bitcast %1** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %17, i8* null) #3
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.objc.autoreleasePoolPush() #3

; Function Attrs: nounwind
declare void @llvm.objc.autoreleasePoolPop(i8*) #3

; Function Attrs: noinline optnone ssp uwtable
define void @testTaggedPointer() #0 personality i8* bitcast (i32 (...)* @__objc_personality_v0 to i8*) {
  %1 = alloca %3*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  %4 = alloca i8*, align 8
  %5 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.20", align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %7 = bitcast %struct._class_t* %5 to i8*
  %8 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %7, i8* %6)
  %9 = bitcast i8* %8 to %3*
  store %3* %9, %3** %1, align 8
  %10 = load %3*, %3** %1, align 8
  %11 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.22, align 8, !invariant.load !9
  %12 = bitcast %3* %10 to i8*
  call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*)*)(i8* %12, i8* %11)
  %13 = load %3*, %3** %1, align 8
  %14 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.24, align 8, !invariant.load !9
  %15 = bitcast %3* %13 to i8*
  invoke void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*)*)(i8* %15, i8* %14)
          to label %16 unwind label %19

; <label>:16:                                     ; preds = %0
  br label %17

; <label>:17:                                     ; preds = %16, %40, %32
  %18 = bitcast %3** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %18, i8* null) #3
  ret void

; <label>:19:                                     ; preds = %0
  %20 = landingpad { i8*, i32 }
          catch %struct._objc_typeinfo* @OBJC_EHTYPE_id
          catch i8* null
  %21 = extractvalue { i8*, i32 } %20, 0
  store i8* %21, i8** %2, align 8
  %22 = extractvalue { i8*, i32 } %20, 1
  store i32 %22, i32* %3, align 4
  br label %23

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %3, align 4
  %25 = call i32 @llvm.eh.typeid.for(i8* bitcast (%struct._objc_typeinfo* @OBJC_EHTYPE_id to i8*)) #3
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %37

; <label>:27:                                     ; preds = %23
  %28 = load i8*, i8** %2, align 8
  %29 = call i8* @objc_begin_catch(i8* %28) #3
  %30 = call i8* @llvm.objc.retain(i8* %29) #3
  store i8* %30, i8** %4, align 8
  %31 = load i8*, i8** %4, align 8
  invoke void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.26 to i8*), i8* %31)
          to label %32 unwind label %33

; <label>:32:                                     ; preds = %27
  call void @llvm.objc.storeStrong(i8** %4, i8* null) #3
  call void @objc_end_catch() #3
  br label %17

; <label>:33:                                     ; preds = %27
  %34 = landingpad { i8*, i32 }
          cleanup
  %35 = extractvalue { i8*, i32 } %34, 0
  store i8* %35, i8** %2, align 8
  %36 = extractvalue { i8*, i32 } %34, 1
  store i32 %36, i32* %3, align 4
  call void @objc_end_catch() #3
  br label %46

; <label>:37:                                     ; preds = %23
  %38 = load i8*, i8** %2, align 8
  %39 = call i8* @objc_begin_catch(i8* %38) #3
  invoke void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.28 to i8*))
          to label %40 unwind label %41

; <label>:40:                                     ; preds = %37
  call void @objc_end_catch()
  br label %17

; <label>:41:                                     ; preds = %37
  %42 = landingpad { i8*, i32 }
          cleanup
  %43 = extractvalue { i8*, i32 } %42, 0
  store i8* %43, i8** %2, align 8
  %44 = extractvalue { i8*, i32 } %42, 1
  store i32 %44, i32* %3, align 4
  invoke void @objc_end_catch()
          to label %45 unwind label %51

; <label>:45:                                     ; preds = %41
  br label %46

; <label>:46:                                     ; preds = %45, %33
  %47 = load i8*, i8** %2, align 8
  %48 = load i32, i32* %3, align 4
  %49 = insertvalue { i8*, i32 } undef, i8* %47, 0
  %50 = insertvalue { i8*, i32 } %49, i32 %48, 1
  resume { i8*, i32 } %50

; <label>:51:                                     ; preds = %41
  %52 = landingpad { i8*, i32 }
          catch i8* null
  call void @objc_terminate() #5
  unreachable
}

declare i8* @objc_begin_catch(i8*)

declare void @objc_end_catch()

declare void @objc_exception_rethrow()

declare i32 @__objc_personality_v0(...)

; Function Attrs: nounwind readnone
declare i32 @llvm.eh.typeid.for(i8*) #4

; Function Attrs: nounwind
declare i8* @llvm.objc.retain(i8*) #3

declare void @objc_terminate()

; Function Attrs: noinline optnone ssp uwtable
define void @testSuper() #0 {
  %1 = alloca %4*, align 8
  %2 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.29", align 8
  %3 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %4 = bitcast %struct._class_t* %2 to i8*
  %5 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %4, i8* %3)
  %6 = bitcast i8* %5 to %4*
  store %4* %6, %4** %1, align 8
  %7 = load %4*, %4** %1, align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.31, align 8, !invariant.load !9
  %9 = bitcast %4* %7 to i8*
  call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*)*)(i8* %9, i8* %8)
  %10 = bitcast %4** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %10, i8* null) #3
  ret void
}

attributes #0 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nonlazybind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 15]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 0}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{!"Apple clang version 11.0.0 (clang-1100.0.33.12)"}
!9 = !{}
