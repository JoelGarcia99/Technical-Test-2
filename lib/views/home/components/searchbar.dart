import 'package:flutter/material.dart';

/// Basic searchbar for the home screen
class SearchBar extends StatelessWidget {

  const SearchBar({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.all(12.0),
			decoration: BoxDecoration(
				border: Border.all(
					color: Colors.grey,
					width: 0.5
				),
				borderRadius: BorderRadius.circular(8.0)
			),
			child: Row(
				children: const [
					Icon(Icons.search, color: Colors.white),
					SizedBox(width: 15.0),
					Text(
						"Finding immobility",
						style: TextStyle(
							color: Colors.grey
						)
					)
				]
			)
		);
	}
}
