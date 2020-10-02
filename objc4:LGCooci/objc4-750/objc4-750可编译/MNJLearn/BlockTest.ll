; ModuleID = 'BlockTest.mm'
source_filename = "BlockTest.mm"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%0 = type opaque
%1 = type opaque
%2 = type opaque
%struct.__NSConstantString_tag = type { i32*, i32, i8*, i64 }
%struct.__block_descriptor = type { i64, i64 }
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
%struct.__block_literal_generic = type { i8*, i32, i32, i8*, %struct.__block_descriptor* }
%struct.__block_byref_obj = type { i8*, %struct.__block_byref_obj*, i32, i32, i8*, i8*, %1* }
%struct.__block_byref_obj.0 = type { i8*, %struct.__block_byref_obj.0*, i32, i32, i8*, i8*, %1* }
%struct._objc_super = type { i8*, i8* }

@__CFConstantStringClassReference = external global [0 x i32]
@.str = private unnamed_addr constant [51 x i8] c"----------------  testGlobalBlock ----------------\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_ = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i64 50 }, section "__DATA,__cfstring", align 8
@_NSConcreteGlobalBlock = external global i8*
@.str.1 = private unnamed_addr constant [6 x i8] c"v8@?0\00", align 1
@"__block_descriptor_32_e5_v8\01?0l" = linkonce_odr hidden unnamed_addr constant { i64, i64, i8*, i8* } { i64 0, i64 32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* null }, align 8
@__block_literal_global = internal constant { i8**, i32, i32, i8*, %struct.__block_descriptor* } { i8** @_NSConcreteGlobalBlock, i32 1342177280, i32 0, i8* bitcast (void (i8*)* @___Z15testGlobalBlockv_block_invoke to i8*), %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @"__block_descriptor_32_e5_v8\01?0l" to %struct.__block_descriptor*) }, align 8
@.str.2 = private unnamed_addr constant [46 x i8] c"I'am a global block , i'm related with nobody\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.3 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i32 0, i32 0), i64 45 }, section "__DATA,__cfstring", align 8
@.str.4 = private unnamed_addr constant [16 x i8] c"globalBlock: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.5 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i64 15 }, section "__DATA,__cfstring", align 8
@.str.6 = private unnamed_addr constant [54 x i8] c"----------------  testGlobalBlock ---------------- \0A\0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.7 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.6, i32 0, i32 0), i64 53 }, section "__DATA,__cfstring", align 8
@.str.8 = private unnamed_addr constant [51 x i8] c"----------------  testMallocBlock ----------------\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.9 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.8, i32 0, i32 0), i64 50 }, section "__DATA,__cfstring", align 8
@.str.10 = private unnamed_addr constant [96 x i8] c"I'am a malloc block, by assigning to  variable mallocBlock and also capture auto variable i: %d\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.11 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @.str.10, i32 0, i32 0), i64 95 }, section "__DATA,__cfstring", align 8
@_NSConcreteStackBlock = external global i8*
@OBJC_CLASS_NAME_ = private unnamed_addr constant [1 x i8] zeroinitializer, section "__TEXT,__objc_classname,cstring_literals", align 1
@"__block_descriptor_36_e5_v8\01?0l" = linkonce_odr hidden unnamed_addr constant { i64, i64, i8*, i8* } { i64 0, i64 36, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0) }, align 8
@.str.12 = private unnamed_addr constant [16 x i8] c"mallocBlock: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.13 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.12, i32 0, i32 0), i64 15 }, section "__DATA,__cfstring", align 8
@.str.14 = private unnamed_addr constant [54 x i8] c"----------------  testMallocBlock ----------------\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.15 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.14, i32 0, i32 0), i64 53 }, section "__DATA,__cfstring", align 8
@.str.16 = private unnamed_addr constant [50 x i8] c"----------------  testStackBlock ----------------\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.17 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.16, i32 0, i32 0), i64 49 }, section "__DATA,__cfstring", align 8
@.str.18 = private unnamed_addr constant [16 x i8] c" stack block %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.19 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.18, i32 0, i32 0), i64 15 }, section "__DATA,__cfstring", align 8
@.str.20 = private unnamed_addr constant [65 x i8] c"I'am still a stack block, although i capture auto variable i: %d\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.21 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.20, i32 0, i32 0), i64 64 }, section "__DATA,__cfstring", align 8
@.str.22 = private unnamed_addr constant [53 x i8] c"----------------  testStackBlock ----------------\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.23 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.22, i32 0, i32 0), i64 52 }, section "__DATA,__cfstring", align 8
@.str.24 = private unnamed_addr constant [58 x i8] c"----------------  testModifyAutoVariable ----------------\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.25 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.24, i32 0, i32 0), i64 57 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASS_$_NSObject" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_" = private global %struct._class_t* @"OBJC_CLASS_$_NSObject", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_ = private unnamed_addr constant [4 x i8] c"new\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_ = private externally_initialized global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.26 = private unnamed_addr constant [75 x i8] c"I'am a malloc block. By using __block , i can modify auto variable obj: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.27 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.26, i32 0, i32 0), i64 74 }, section "__DATA,__cfstring", align 8
@"__block_descriptor_40_ea8_32r_e5_v8\01?0l" = linkonce_odr hidden unnamed_addr constant { i64, i64, i8*, i8*, i8*, i64 } { i64 0, i64 40, i8* bitcast (void (i8*, i8*)* @__copy_helper_block_ea8_32r to i8*), i8* bitcast (void (i8*)* @__destroy_helper_block_ea8_32r to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 16 }, align 8
@.str.28 = private unnamed_addr constant [61 x i8] c"----------------  testModifyAutoVariable ----------------\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.29 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.28, i32 0, i32 0), i64 60 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASS_$_MNJBlockHolder" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_MNJBlockHolder", %struct._class_t* @"OBJC_CLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_CLASS_RO_$_MNJBlockHolder" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASSLIST_REFERENCES_$_.30" = private global %struct._class_t* @"OBJC_CLASS_$_MNJBlockHolder", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@.str.31 = private unnamed_addr constant [34 x i8] c"outer log nil release holder : %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.32 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.31, i32 0, i32 0), i64 33 }, section "__DATA,__cfstring", align 8
@.str.33 = private unnamed_addr constant [45 x i8] c"==============  testRetainCycle ============\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.34 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.33, i32 0, i32 0), i64 44 }, section "__DATA,__cfstring", align 8
@.str.35 = private unnamed_addr constant [20 x i8] c"inner log Block: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.36 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.35, i32 0, i32 0), i64 19 }, section "__DATA,__cfstring", align 8
@"__block_descriptor_40_ea8_32s_e5_v8\01?0l" = linkonce_odr hidden unnamed_addr constant { i64, i64, i8*, i8*, i8*, i64 } { i64 0, i64 40, i8* bitcast (void (i8*, i8*)* @__copy_helper_block_ea8_32s to i8*), i8* bitcast (void (i8*)* @__destroy_helper_block_ea8_32s to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 256 }, align 8
@OBJC_METH_VAR_NAME_.37 = private unnamed_addr constant [10 x i8] c"setBlock:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.38 = private externally_initialized global i8* getelementptr inbounds ([10 x i8], [10 x i8]* @OBJC_METH_VAR_NAME_.37, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.39 = private unnamed_addr constant [35 x i8] c"outer log retain cycle holder : %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.40 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.39, i32 0, i32 0), i64 34 }, section "__DATA,__cfstring", align 8
@.str.41 = private unnamed_addr constant [48 x i8] c"==============  testRetainCycle ============\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.42 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.41, i32 0, i32 0), i64 47 }, section "__DATA,__cfstring", align 8
@.str.43 = private unnamed_addr constant [59 x i8] c"==============  testBreakRetainCycleUsingWeak ============\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.44 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.43, i32 0, i32 0), i64 58 }, section "__DATA,__cfstring", align 8
@.str.45 = private unnamed_addr constant [25 x i8] c"inner log weak Block: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.46 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.45, i32 0, i32 0), i64 24 }, section "__DATA,__cfstring", align 8
@"__block_descriptor_40_ea8_32w_e5_v8\01?0l" = linkonce_odr hidden unnamed_addr constant { i64, i64, i8*, i8*, i8*, i64 } { i64 0, i64 40, i8* bitcast (void (i8*, i8*)* @__copy_helper_block_ea8_32w to i8*), i8* bitcast (void (i8*)* @__destroy_helper_block_ea8_32w to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 1 }, align 8
@.str.47 = private unnamed_addr constant [31 x i8] c"outer log weak nil holder : %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.48 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.47, i32 0, i32 0), i64 30 }, section "__DATA,__cfstring", align 8
@.str.49 = private unnamed_addr constant [62 x i8] c"==============  testBreakRetainCycleUsingWeak ============\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.50 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.49, i32 0, i32 0), i64 61 }, section "__DATA,__cfstring", align 8
@.str.51 = private unnamed_addr constant [70 x i8] c"==============  testBreakRetainCycleUsingWeakStrongDance ============\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.52 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.51, i32 0, i32 0), i64 69 }, section "__DATA,__cfstring", align 8
@.str.53 = private unnamed_addr constant [38 x i8] c"inner log weak strong dance Block: %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.54 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.53, i32 0, i32 0), i64 37 }, section "__DATA,__cfstring", align 8
@.str.55 = private unnamed_addr constant [41 x i8] c"outer log  weak strong dance holder : %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.56 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.55, i32 0, i32 0), i64 40 }, section "__DATA,__cfstring", align 8
@.str.57 = private unnamed_addr constant [73 x i8] c"==============  testBreakRetainCycleUsingWeakStrongDance ============\0A \0A\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.58 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.57, i32 0, i32 0), i64 72 }, section "__DATA,__cfstring", align 8
@.str.59 = private unnamed_addr constant [28 x i8] c"MNJBlockHolder dealloc : %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.60 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.59, i32 0, i32 0), i64 27 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASSLIST_SUP_REFS_$_" = private global %struct._class_t* @"OBJC_CLASS_$_MNJBlockHolder", section "__DATA,__objc_superrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.61 = private unnamed_addr constant [8 x i8] c"dealloc\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.62 = private externally_initialized global i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_NAME_.61, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@_objc_empty_cache = external global %struct._objc_cache
@"OBJC_METACLASS_$_NSObject" = external global %struct._class_t
@OBJC_CLASS_NAME_.63 = private unnamed_addr constant [15 x i8] c"MNJBlockHolder\00", section "__TEXT,__objc_classname,cstring_literals", align 1
@"\01l_OBJC_METACLASS_RO_$_MNJBlockHolder" = private global %struct._class_ro_t { i32 389, i32 40, i32 40, i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @OBJC_CLASS_NAME_.63, i32 0, i32 0), %struct.__method_list_t* null, %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@"OBJC_METACLASS_$_MNJBlockHolder" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_METACLASS_RO_$_MNJBlockHolder" }, section "__DATA, __objc_data", align 8
@OBJC_CLASS_NAME_.64 = private unnamed_addr constant [2 x i8] c"\01\00", section "__TEXT,__objc_classname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_ = private unnamed_addr constant [8 x i8] c"v16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.65 = private unnamed_addr constant [14 x i8] c".cxx_destruct\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.66 = private unnamed_addr constant [6 x i8] c"block\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.67 = private unnamed_addr constant [9 x i8] c"@?16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.68 = private unnamed_addr constant [12 x i8] c"v24@0:8@?16\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@"\01l_OBJC_$_INSTANCE_METHODS_MNJBlockHolder" = private global { i32, i32, [4 x %struct._objc_method] } { i32 24, i32 4, [4 x %struct._objc_method] [%struct._objc_method { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_NAME_.61, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* bitcast (void (%2*, i8*)* @"\01-[MNJBlockHolder dealloc]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @OBJC_METH_VAR_NAME_.65, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* bitcast (void (%2*, i8*)* @"\01-[MNJBlockHolder .cxx_destruct]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.66, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_TYPE_.67, i32 0, i32 0), i8* bitcast (void ()* (%2*, i8*)* @"\01-[MNJBlockHolder block]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @OBJC_METH_VAR_NAME_.37, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_TYPE_.68, i32 0, i32 0), i8* bitcast (void (%2*, i8*, void ()*)* @"\01-[MNJBlockHolder setBlock:]" to i8*) }] }, section "__DATA, __objc_const", align 8
@"OBJC_IVAR_$_MNJBlockHolder._block" = hidden constant i64 8, section "__DATA, __objc_ivar", align 8
@OBJC_METH_VAR_NAME_.69 = private unnamed_addr constant [7 x i8] c"_block\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.70 = private unnamed_addr constant [3 x i8] c"@?\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@"\01l_OBJC_$_INSTANCE_VARIABLES_MNJBlockHolder" = private global { i32, i32, [1 x %struct._ivar_t] } { i32 32, i32 1, [1 x %struct._ivar_t] [%struct._ivar_t { i64* @"OBJC_IVAR_$_MNJBlockHolder._block", i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_METH_VAR_NAME_.69, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @OBJC_METH_VAR_TYPE_.70, i32 0, i32 0), i32 3, i32 8 }] }, section "__DATA, __objc_const", align 8
@OBJC_PROP_NAME_ATTR_ = private unnamed_addr constant [6 x i8] c"block\00", section "__TEXT,__cstring,cstring_literals", align 1
@OBJC_PROP_NAME_ATTR_.71 = private unnamed_addr constant [16 x i8] c"T@?,C,N,V_block\00", section "__TEXT,__cstring,cstring_literals", align 1
@"\01l_OBJC_$_PROP_LIST_MNJBlockHolder" = private global { i32, i32, [1 x %struct._prop_t] } { i32 16, i32 1, [1 x %struct._prop_t] [%struct._prop_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_PROP_NAME_ATTR_, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @OBJC_PROP_NAME_ATTR_.71, i32 0, i32 0) }] }, section "__DATA, __objc_const", align 8
@"\01l_OBJC_CLASS_RO_$_MNJBlockHolder" = private global %struct._class_ro_t { i32 388, i32 8, i32 16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @OBJC_CLASS_NAME_.64, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @OBJC_CLASS_NAME_.63, i32 0, i32 0), %struct.__method_list_t* bitcast ({ i32, i32, [4 x %struct._objc_method] }* @"\01l_OBJC_$_INSTANCE_METHODS_MNJBlockHolder" to %struct.__method_list_t*), %struct._objc_protocol_list* null, %struct._ivar_list_t* bitcast ({ i32, i32, [1 x %struct._ivar_t] }* @"\01l_OBJC_$_INSTANCE_VARIABLES_MNJBlockHolder" to %struct._ivar_list_t*), i8* null, %struct._prop_list_t* bitcast ({ i32, i32, [1 x %struct._prop_t] }* @"\01l_OBJC_$_PROP_LIST_MNJBlockHolder" to %struct._prop_list_t*) }, section "__DATA, __objc_const", align 8
@"OBJC_LABEL_CLASS_$" = private global [1 x i8*] [i8* bitcast (%struct._class_t* @"OBJC_CLASS_$_MNJBlockHolder" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.compiler.used = appending global [25 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.30" to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @OBJC_METH_VAR_NAME_.37, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.38 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_" to i8*), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_NAME_.61, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.62 to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @OBJC_CLASS_NAME_.63, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @OBJC_CLASS_NAME_.64, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @OBJC_METH_VAR_NAME_.65, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.66, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_TYPE_.67, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_TYPE_.68, i32 0, i32 0), i8* bitcast ({ i32, i32, [4 x %struct._objc_method] }* @"\01l_OBJC_$_INSTANCE_METHODS_MNJBlockHolder" to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_METH_VAR_NAME_.69, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @OBJC_METH_VAR_TYPE_.70, i32 0, i32 0), i8* bitcast ({ i32, i32, [1 x %struct._ivar_t] }* @"\01l_OBJC_$_INSTANCE_VARIABLES_MNJBlockHolder" to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_PROP_NAME_ATTR_, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @OBJC_PROP_NAME_ATTR_.71, i32 0, i32 0), i8* bitcast ({ i32, i32, [1 x %struct._prop_t] }* @"\01l_OBJC_$_PROP_LIST_MNJBlockHolder" to i8*), i8* bitcast ([1 x i8*]* @"OBJC_LABEL_CLASS_$" to i8*)], section "llvm.metadata"

; Function Attrs: noinline optnone ssp uwtable
define void @_Z15testGlobalBlockv() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca void ()*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to %0*))
  %4 = call i8* @llvm.objc.retainBlock(i8* bitcast ({ i8**, i32, i32, i8*, %struct.__block_descriptor* }* @__block_literal_global to i8*)) #2, !clang.arc.copy_on_escape !9
  %5 = bitcast i8* %4 to void ()*
  store void ()* %5, void ()** %1, align 8
  %6 = load void ()*, void ()** %1, align 8
  %7 = bitcast void ()* %6 to %struct.__block_literal_generic*
  %8 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %7, i32 0, i32 3
  %9 = bitcast %struct.__block_literal_generic* %7 to i8*
  %10 = load i8*, i8** %8, align 8
  %11 = bitcast i8* %10 to void (i8*)*
  invoke void %11(i8* %9)
          to label %12 unwind label %17

