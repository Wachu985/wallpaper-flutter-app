import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/dependency_inyection/dependency_inyection.dart';

void main() async {
  await DependencyInyection.init();
  runApp(const MyApp());
}
