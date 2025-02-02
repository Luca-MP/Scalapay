import 'package:injectable/injectable.dart';
import 'package:scalapay/injection.config.dart';

import 'main.dart';

@InjectableInit(
  initializerName:'init',
  preferRelativeImports: true,
  asExtension: true
)
void configureDependencies() => getIt.init();
