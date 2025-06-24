import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // Optional: Customize the init method name
  preferRelativeImports: true, // Optional: Use relative imports
  asExtension: false, // Optional: Generate as a standalone function
)
Future<void> configureInjection() async {
  await init(getIt);
}
