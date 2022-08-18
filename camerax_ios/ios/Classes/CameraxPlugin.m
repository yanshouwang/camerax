#import "CameraxPlugin.h"
#if __has_include(<camerax/camerax-Swift.h>)
#import <camerax/camerax-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "camerax-Swift.h"
#endif

@implementation CameraxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCameraxPlugin registerWithRegistrar:registrar];
}
@end
