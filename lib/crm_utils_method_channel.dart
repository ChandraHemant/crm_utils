import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'crm_utils_platform_interface.dart';

/// An implementation of [CrmUtilsPlatform] that uses method channels.
class MethodChannelCrmUtils extends CrmUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('crm_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
