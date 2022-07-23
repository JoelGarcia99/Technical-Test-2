import 'package:flutter/material.dart';

/// Render a custom listtile
class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;

  const CustomListTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
		mainAxisAlignment: MainAxisAlignment.spaceBetween,
		children: [
      ClipRRect(
		  borderRadius: BorderRadius.circular(8),
		  child: icon
		),
	  const SizedBox(width: 15.0),
      Expanded(
        child: Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey.withOpacity(0.1),
          child:
              const Icon(Icons.location_on, size: 16.0, color: Colors.white)),
    ]);
  }
}
