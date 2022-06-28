#import "ImageTilePlugin.h"
#if __has_include(<image_tile/image_tile-Swift.h>)
#import <image_tile/image_tile-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "image_tile-Swift.h"
#endif

@implementation ImageTilePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImageTilePlugin registerWithRegistrar:registrar];
}
@end
