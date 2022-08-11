import 'package:flutter/material.dart';
import 'package:recipes_app/src/app.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();

  runApp(App(
    store: DI.store,
  ));
}