; <label>:12:                                     ; preds = %0
  %13 = load void ()*, void ()** %1, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.5 to %0*), void ()* %13)
          to label %14 unwind label %17

; <label>:14:                                     ; preds = %12
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.7 to %0*))
          to label %15 unwind label %17

; <label>:15:                                     ; preds = %14
  %16 = bitcast void ()** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %16, i8* null) #2
  ret void

; <label>:17:                                     ; preds = %14, %12, %0
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %2, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %3, align 4
  %21 = bitcast void ()** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %21, i8* null) #2
  br label %22

; <label>:22:                                     ; preds = %17
  %23 = load i8*, i8** %2, align 8
  %24 = load i32, i32* %3, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

declare void @NSLog(%0*, ...) #1

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z15testGlobalBlockv_block_invoke(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>** %3, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.3 to %0*))
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.objc.retainBlock(i8*) #2

; Function Attrs: nounwind
declare void @llvm.objc.storeStrong(i8**, i8*) #2

; Function Attrs: noinline optnone ssp uwtable
define void @_Z15testMallocBlockv() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca i32, align 4
  %2 = alloca void ()*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, align 8
  %4 = alloca i8*
  %5 = alloca i32
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.9 to %0*))
  store i32 0, i32* %1, align 4
  %6 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %6, align 8
  %7 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 1
  store i32 -1073741824, i32* %7, align 8
  %8 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 2
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z15testMallocBlockv_block_invoke to i8*), i8** %9, align 8
  %10 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @"__block_descriptor_36_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %10, align 8
  %11 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 5
  %12 = load i32, i32* %1, align 4
  store i32 %12, i32* %11, align 8
  %13 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3 to void ()*
  %14 = bitcast void ()* %13 to i8*
  %15 = call i8* @llvm.objc.retainBlock(i8* %14) #2, !clang.arc.copy_on_escape !9
  %16 = bitcast i8* %15 to void ()*
  store void ()* %16, void ()** %2, align 8
  %17 = load void ()*, void ()** %2, align 8
  %18 = bitcast void ()* %17 to %struct.__block_literal_generic*
  %19 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %18, i32 0, i32 3
  %20 = bitcast %struct.__block_literal_generic* %18 to i8*
  %21 = load i8*, i8** %19, align 8
  %22 = bitcast i8* %21 to void (i8*)*
  invoke void %22(i8* %20)
          to label %23 unwind label %28

