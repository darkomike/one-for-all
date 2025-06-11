import 'dart:developer';

import 'package:one_for_all_platform/network/model/network_info.dart';
import 'package:one_for_all_platform/one_for_all_platform_interface.dart';
import 'package:one_for_all_platform/utils/perms.dart';

class Network {
  Network._();
  static final Network _instance = Network._();
  static Network get instance => _instance;
  Future<NetworkInfo> getNetworkInfo() async {
    log('Network Info: Getting network info');
    final hasAllPermissions =
        await PermissionManager.instance.hasAllPermissions();
    log('Network Info: Has all permissions: $hasAllPermissions');
    if (hasAllPermissions) {
      return OneForAllPlatform.instance.getNetworkInfo();
    } else {
      return NetworkInfo();
    }
  }
}
