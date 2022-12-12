import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateAppManager {
  UpdateAppManager._();

  factory UpdateAppManager() => _instance;

  static final UpdateAppManager _instance = UpdateAppManager._();

  void init() async {
    debugPrint("=> Init UpdateAppManager");
  }

  void update() async {
    debugPrint("UpdateAppManager - Getting update");
    if (Platform.isAndroid) {
      try {
        InAppUpdate.checkForUpdate().then((info) {
          if (info.updateAvailability == UpdateAvailability.updateAvailable) {
            InAppUpdate.performImmediateUpdate();
          }
        });
      } on Exception catch (error, trace) {}
    }
  }
}