; <label>:23:                                     ; preds = %0
  %24 = load void ()*, void ()** %2, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.13 to %0*), void ()* %24)
          to label %25 unwind label %28

; <label>:25:                                     ; preds = %23
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.15 to %0*))
          to label %26 unwind label %28

; <label>:26:                                     ; preds = %25
  %27 = bitcast void ()** %2 to i8**
  call void @llvm.objc.storeStrong(i8** %27, i8* null) #2
  ret void

; <label>:28:                                     ; preds = %25, %23, %0
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %4, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %5, align 4
  %32 = bitcast void ()** %2 to i8**
  call void @llvm.objc.storeStrong(i8** %32, i8* null) #2
  br label %33

; <label>:33:                                     ; preds = %28
  %34 = load i8*, i8** %4, align 8
  %35 = load i32, i32* %5, align 4
  %36 = insertvalue { i8*, i32 } undef, i8* %34, 0
  %37 = insertvalue { i8*, i32 } %36, i32 %35, 1
  resume { i8*, i32 } %37
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z15testMallocBlockv_block_invoke(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>** %3, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, i32 0, i32 5
  %6 = load i32, i32* %5, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.11 to %0*), i32 %6)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define void @_Z14testStackBlockv() #0 {
  %1 = alloca i32, align 4
  %2 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.17 to %0*))
  store i32 0, i32* %1, align 4
  %4 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %4, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 1
  store i32 -1073741824, i32* %5, align 8
  %6 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 2
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z14testStackBlockv_block_invoke to i8*), i8** %7, align 8
  %8 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @"__block_descriptor_36_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %8, align 8
  %9 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2, i32 0, i32 5
  %10 = load i32, i32* %1, align 4
  store i32 %10, i32* %9, align 8
  %11 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %2 to void ()*
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.19 to %0*), void ()* %11)
  %12 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %12, align 8
  %13 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 1
  store i32 -1073741824, i32* %13, align 8
  %14 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 2
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z14testStackBlockv_block_invoke_2 to i8*), i8** %15, align 8
  %16 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @"__block_descriptor_36_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %16, align 8
  %17 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3, i32 0, i32 5
  %18 = load i32, i32* %1, align 4
  store i32 %18, i32* %17, align 8
  %19 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %3 to void ()*
  %20 = bitcast void ()* %19 to %struct.__block_literal_generic*
  %21 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %20, i32 0, i32 3
  %22 = bitcast %struct.__block_literal_generic* %20 to i8*
  %23 = load i8*, i8** %21, align 8
  %24 = bitcast i8* %23 to void (i8*)*
  call void %24(i8* %22)
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.23 to %0*))
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z14testStackBlockv_block_invoke(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>** %3, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, i32 0, i32 5
  %6 = load i32, i32* %5, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.21 to %0*), i32 %6)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z14testStackBlockv_block_invoke_2(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>** %3, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i32 }>* %4, i32 0, i32 5
  %6 = load i32, i32* %5, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.21 to %0*), i32 %6)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define void @_Z22testModifyAutoVariablev() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %struct.__block_byref_obj, align 8
  %2 = alloca void ()*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, align 8
  %4 = alloca i8*
  %5 = alloca i32
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.25 to %0*))
  %6 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 0
  store i8* null, i8** %6, align 8
  %7 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 1
  store %struct.__block_byref_obj* %1, %struct.__block_byref_obj** %7, align 8
  %8 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 2
  store i32 838860800, i32* %8, align 8
  %9 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 3
  store i32 48, i32* %9, align 4
  %10 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 4
  store i8* bitcast (void (i8*, i8*)* @__Block_byref_object_copy_ to i8*), i8** %10, align 8
  %11 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 5
  store i8* bitcast (void (i8*)* @__Block_byref_object_dispose_ to i8*), i8** %11, align 8
  %12 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 6
  %13 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %14 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %15 = bitcast %struct._class_t* %13 to i8*
  %16 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %15, i8* %14)
  %17 = bitcast i8* %16 to %1*
  store %1* %17, %1** %12, align 8
  %18 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %1, i32 0, i32 6
  %19 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %19, align 8
  %20 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 1
  store i32 -1040187392, i32* %20, align 8
  %21 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 2
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z22testModifyAutoVariablev_block_invoke to i8*), i8** %22, align 8
  %23 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8*, i8*, i64 }* @"__block_descriptor_40_ea8_32r_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %23, align 8
  %24 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3, i32 0, i32 5
  %25 = bitcast %struct.__block_byref_obj* %1 to i8*
  store i8* %25, i8** %24, align 8
  %26 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %3 to void ()*
  %27 = bitcast void ()* %26 to i8*
  %28 = call i8* @llvm.objc.retainBlock(i8* %27) #2, !clang.arc.copy_on_escape !9
  %29 = bitcast i8* %28 to void ()*
  store void ()* %29, void ()** %2, align 8
  %30 = load void ()*, void ()** %2, align 8
  %31 = bitcast void ()* %30 to %struct.__block_literal_generic*
  %32 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %31, i32 0, i32 3
  %33 = bitcast %struct.__block_literal_generic* %31 to i8*
  %34 = load i8*, i8** %32, align 8
  %35 = bitcast i8* %34 to void (i8*)*
  invoke void %35(i8* %33)
          to label %36 unwind label %43

