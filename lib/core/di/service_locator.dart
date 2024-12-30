import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await serviceLocator.init();
}
