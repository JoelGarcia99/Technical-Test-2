import 'package:flutter/material.dart';

import 'package:technical_test/config/custom_theme.dart';
import 'package:technical_test/router/enum.routes.dart';
import 'package:technical_test/views/common/bottom_menu.dart';
import 'package:technical_test/views/home/components/custom_listtile.dart';
import 'package:technical_test/views/home/components/data_descriptor.dart';
import 'package:technical_test/views/home/components/header.dart';
import 'package:technical_test/views/home/components/searchbar.dart';

/// Entry point of the application
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  /// contains some general colors for the app such as primary and
  /// secondary colors
  final theme = AppTheme.getTheme();

  // random image url
  final userImageUrl = "https://picsum.photos/200/300";

  /// corresponds to a small gap between components
  final smallGap = const SizedBox(height: 12.0);

  /// corresponds to a medium gap between components
  final mediumGap = const SizedBox(height: 32.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.backgroundColor,
        bottomNavigationBar: CustomBottomMenu(route: RouteNames.home),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                _getHeader(),
                smallGap,
                _getDescriptor(),
                mediumGap,
                _getBody(),
                mediumGap // a gap between the content and the bottom menu
              ]),
            )
		)
	);
  }

  /// All the main content (objects) of the app
  Widget _getBody() {
    return Column(
      children: [
        const SearchBar(),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text("Last Seen Objects",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            Text("See all",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300))
          ],
        ),
        mediumGap,
        // Generating 6 random items
        ...List<Widget>.generate(6, (index) {
          // searching a random image on the internet
          final imageUrl = "https://picsum.photos/id/${index + 1}/200/200";

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomListTile(
              icon: Image.network(imageUrl,
                  fit: BoxFit.cover, width: 50.0, height: 50.0),
              title: "Object $index",
              subtitle: "Object $index subtitle",
            ),
          );
        })
      ],
    );
  }

  /// Shows an offer for the current user
  DataDescriptor _getDescriptor() {
    return const DataDescriptor(
        message: "Replaces 10+ tools\nsaving you 50% of time",
        subtitle: "Use promo code XXXXXX",
        subtitleIcon: Icons.bolt);
  }

  /// Shows the header of the home screen
  SafeArea _getHeader() {
    return SafeArea(
        child: HomeHeader(name: "Joel Garcia", imageUrl: userImageUrl));
  }
}