; <label>:36:                                     ; preds = %0
  %37 = load void ()*, void ()** %2, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.13 to %0*), void ()* %37)
          to label %38 unwind label %43

; <label>:38:                                     ; preds = %36
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.29 to %0*))
          to label %39 unwind label %43

; <label>:39:                                     ; preds = %38
  %40 = bitcast void ()** %2 to i8**
  call void @llvm.objc.storeStrong(i8** %40, i8* null) #2
  %41 = bitcast %struct.__block_byref_obj* %1 to i8*
  call void @_Block_object_dispose(i8* %41, i32 8) #2
  %42 = bitcast %1** %18 to i8**
  call void @llvm.objc.storeStrong(i8** %42, i8* null) #2
  ret void

; <label>:43:                                     ; preds = %38, %36, %0
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = extractvalue { i8*, i32 } %44, 0
  store i8* %45, i8** %4, align 8
  %46 = extractvalue { i8*, i32 } %44, 1
  store i32 %46, i32* %5, align 4
  %47 = bitcast void ()** %2 to i8**
  call void @llvm.objc.storeStrong(i8** %47, i8* null) #2
  %48 = bitcast %struct.__block_byref_obj* %1 to i8*
  call void @_Block_object_dispose(i8* %48, i32 8) #2
  %49 = bitcast %1** %18 to i8**
  call void @llvm.objc.storeStrong(i8** %49, i8* null) #2
  br label %50

