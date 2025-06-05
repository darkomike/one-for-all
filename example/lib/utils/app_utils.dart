

import 'dart:developer' as developer;

lg(String message, {String? name}) {
  developer.log(message, name: name ?? 'AppUtils');
}

