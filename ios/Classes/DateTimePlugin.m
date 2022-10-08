#import "DateTimePlugin.h"
#if __has_include(<date_time_plugin/date_time_plugin-Swift.h>)
#import <date_time_plugin/date_time_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "date_time_plugin-Swift.h"
#endif

@implementation DateTimePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDateTimePlugin registerWithRegistrar:registrar];
}
//
//+(NSString *)stringFromDateTime:(NSString*)formatter dateTime:(NSDate*)dateTime{
//    return @"";
//}
@end