; <label>:50:                                     ; preds = %43
  %51 = load i8*, i8** %4, align 8
  %52 = load i32, i32* %5, align 4
  %53 = insertvalue { i8*, i32 } undef, i8* %51, 0
  %54 = insertvalue { i8*, i32 } %53, i32 %52, 1
  resume { i8*, i32 } %54
}

; Function Attrs: noinline ssp uwtable
define internal void @__Block_byref_object_copy_(i8*, i8*) #3 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to %struct.__block_byref_obj*
  %7 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %6, i32 0, i32 6
  %8 = load i8*, i8** %4, align 8
  %9 = bitcast i8* %8 to %struct.__block_byref_obj*
  %10 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %9, i32 0, i32 6
  %11 = load %1*, %1** %10, align 8
  store %1* null, %1** %7, align 8
  %12 = bitcast %1** %7 to i8**
  %13 = bitcast %1* %11 to i8*
  call void @llvm.objc.storeStrong(i8** %12, i8* %13) #2
  %14 = bitcast %1** %10 to i8**
  call void @llvm.objc.storeStrong(i8** %14, i8* null) #2
  ret void
}

; Function Attrs: noinline ssp uwtable
define internal void @__Block_byref_object_dispose_(i8*) #3 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i8* %3 to %struct.__block_byref_obj*
  %5 = getelementptr inbounds %struct.__block_byref_obj, %struct.__block_byref_obj* %4, i32 0, i32 6
  %6 = bitcast %1** %5 to i8**
  call void @llvm.objc.storeStrong(i8** %6, i8* null) #2
  ret void
}

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) #4

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z22testModifyAutoVariablev_block_invoke(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>** %3, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %4, i32 0, i32 5
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to %struct.__block_byref_obj.0*
  %8 = getelementptr inbounds %struct.__block_byref_obj.0, %struct.__block_byref_obj.0* %7, i32 0, i32 1
  %9 = load %struct.__block_byref_obj.0*, %struct.__block_byref_obj.0** %8, align 8
  %10 = getelementptr inbounds %struct.__block_byref_obj.0, %struct.__block_byref_obj.0* %9, i32 0, i32 6
  %11 = load %1*, %1** %10, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.27 to %0*), %1* %11)
  %12 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %4, i32 0, i32 5
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.__block_byref_obj.0*
  %15 = getelementptr inbounds %struct.__block_byref_obj.0, %struct.__block_byref_obj.0* %14, i32 0, i32 1
  %16 = load %struct.__block_byref_obj.0*, %struct.__block_byref_obj.0** %15, align 8
  %17 = getelementptr inbounds %struct.__block_byref_obj.0, %struct.__block_byref_obj.0* %16, i32 0, i32 6
  %18 = bitcast %1** %17 to i8**
  call void @llvm.objc.storeStrong(i8** %18, i8* null) #2
  ret void
}

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__copy_helper_block_ea8_32r(i8*, i8*) unnamed_addr #3 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>*
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>*
  %9 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %6, i32 0, i32 5
  %10 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %8, i32 0, i32 5
  %11 = load i8*, i8** %9, align 8
  %12 = bitcast i8** %10 to i8*
  call void @_Block_object_assign(i8* %12, i8* %11, i32 8) #2
  ret void
}

declare void @_Block_object_assign(i8*, i8*, i32)

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__destroy_helper_block_ea8_32r(i8*) unnamed_addr #3 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i8* %3 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>*
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, i8* }>* %4, i32 0, i32 5
  %6 = load i8*, i8** %5, align 8
  call void @_Block_object_dispose(i8* %6, i32 8) #2
  ret void
}

declare void @_Block_object_dispose(i8*, i32)

; Function Attrs: noinline optnone ssp uwtable
define void @_Z22testRetainCycleReleasev() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %2*, align 8
  %2 = alloca i8* // 指针
  %3 = alloca i32
  store %2* null, %2** %1, align 8 // 存 null
  %4 = call i8* @llvm.objc.autoreleasePoolPush() #2 //  %4 哨兵
  %5 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.30", align 8 //  %5  是 MNJBlockHolder 类对象
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %7 = bitcast %struct._class_t* %5 to i8*
  %8 = invoke i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %7, i8* %6)
          to label %9 unwind label %17

; <label>:9:                                      ; preds = %0
  %10 = bitcast i8* %8 to %2*
  %11 = load %2*, %2** %1, align 8
  store %2* %10, %2** %1, align 8 // 对象地址 赋值给 强引用变量
  %12 = bitcast %2* %11 to i8*
  call void @llvm.objc.release(i8* %12) #2, !clang.imprecise_release !9
  invoke void @objc_autoreleasePoolPop(i8* %4) // pop 哨兵%4
          to label %13 unwind label %17

; <label>:13:                                     ; preds = %9
  %14 = load %2*, %2** %1, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.32 to %0*), %2* %14)
          to label %15 unwind label %17

; <label>:15:                                     ; preds = %13
  %16 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %16, i8* null) #2
  ret void

; <label>:17:                                     ; preds = %13, %9, %0
  %18 = landingpad { i8*, i32 }
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %2, align 8
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %3, align 4
  %21 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %21, i8* null) #2
  br label %22

; <label>:22:                                     ; preds = %17
  %23 = load i8*, i8** %2, align 8
  %24 = load i32, i32* %3, align 4
  %25 = insertvalue { i8*, i32 } undef, i8* %23, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %24, 1
  resume { i8*, i32 } %26
}

; Function Attrs: nounwind
declare i8* @llvm.objc.autoreleasePoolPush() #2

; Function Attrs: nounwind
declare void @llvm.objc.release(i8*) #2

declare void @objc_autoreleasePoolPop(i8*)

; Function Attrs: noinline optnone ssp uwtable
define void @_Z15testRetainCyclev() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %2*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  %4 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.34 to %0*))
  store %2* null, %2** %1, align 8
  %5 = call i8* @llvm.objc.autoreleasePoolPush() #2
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.30", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = invoke i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
          to label %10 unwind label %36

