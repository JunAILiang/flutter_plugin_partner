#import "FlutterPluginCsjPlugin.h"
#import <flutter_plugin_csj/flutter_plugin_csj-Swift.h>

@implementation FlutterPluginCsjPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginCsjPlugin registerWithRegistrar:registrar];
}
@end
