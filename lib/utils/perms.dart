import 'package:permission_handler/permission_handler.dart';

/// Singleton class to handle required Android permissions for network and phone state access.
class PermissionManager {
  PermissionManager._();
  static final PermissionManager _instance = PermissionManager._();
  static PermissionManager get instance => _instance;

  /// Requests all necessary permissions for network and phone state access.
  Future<Map<Permission, PermissionStatus>> requestAllPermissions() async {
    final permissions = [
      Permission.phone,
    ];
    return await permissions.request();
  }

  /// Checks if all required permissions are granted.
  Future<bool> hasAllPermissions() async {
    final statuses = await requestAllPermissions();
    return statuses.values.every((status) => status.isGranted);
  }
}
