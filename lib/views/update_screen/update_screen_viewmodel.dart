import 'package:hive_example/core/exports.dart';

class UpdateScreenViewModel extends BaseViewModel {
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
  // late final int index;
  // late final Person? person;

  void initHiveBox(person) {
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
    // Show the current values
    nameController = TextEditingController(text: person!.name);
    countryController = TextEditingController(text: person!.country);
  }

  // Update info of people box
  _updateInfo(index) async {
    Person newPerson = Person(
      name: nameController.text,
      country: countryController.text,
    );
    box.putAt(index, newPerson);
    debugPrint('Info updated in box!');
  }

  // Form logic
  var nameController = TextEditingController();
  var countryController = TextEditingController();
  final personFormKey = GlobalKey<FormState>();

  //* Validate form
  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  void validateFormActions(index) {
    if (personFormKey.currentState!.validate()) {
      _updateInfo(index);
      _navigationService.back();
    }
  }
}
