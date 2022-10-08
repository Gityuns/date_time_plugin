package com.example.date_time_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.util.*
import kotlin.collections.HashMap

/** DateTimePlugin */
class DateTimePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "date_time_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "stringFromNow") {
      stringFromNow(call.arguments as String,result);
    }else if (call.method == "stringFromDateTime")  {
      var params = call.arguments as HashMap<String, String>;
      var format = params.getValue("formatter");
      var dateTime = params.getValue("dateTime");
      stringFromDateTime(dateTime,format,result);
    }else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun stringFromNow(@NonNull  formatter:String, @NonNull result: Result){
    var dateFormat = SimpleDateFormat(formatter);
    var dateTime = dateFormat.format(Date());
    result.success(dateTime);
  }

  private fun stringFromDateTime(dateTime:String, format:String, result: Result){
    var dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    var date = dateFormat.parse(dateTime);
    var newDateFormat = SimpleDateFormat(format);
    var time = newDateFormat.format(date);
    result.success(time);
  }
}

