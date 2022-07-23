import 'package:flutter/material.dart';

/// Header component for the home screen to show basic information
/// about the user in the session
class HomeHeader extends StatelessWidget {
  /// The name of the user
  final String name;
  /// The photo url of the current user
  final String imageUrl;

  /// width, height, and radius of the user image
  final double imageSize = 50.0;

  /// Small text showed above the user name
  final double smallFontSize = 14.0;

  /// text size for the user name
  final double largeFontSize = 18.0;

  const HomeHeader({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Hello,",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: smallFontSize,
                      fontWeight: FontWeight.w300)),
              Text(name.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: largeFontSize,
                      fontWeight: FontWeight.w600))
            ]),
            ClipRRect(
				borderRadius: BorderRadius.circular(imageSize),
				child: Image.network(
					imageUrl,
					fit: BoxFit.cover,
					width: imageSize,
					height: imageSize
				)
			),
          ],
        ));
  }
}
