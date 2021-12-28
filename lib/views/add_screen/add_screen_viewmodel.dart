import 'package:hive_example/core/exports.dart';

class AddScreenViewModel extends BaseViewModel {
  // Navigation logic
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToRoute(routeName) {
    _navigationService.navigateTo(routeName);
  }

  // Storage logic (Hive)
  late final Box box;

  void initHiveBox() {
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
  }

  // Add info to people box
  _addInfo() async {
    Person newPerson = Person(
      name: nameController.text,
      country: countryController.text,
    );
    box.add(newPerson);
    debugPrint('Info added to box!');
  }

  // Form logic
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final personFormKey = GlobalKey<FormState>();

  //* Validate form
  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  void validateFormActions(routeName) {
    if (personFormKey.currentState!.validate()) {
      _addInfo();
      _navigationService.navigateTo(routeName);
    }
  }
}
