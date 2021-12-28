import 'package:hive_example/core/exports.dart';

class InfoScreenViewModel extends BaseViewModel {
  // Navigation logic
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToRoute(routeName, {arguments}) {
    _navigationService.navigateTo(routeName, arguments: arguments);
  }

  // Storage logic (Hive)
  late final Box contactBox;

  void initHiveBox() {
    // Get reference to an already opened box
    contactBox = Hive.box('peopleBox');
  }

  // Delete info from person box
  deleteInfo(int index) {
    contactBox.deleteAt(index);
    debugPrint('Item deleted from box at index: $index');
  }
}
