
import 'package:hive_example/core/exports.dart';

import 'info_screen_viewmodel.dart';

class InfoScreenView extends StatelessWidget {
  const InfoScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InfoScreenViewModel>.reactive(
      viewModelBuilder: () => InfoScreenViewModel(),
      onModelReady: (model) => model.initHiveBox(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('People Info'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigateBack(),
          child: const Icon(Icons.add),
        ),
        body: ValueListenableBuilder(
          valueListenable: model.contactBox.listenable(),
          builder: (context, Box box, widget) {
            return box.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      var currentBox = box;
                      var personData = currentBox.getAt(index)!;
                      return InkWell(
                        onTap: () => model.navigateToRoute(
                          Routes.updateScreenView,
                          arguments: UpdateScreenViewArguments(
                            index: index,
                            person: personData,
                          ),
                        ),
                        child: ListTile(
                          title: Text(personData.name),
                          subtitle: Text(personData.country),
                          trailing: IconButton(
                            onPressed: () => model.deleteInfo(index),
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
