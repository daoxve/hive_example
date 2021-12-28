// CRUD

// **************************************************************************
// Is used for performing CRUD operations with Hive.
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CRUD extends StatefulWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  _CRUDState createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  late final Box box;

  // Add info to people box
  _addInfo() async {
    // Storing key-value pair
    box.put('name', 'John');
    box.put('country', 'Italy');
    debugPrint('Info added to box!');
  }

  // Read info from people box
  _getInfo() {
    var name = box.get('name');
    var country = box.get('country');
    debugPrint('Info retrieved from box: $name ($country)');
  }

  // Update info of people box
  _updateInfo() {
    box.put('name', 'Mike');
    box.put('country', 'United States');
    debugPrint('Info updated in box!');
  }

  // Delete info from people box
  _deleteInfo() {
    box.delete('name');
    box.delete('country');
    debugPrint('Info deleted from box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  // ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('People Info'),
        elevation: 0.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _addInfo,
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: _getInfo,
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: _updateInfo,
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: _deleteInfo,
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
