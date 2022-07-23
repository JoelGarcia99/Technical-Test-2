import 'package:flutter/material.dart';
import 'package:technical_test/config/app_metadata.dart';
import 'package:technical_test/router/enum.routes.dart';
import 'package:technical_test/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppMetadata.appName,
	  initialRoute: RouteNames.home.path,
	  routes: appRoutes,
	  themeMode: ThemeMode.dark
    );
  }
}
