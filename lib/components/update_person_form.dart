import 'package:flutter/material.dart';

class UpdatePersonForm extends StatelessWidget {
  final Key? formKey;
  final TextEditingController? nameController;
  final TextEditingController? countryController;
  final String? Function(String?)? formValidator;
  final void Function()? onPressed;

  const UpdatePersonForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.countryController,
    required this.formValidator,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name'),
          TextFormField(
            controller: nameController,
            validator: formValidator,
          ),
          const SizedBox(height: 24.0),
          const Text('Home Country'),
          TextFormField(
            controller: countryController,
            validator: formValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
