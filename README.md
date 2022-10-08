# date_time_plugin

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Example:

    // 如 2022-10-08 12:12
    DateTimePlugin().stringFromDateTime("yyyy-MM-dd HH:mm", DateTime.now())

    // 如 2022年10月08日
    DateTimePlugin().stringFromDateTime("yyyy年MM月dd日", DateTime.now())
