import 'package:hive_example/core/exports.dart';
import 'package:hive_example/components/add_person_form.dart';

import 'add_screen_viewmodel.dart';

class AddScreenView extends StatelessWidget {
  const AddScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddScreenViewModel>.reactive(
      viewModelBuilder: () => AddScreenViewModel(),
      onModelReady: (model) => model.initHiveBox(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Add Info'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddPersonForm(
            formKey: model.personFormKey,
            onPressed: () => model.validateFormActions(Routes.infoScreenView),
            nameController: model.nameController,
            countryController: model.countryController,
            formValidator: model.fieldValidator,
          ),
        ),
      ),
    );
  }
}