; <label>:10:                                     ; preds = %0
  %11 = bitcast i8* %9 to %2*
  %12 = load %2*, %2** %1, align 8
  store %2* %11, %2** %1, align 8
  %13 = bitcast %2* %12 to i8*
  call void @llvm.objc.release(i8* %13) #2, !clang.imprecise_release !9
  %14 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 5
  %15 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %15, align 8
  %16 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 1
  store i32 -1040187392, i32* %16, align 8
  %17 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 2
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z15testRetainCyclev_block_invoke to i8*), i8** %18, align 8
  %19 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8*, i8*, i64 }* @"__block_descriptor_40_ea8_32s_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %19, align 8
  %20 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 5
  %21 = load %2*, %2** %1, align 8
  %22 = bitcast %2* %21 to i8*
  %23 = call i8* @llvm.objc.retain(i8* %22) #2
  %24 = bitcast i8* %23 to %2*
  store %2* %24, %2** %20, align 8
  %25 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4 to void ()*
  %26 = load %2*, %2** %1, align 8
  %27 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.38, align 8, !invariant.load !9
  %28 = bitcast %2* %26 to i8*
  invoke void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, void ()*)*)(i8* %28, i8* %27, void ()* %25)
          to label %29 unwind label %40

; <label>:29:                                     ; preds = %10
  %30 = bitcast %2** %14 to i8**
  call void @llvm.objc.storeStrong(i8** %30, i8* null) #2
  invoke void @objc_autoreleasePoolPop(i8* %5)
          to label %31 unwind label %36

; <label>:31:                                     ; preds = %29
  %32 = load %2*, %2** %1, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.40 to %0*), %2* %32)
          to label %33 unwind label %36

; <label>:33:                                     ; preds = %31
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.42 to %0*))
          to label %34 unwind label %36

; <label>:34:                                     ; preds = %33
  %35 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %35, i8* null) #2
  ret void

; <label>:36:                                     ; preds = %33, %31, %29, %0
  %37 = landingpad { i8*, i32 }
          cleanup
  %38 = extractvalue { i8*, i32 } %37, 0
  store i8* %38, i8** %2, align 8
  %39 = extractvalue { i8*, i32 } %37, 1
  store i32 %39, i32* %3, align 4
  br label %45

; <label>:40:                                     ; preds = %10
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %2, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %3, align 4
  %44 = bitcast %2** %14 to i8**
  call void @llvm.objc.storeStrong(i8** %44, i8* null) #2
  br label %45

; <label>:45:                                     ; preds = %40, %36
  %46 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %46, i8* null) #2
  br label %47

; <label>:47:                                     ; preds = %45
  %48 = load i8*, i8** %2, align 8
  %49 = load i32, i32* %3, align 4
  %50 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %51 = insertvalue { i8*, i32 } %50, i32 %49, 1
  resume { i8*, i32 } %51
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z15testRetainCyclev_block_invoke(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>** %3, align 8
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 5
  %6 = load %2*, %2** %5, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.36 to %0*), %2* %6)
  ret void
}

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__copy_helper_block_ea8_32s(i8*, i8*) unnamed_addr #3 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %9 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %6, i32 0, i32 5
  %10 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %8, i32 0, i32 5
  %11 = load %2*, %2** %9, align 8
  store %2* null, %2** %10, align 8
  %12 = bitcast %2** %10 to i8**
  %13 = bitcast %2* %11 to i8*
  call void @llvm.objc.storeStrong(i8** %12, i8* %13) #2
  ret void
}

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__destroy_helper_block_ea8_32s(i8*) unnamed_addr #3 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i8* %3 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 5
  %6 = bitcast %2** %5 to i8**
  call void @llvm.objc.storeStrong(i8** %6, i8* null) #2
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.objc.retain(i8*) #2

; Function Attrs: noinline optnone ssp uwtable
define void @_Z29testBreakRetainCycleUsingWeakv() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %2*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  %4 = alloca %2*, align 8
  %5 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.44 to %0*))
  store %2* null, %2** %1, align 8
  %6 = call i8* @llvm.objc.autoreleasePoolPush() #2
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.30", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = invoke i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %9, i8* %8)
          to label %11 unwind label %40

; <label>:11:                                     ; preds = %0
  %12 = bitcast i8* %10 to %2*
  %13 = load %2*, %2** %1, align 8
  store %2* %12, %2** %1, align 8
  %14 = bitcast %2* %13 to i8*
  call void @llvm.objc.release(i8* %14) #2, !clang.imprecise_release !9
  %15 = load %2*, %2** %1, align 8
  %16 = bitcast %2** %4 to i8**
  %17 = bitcast %2* %15 to i8*
  %18 = call i8* @llvm.objc.initWeak(i8** %16, i8* %17) #2
  %19 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 5
  %20 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %20, align 8
  %21 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 1
  store i32 -1040187392, i32* %21, align 8
  %22 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 2
  store i32 0, i32* %22, align 4
  %23 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z29testBreakRetainCycleUsingWeakv_block_invoke to i8*), i8** %23, align 8
  %24 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8*, i8*, i64 }* @"__block_descriptor_40_ea8_32w_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %24, align 8
  %25 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 5
  %26 = bitcast %2** %25 to i8**
  %27 = bitcast %2** %4 to i8**
  call void @llvm.objc.copyWeak(i8** %26, i8** %27) #2
  %28 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5 to void ()*
  %29 = load %2*, %2** %1, align 8
  %30 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.38, align 8, !invariant.load !9
  %31 = bitcast %2* %29 to i8*
  invoke void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, void ()*)*)(i8* %31, i8* %30, void ()* %28)
          to label %32 unwind label %44

; <label>:32:                                     ; preds = %11
  %33 = bitcast %2** %19 to i8**
  call void @llvm.objc.destroyWeak(i8** %33) #2
  %34 = bitcast %2** %4 to i8**
  call void @llvm.objc.destroyWeak(i8** %34) #2
  invoke void @objc_autoreleasePoolPop(i8* %6)
          to label %35 unwind label %40

; <label>:35:                                     ; preds = %32
  %36 = load %2*, %2** %1, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.48 to %0*), %2* %36)
          to label %37 unwind label %40

; <label>:37:                                     ; preds = %35
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.50 to %0*))
          to label %38 unwind label %40

; <label>:38:                                     ; preds = %37
  %39 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %39, i8* null) #2
  ret void

; <label>:40:                                     ; preds = %37, %35, %32, %0
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %2, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %3, align 4
  br label %50

; <label>:44:                                     ; preds = %11
  %45 = landingpad { i8*, i32 }
          cleanup
  %46 = extractvalue { i8*, i32 } %45, 0
  store i8* %46, i8** %2, align 8
  %47 = extractvalue { i8*, i32 } %45, 1
  store i32 %47, i32* %3, align 4
  %48 = bitcast %2** %19 to i8**
  call void @llvm.objc.destroyWeak(i8** %48) #2
  %49 = bitcast %2** %4 to i8**
  call void @llvm.objc.destroyWeak(i8** %49) #2
  br label %50

