import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'crm_utils_method_channel.dart';

abstract class CrmUtilsPlatform extends PlatformInterface {
  /// Constructs a CrmUtilsPlatform.
  CrmUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CrmUtilsPlatform _instance = MethodChannelCrmUtils();

  /// The default instance of [CrmUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCrmUtils].
  static CrmUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CrmUtilsPlatform] when
  /// they register themselves.
  static set instance(CrmUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
