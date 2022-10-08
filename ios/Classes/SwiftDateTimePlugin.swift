import Flutter
import UIKit

public class SwiftDateTimePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "date_time_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftDateTimePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      print(#function)
      if call.method == "stringFromNow" {
          let arguments = call.arguments as! String
          stringFromNow(arguments,result: result)
      }
      if call.method == "stringFromDateTime" {
          let arguments = call.arguments as! [String:String]
          let formatter = arguments["formatter"]!
          let dateTime = arguments["dateTime"]!
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          let date  = dateFormatter.date(from: dateTime)!
          stringFromDateTime(date, formatter: formatter, result: result)
      }
    result("iOS " + "UIDevice.current.systemVersion")
  }
    
    public func stringFromDateTime(_ date:Date,formatter:String, result: @escaping FlutterResult){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        result(dateFormatter.string(from:date))
    }
    
    public func stringFromNow(_ formatter:String, result: @escaping FlutterResult){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        result(dateFormatter.string(from:date))
    }

}