; <label>:50:                                     ; preds = %44, %40
  %51 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %51, i8* null) #2
  br label %52

; <label>:52:                                     ; preds = %50
  %53 = load i8*, i8** %2, align 8
  %54 = load i32, i32* %3, align 4
  %55 = insertvalue { i8*, i32 } undef, i8* %53, 0
  %56 = insertvalue { i8*, i32 } %55, i32 %54, 1
  resume { i8*, i32 } %56
}

; Function Attrs: nounwind
declare i8* @llvm.objc.initWeak(i8**, i8*) #2

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z29testBreakRetainCycleUsingWeakv_block_invoke(i8*) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*, align 8
  %4 = alloca i8*
  %5 = alloca i32
  store i8* %0, i8** %2, align 8
  %6 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %6, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>** %3, align 8
  %7 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %6, i32 0, i32 5
  %8 = bitcast %2** %7 to i8**
  %9 = call i8* @llvm.objc.loadWeakRetained(i8** %8) #2
  %10 = bitcast i8* %9 to %2*
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.46 to %0*), %2* %10)
          to label %11 unwind label %13

; <label>:11:                                     ; preds = %1
  %12 = bitcast %2* %10 to i8*
  call void @llvm.objc.release(i8* %12) #2, !clang.imprecise_release !9
  ret void

; <label>:13:                                     ; preds = %1
  %14 = landingpad { i8*, i32 }
          cleanup
  %15 = extractvalue { i8*, i32 } %14, 0
  store i8* %15, i8** %4, align 8
  %16 = extractvalue { i8*, i32 } %14, 1
  store i32 %16, i32* %5, align 4
  %17 = bitcast %2* %10 to i8*
  call void @llvm.objc.release(i8* %17) #2, !clang.imprecise_release !9
  br label %18

; <label>:18:                                     ; preds = %13
  %19 = load i8*, i8** %4, align 8
  %20 = load i32, i32* %5, align 4
  %21 = insertvalue { i8*, i32 } undef, i8* %19, 0
  %22 = insertvalue { i8*, i32 } %21, i32 %20, 1
  resume { i8*, i32 } %22
}

; Function Attrs: nounwind
declare i8* @llvm.objc.loadWeakRetained(i8**) #2

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__copy_helper_block_ea8_32w(i8*, i8*) unnamed_addr #3 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %9 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %6, i32 0, i32 5
  %10 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %8, i32 0, i32 5
  %11 = bitcast %2** %10 to i8**
  %12 = bitcast %2** %9 to i8**
  call void @llvm.objc.copyWeak(i8** %11, i8** %12) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.objc.copyWeak(i8**, i8**) #2

; Function Attrs: noinline ssp uwtable
define linkonce_odr hidden void @__destroy_helper_block_ea8_32w(i8*) unnamed_addr #3 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i8* %3 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  %5 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %4, i32 0, i32 5
  %6 = bitcast %2** %5 to i8**
  call void @llvm.objc.destroyWeak(i8** %6) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.objc.destroyWeak(i8**) #2

; Function Attrs: noinline optnone ssp uwtable
define void @_Z40testBreakRetainCycleUsingWeakStrongDancev() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %2*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  %4 = alloca %2*, align 8
  %5 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, align 8
  notail call void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.52 to %0*))
  store %2* null, %2** %1, align 8
  %6 = call i8* @llvm.objc.autoreleasePoolPush() #2
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.30", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = invoke i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %9, i8* %8)
          to label %11 unwind label %40

; <label>:11:                                     ; preds = %0
  %12 = bitcast i8* %10 to %2*
  %13 = load %2*, %2** %1, align 8
  store %2* %12, %2** %1, align 8
  %14 = bitcast %2* %13 to i8*
  call void @llvm.objc.release(i8* %14) #2, !clang.imprecise_release !9
  %15 = load %2*, %2** %1, align 8
  %16 = bitcast %2** %4 to i8**
  %17 = bitcast %2* %15 to i8*
  %18 = call i8* @llvm.objc.initWeak(i8** %16, i8* %17) #2
  %19 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 5
  %20 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 0
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %20, align 8
  %21 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 1
  store i32 -1040187392, i32* %21, align 8
  %22 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 2
  store i32 0, i32* %22, align 4
  %23 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 3
  store i8* bitcast (void (i8*)* @___Z40testBreakRetainCycleUsingWeakStrongDancev_block_invoke to i8*), i8** %23, align 8
  %24 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 4
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8*, i8*, i64 }* @"__block_descriptor_40_ea8_32w_e5_v8\01?0l" to %struct.__block_descriptor*), %struct.__block_descriptor** %24, align 8
  %25 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5, i32 0, i32 5
  %26 = bitcast %2** %25 to i8**
  %27 = bitcast %2** %4 to i8**
  call void @llvm.objc.copyWeak(i8** %26, i8** %27) #2
  %28 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %5 to void ()*
  %29 = load %2*, %2** %1, align 8
  %30 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.38, align 8, !invariant.load !9
  %31 = bitcast %2* %29 to i8*
  invoke void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (i8*, i8*, void ()*)*)(i8* %31, i8* %30, void ()* %28)
          to label %32 unwind label %44

; <label>:32:                                     ; preds = %11
  %33 = bitcast %2** %19 to i8**
  call void @llvm.objc.destroyWeak(i8** %33) #2
  %34 = bitcast %2** %4 to i8**
  call void @llvm.objc.destroyWeak(i8** %34) #2
  invoke void @objc_autoreleasePoolPop(i8* %6)
          to label %35 unwind label %40

; <label>:35:                                     ; preds = %32
  %36 = load %2*, %2** %1, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.56 to %0*), %2* %36)
          to label %37 unwind label %40

; <label>:37:                                     ; preds = %35
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.58 to %0*))
          to label %38 unwind label %40

; <label>:38:                                     ; preds = %37
  %39 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %39, i8* null) #2
  ret void

; <label>:40:                                     ; preds = %37, %35, %32, %0
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  store i8* %42, i8** %2, align 8
  %43 = extractvalue { i8*, i32 } %41, 1
  store i32 %43, i32* %3, align 4
  br label %50

; <label>:44:                                     ; preds = %11
  %45 = landingpad { i8*, i32 }
          cleanup
  %46 = extractvalue { i8*, i32 } %45, 0
  store i8* %46, i8** %2, align 8
  %47 = extractvalue { i8*, i32 } %45, 1
  store i32 %47, i32* %3, align 4
  %48 = bitcast %2** %19 to i8**
  call void @llvm.objc.destroyWeak(i8** %48) #2
  %49 = bitcast %2** %4 to i8**
  call void @llvm.objc.destroyWeak(i8** %49) #2
  br label %50

