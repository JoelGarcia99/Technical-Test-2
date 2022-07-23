import 'package:flutter/material.dart';
import 'package:technical_test/config/custom_theme.dart';

/// Shows a basic description for an user action
class DataDescriptor extends StatelessWidget {

	/// Main content of the descriptor
	final String message;
	/// A small text to show under the main content
	final String subtitle;
	/// Icon to show prev to the subtitle
	final IconData subtitleIcon;

  const DataDescriptor({
	  Key? key,
	  required this.message,
	  required this.subtitle,
	  required this.subtitleIcon
  }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.symmetric(
				horizontal: 16.0,
				vertical:  22.0
			),
			decoration: BoxDecoration(
				color: AppTheme.getTheme().secondaryColor,
				borderRadius: BorderRadius.circular(8.0)
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
			  children: [
			    Text(
			    	message,
			    	style: const TextStyle(
			    		color: Colors.black,
			    		fontSize: 24.0,
			    		fontWeight: FontWeight.w600
			    	),
			    ),
				const SizedBox(height: 15.0),
				Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
						Icon(subtitleIcon),
						Text(
							subtitle,
							style: const TextStyle(
								fontSize: 12.0
							)
						)
					],
				)
			  ],
			),
		);
	}
}
