/// This file is a part of Harmonoid (https://github.com/harmonoid/harmonoid).
///
/// Copyright © 2020-2022, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
/// All rights reserved.
///
/// Use of this source code is governed by the End-User License Agreement for Harmonoid that can be found in the EULA.txt file.
///

import 'package:flutter/services.dart';

import 'package:harmonoid/core/intent.dart';

const _kMethodChannelName =
    'com.alexmercerind.harmonoid/argument_vector_handler';

/// ArgumentVectorHandler
/// ---------------------
/// Responsible for maintaining single instance of Harmonoid on Windows
/// and Linux & handling opening of files from File Explorer.
///
/// Currently only first argument of the `argv` is sent through the
/// [_kMethodChannelName] & passed to [Intent.playUri].
///
abstract class ArgumentVectorHandler {
  static void initialize() {
    const MethodChannel(_kMethodChannelName).setMethodCallHandler((call) async {
      Intent.instance.playUri(Uri.file(call.arguments));
    });
  }
}
