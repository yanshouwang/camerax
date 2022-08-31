#import "CameraxIosPlugin.h"
#if __has_include(<camerax_ios/camerax_ios-Swift.h>)
#import <camerax_ios/camerax_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "camerax_ios-Swift.h"
#endif

@implementation CameraxIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCameraxIosPlugin registerWithRegistrar:registrar];
}
@end
