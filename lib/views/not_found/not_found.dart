import 'package:flutter/material.dart';
import 'package:technical_test/config/custom_theme.dart';
import 'package:technical_test/router/enum.routes.dart';
import 'package:technical_test/views/common/bottom_menu.dart';

/// A screen to render when a certain route is not 
/// developed yet.
class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppTheme.getTheme().backgroundColor,
			bottomNavigationBar: CustomBottomMenu(route: RouteNames.notFound),
			body: const Center(
				child: Text(
					'This page is under development',
					style: TextStyle(
						fontSize: 18.0,
						color: Colors.white,
						fontWeight: FontWeight.w600
					),
				),
			),
		);
	}
}
