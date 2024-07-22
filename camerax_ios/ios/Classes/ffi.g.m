#include <stdint.h>

#import "../../src/camerax_ios.h"

typedef void  (^ListenerBlock)(NSDictionary* , struct _NSRange , BOOL * );
ListenerBlock wrapListenerBlock_ObjCBlock_ffiVoid_NSDictionary_NSRange_bool(ListenerBlock block) {
  ListenerBlock wrapper = [^void(NSDictionary* arg0, struct _NSRange arg1, BOOL * arg2) {
    block([arg0 retain], arg1, arg2);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock1)(id , struct _NSRange , BOOL * );
ListenerBlock1 wrapListenerBlock_ObjCBlock_ffiVoid_objcObjCObject_NSRange_bool(ListenerBlock1 block) {
  ListenerBlock1 wrapper = [^void(id arg0, struct _NSRange arg1, BOOL * arg2) {
    block([arg0 retain], arg1, arg2);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock2)(NSTimer* );
ListenerBlock2 wrapListenerBlock_ObjCBlock_ffiVoid_NSTimer(ListenerBlock2 block) {
  ListenerBlock2 wrapper = [^void(NSTimer* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock3)(NSFileHandle* );
ListenerBlock3 wrapListenerBlock_ObjCBlock_ffiVoid_NSFileHandle(ListenerBlock3 block) {
  ListenerBlock3 wrapper = [^void(NSFileHandle* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock4)(NSError* );
ListenerBlock4 wrapListenerBlock_ObjCBlock_ffiVoid_NSError(ListenerBlock4 block) {
  ListenerBlock4 wrapper = [^void(NSError* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock5)(NSDictionary* , NSError* );
ListenerBlock5 wrapListenerBlock_ObjCBlock_ffiVoid_NSDictionary_NSError(ListenerBlock5 block) {
  ListenerBlock5 wrapper = [^void(NSDictionary* arg0, NSError* arg1) {
    block([arg0 retain], [arg1 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock6)(NSArray* );
ListenerBlock6 wrapListenerBlock_ObjCBlock_ffiVoid_NSArray(ListenerBlock6 block) {
  ListenerBlock6 wrapper = [^void(NSArray* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock7)(NSTextCheckingResult* , NSMatchingFlags , BOOL * );
ListenerBlock7 wrapListenerBlock_ObjCBlock_ffiVoid_NSTextCheckingResult_NSMatchingFlags_bool(ListenerBlock7 block) {
  ListenerBlock7 wrapper = [^void(NSTextCheckingResult* arg0, NSMatchingFlags arg1, BOOL * arg2) {
    block([arg0 retain], arg1, arg2);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock8)(NSCachedURLResponse* );
ListenerBlock8 wrapListenerBlock_ObjCBlock_ffiVoid_NSCachedURLResponse(ListenerBlock8 block) {
  ListenerBlock8 wrapper = [^void(NSCachedURLResponse* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock9)(NSURLResponse* , NSData* , NSError* );
ListenerBlock9 wrapListenerBlock_ObjCBlock_ffiVoid_NSURLResponse_NSData_NSError(ListenerBlock9 block) {
  ListenerBlock9 wrapper = [^void(NSURLResponse* arg0, NSData* arg1, NSError* arg2) {
    block([arg0 retain], [arg1 retain], [arg2 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock10)(NSDictionary* );
ListenerBlock10 wrapListenerBlock_ObjCBlock_ffiVoid_NSDictionary(ListenerBlock10 block) {
  ListenerBlock10 wrapper = [^void(NSDictionary* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock11)(NSURLCredential* );
ListenerBlock11 wrapListenerBlock_ObjCBlock_ffiVoid_NSURLCredential(ListenerBlock11 block) {
  ListenerBlock11 wrapper = [^void(NSURLCredential* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock12)(NSArray* , NSArray* , NSArray* );
ListenerBlock12 wrapListenerBlock_ObjCBlock_ffiVoid_NSArray_NSArray_NSArray(ListenerBlock12 block) {
  ListenerBlock12 wrapper = [^void(NSArray* arg0, NSArray* arg1, NSArray* arg2) {
    block([arg0 retain], [arg1 retain], [arg2 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock13)(NSArray* );
ListenerBlock13 wrapListenerBlock_ObjCBlock_ffiVoid_NSArray1(ListenerBlock13 block) {
  ListenerBlock13 wrapper = [^void(NSArray* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock14)(NSData* );
ListenerBlock14 wrapListenerBlock_ObjCBlock_ffiVoid_NSData(ListenerBlock14 block) {
  ListenerBlock14 wrapper = [^void(NSData* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock15)(NSData* , BOOL , NSError* );
ListenerBlock15 wrapListenerBlock_ObjCBlock_ffiVoid_NSData_bool_NSError(ListenerBlock15 block) {
  ListenerBlock15 wrapper = [^void(NSData* arg0, BOOL arg1, NSError* arg2) {
    block([arg0 retain], arg1, [arg2 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock16)(NSURLSessionWebSocketMessage* , NSError* );
ListenerBlock16 wrapListenerBlock_ObjCBlock_ffiVoid_NSURLSessionWebSocketMessage_NSError(ListenerBlock16 block) {
  ListenerBlock16 wrapper = [^void(NSURLSessionWebSocketMessage* arg0, NSError* arg1) {
    block([arg0 retain], [arg1 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock17)(NSData* , NSURLResponse* , NSError* );
ListenerBlock17 wrapListenerBlock_ObjCBlock_ffiVoid_NSData_NSURLResponse_NSError(ListenerBlock17 block) {
  ListenerBlock17 wrapper = [^void(NSData* arg0, NSURLResponse* arg1, NSError* arg2) {
    block([arg0 retain], [arg1 retain], [arg2 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock18)(NSURL* , NSURLResponse* , NSError* );
ListenerBlock18 wrapListenerBlock_ObjCBlock_ffiVoid_NSURL_NSURLResponse_NSError(ListenerBlock18 block) {
  ListenerBlock18 wrapper = [^void(NSURL* arg0, NSURLResponse* arg1, NSError* arg2) {
    block([arg0 retain], [arg1 retain], [arg2 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock19)(ZoomState* );
ListenerBlock19 wrapListenerBlock_ObjCBlock_ffiVoid_ZoomState(ListenerBlock19 block) {
  ListenerBlock19 wrapper = [^void(ZoomState* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock20)(TorchState* );
ListenerBlock20 wrapListenerBlock_ObjCBlock_ffiVoid_TorchState(ListenerBlock20 block) {
  ListenerBlock20 wrapper = [^void(TorchState* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock21)(ImageProxy* );
ListenerBlock21 wrapListenerBlock_ObjCBlock_ffiVoid_ImageProxy(ListenerBlock21 block) {
  ListenerBlock21 wrapper = [^void(ImageProxy* arg0) {
    block([arg0 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock22)(NSData* , NSError* );
ListenerBlock22 wrapListenerBlock_ObjCBlock_ffiVoid_NSData_NSError(ListenerBlock22 block) {
  ListenerBlock22 wrapper = [^void(NSData* arg0, NSError* arg1) {
    block([arg0 retain], [arg1 retain]);
  } copy];
  [block release];
  return wrapper;
}

typedef void  (^ListenerBlock23)(NSString* , NSError* );
ListenerBlock23 wrapListenerBlock_ObjCBlock_ffiVoid_NSString_NSError(ListenerBlock23 block) {
  ListenerBlock23 wrapper = [^void(NSString* arg0, NSError* arg1) {
    block([arg0 retain], [arg1 retain]);
  } copy];
  [block release];
  return wrapper;
}