; <label>:50:                                     ; preds = %44, %40
  %51 = bitcast %2** %1 to i8**
  call void @llvm.objc.storeStrong(i8** %51, i8* null) #2
  br label %52

; <label>:52:                                     ; preds = %50
  %53 = load i8*, i8** %2, align 8
  %54 = load i32, i32* %3, align 4
  %55 = insertvalue { i8*, i32 } undef, i8* %53, 0
  %56 = insertvalue { i8*, i32 } %55, i32 %54, 1
  resume { i8*, i32 } %56
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @___Z40testBreakRetainCycleUsingWeakStrongDancev_block_invoke(i8*) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*, align 8
  %4 = alloca %2*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  store i8* %0, i8** %2, align 8
  %7 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %7, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>** %3, align 8
  %8 = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %2* }>* %7, i32 0, i32 5
  %9 = bitcast %2** %8 to i8**
  %10 = call i8* @llvm.objc.loadWeakRetained(i8** %9) #2
  %11 = bitcast i8* %10 to %2*
  store %2* %11, %2** %4, align 8
  %12 = load %2*, %2** %4, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.54 to %0*), %2* %12)
          to label %13 unwind label %15

; <label>:13:                                     ; preds = %1
  %14 = bitcast %2** %4 to i8**
  call void @llvm.objc.storeStrong(i8** %14, i8* null) #2
  ret void

; <label>:15:                                     ; preds = %1
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  store i8* %17, i8** %5, align 8
  %18 = extractvalue { i8*, i32 } %16, 1
  store i32 %18, i32* %6, align 4
  %19 = bitcast %2** %4 to i8**
  call void @llvm.objc.storeStrong(i8** %19, i8* null) #2
  br label %20

; <label>:20:                                     ; preds = %15
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

; Function Attrs: noinline optnone ssp uwtable
define void @_Z9testBlockv() #0 {
  call void @_Z22testRetainCycleReleasev()
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[MNJBlockHolder dealloc]"(%2*, i8*) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %2*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  %7 = alloca %struct._objc_super, align 8
  %8 = alloca %struct._objc_super, align 8
  store %2* %0, %2** %3, align 8
  store i8* %1, i8** %4, align 8
  %9 = load %2*, %2** %3, align 8
  invoke void (%0*, ...) @NSLog(%0* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.60 to %0*), %2* %9)
          to label %10 unwind label %18

; <label>:10:                                     ; preds = %2
  %11 = load %2*, %2** %3, align 8
  %12 = bitcast %2* %11 to i8*
  %13 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 0
  store i8* %12, i8** %13, align 8
  %14 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_", align 8
  %15 = bitcast %struct._class_t* %14 to i8*
  %16 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 1
  store i8* %15, i8** %16, align 8
  %17 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.62, align 8, !invariant.load !9
  call void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper2 to void (%struct._objc_super*, i8*)*)(%struct._objc_super* %7, i8* %17)
  ret void

; <label>:18:                                     ; preds = %2
  %19 = landingpad { i8*, i32 }
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %5, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %6, align 4
  %22 = load %2*, %2** %3, align 8
  %23 = bitcast %2* %22 to i8*
  %24 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %8, i32 0, i32 0
  store i8* %23, i8** %24, align 8
  %25 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_", align 8
  %26 = bitcast %struct._class_t* %25 to i8*
  %27 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %8, i32 0, i32 1
  store i8* %26, i8** %27, align 8
  %28 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.62, align 8, !invariant.load !9
  invoke void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper2 to void (%struct._objc_super*, i8*)*)(%struct._objc_super* %8, i8* %28)
          to label %29 unwind label %35

; <label>:29:                                     ; preds = %18
  br label %30

; <label>:30:                                     ; preds = %29
  %31 = load i8*, i8** %5, align 8
  %32 = load i32, i32* %6, align 4
  %33 = insertvalue { i8*, i32 } undef, i8* %31, 0
  %34 = insertvalue { i8*, i32 } %33, i32 %32, 1
  resume { i8*, i32 } %34

; <label>:35:                                     ; preds = %18
  %36 = landingpad { i8*, i32 }
          catch i8* null
  %37 = extractvalue { i8*, i32 } %36, 0
  call void @__clang_call_terminate(i8* %37) #6
  unreachable
}

declare i8* @objc_msgSendSuper2(%struct._objc_super*, i8*, ...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #5 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #2
  call void @_ZSt9terminatev() #6
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline optnone ssp uwtable
define internal void ()* @"\01-[MNJBlockHolder block]"(%2*, i8*) #0 {
  %3 = alloca %2*, align 8
  %4 = alloca i8*, align 8
  store %2* %0, %2** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load %2*, %2** %3, align 8
  %7 = bitcast %2* %6 to i8*
  %8 = tail call i8* @objc_getProperty(i8* %7, i8* %5, i64 8, i1 zeroext false)
  %9 = bitcast i8* %8 to void ()*
  ret void ()* %9
}

declare i8* @objc_getProperty(i8*, i8*, i64, i1)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[MNJBlockHolder setBlock:]"(%2*, i8*, void ()*) #0 {
  %4 = alloca %2*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void ()*, align 8
  store %2* %0, %2** %4, align 8
  store i8* %1, i8** %5, align 8
  store void ()* %2, void ()** %6, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = load %2*, %2** %4, align 8
  %9 = bitcast %2* %8 to i8*
  %10 = load void ()*, void ()** %6, align 8
  %11 = bitcast void ()* %10 to i8*
  call void @objc_setProperty_nonatomic_copy(i8* %9, i8* %7, i8* %11, i64 8)
  ret void
}

declare void @objc_setProperty_nonatomic_copy(i8*, i8*, i8*, i64)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[MNJBlockHolder .cxx_destruct]"(%2*, i8*) #0 {
  %3 = alloca %2*, align 8
  %4 = alloca i8*, align 8
  store %2* %0, %2** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load %2*, %2** %3, align 8
  %6 = bitcast %2* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 8
  %8 = bitcast i8* %7 to void ()**
  %9 = bitcast void ()** %8 to i8**
  call void @llvm.objc.storeStrong(i8** %9, i8* null) #2
  ret void
}

declare i32 @__gxx_personality_v0(...)

attributes #0 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noinline ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nonlazybind }
attributes #5 = { noinline noreturn nounwind }
attributes #6 = { noreturn nounwind }

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
