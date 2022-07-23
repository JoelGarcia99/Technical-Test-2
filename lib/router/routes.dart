import 'package:flutter/material.dart';
import 'package:technical_test/router/enum.routes.dart';
import 'package:technical_test/views/home/home.dart';
import 'package:technical_test/views/not_found/not_found.dart';
import 'package:technical_test/views/revenue/revenue.dart';

/// Here will be the definitions for all the routes used in the
/// whole application
Map<String, Widget Function(BuildContext)> appRoutes = {
	RouteNames.notFound.path: (context) => const NotFound(),
	RouteNames.home.path: (context) => HomeScreen(),
	RouteNames.revenue.path: (context) => const Revenue()
};
