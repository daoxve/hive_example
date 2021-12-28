
import 'package:hive_example/core/exports.dart';

import 'package:hive_example/views/add_screen/add_screen_view.dart';
import 'package:hive_example/views/info_screen/info_screen_view.dart';
import 'package:hive_example/views/update_screen/update_screen_view.dart';


@StackedApp(
  routes: [
    CupertinoRoute(page: AddScreenView, initial: true),
    CupertinoRoute(page: InfoScreenView),
    CupertinoRoute(page: UpdateScreenView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}