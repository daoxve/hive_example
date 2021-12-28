import 'package:hive_example/core/exports.dart';
import 'package:hive_example/components/update_person_form.dart';

import 'update_screen_viewmodel.dart';

class UpdateScreenView extends StatelessWidget {
  final int index;
  final Person person;

  const UpdateScreenView({
    Key? key,
    required this.index,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateScreenViewModel>.reactive(
      viewModelBuilder: () => UpdateScreenViewModel(),
      onModelReady: (model) => model.initHiveBox(person),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Update Info'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UpdatePersonForm(
            formKey: model.personFormKey,
            onPressed: () => model.validateFormActions(index),
            nameController: model.nameController,
            countryController: model.countryController,
            formValidator: model.fieldValidator,
          ),
        ),
      ),
    );
  }
}
