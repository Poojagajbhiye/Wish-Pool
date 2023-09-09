import 'package:in_app_update/in_app_update.dart';

Future<void> checkForAppUpdate() async {
  InAppUpdate.checkForUpdate().then((updateInfo) {
    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      if (updateInfo.immediateUpdateAllowed) {
        InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
          if (appUpdateResult == AppUpdateResult.success) {
            print(appUpdateResult);
            // Snackbar
          }
        });
      }
      //   } else if (updateInfo.flexibleUpdateAllowed) {
      //     //Perform flexible update
      //     InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
      //       if (appUpdateResult == AppUpdateResult.success) {
      //         //App Update successful
      //         InAppUpdate.completeFlexibleUpdate();
      //       }
      //     });
      //   }
    }
  });
}
