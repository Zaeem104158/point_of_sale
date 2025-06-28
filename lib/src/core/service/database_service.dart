import 'package:path_provider/path_provider.dart';
import 'package:point_of_sale/objectbox.g.dart';

class ObjectBoxService {
  late final Store store;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: '${dir.path}/objectbox');
  }

  void close() => store.close();
}
