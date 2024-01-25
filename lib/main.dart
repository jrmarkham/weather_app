import 'package:flutter/material.dart';
import 'src/globals.dart';
import 'main_common.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Globals.initConfigurations().then((_) async => mainCommon());
}
