import 'package:flutter/material.dart';

/// Basic class to setup the theme of the application.
/// This should be used as an inteface
abstract class ThemeDefinition {
  late final Color backgroundColor;
  late final Color secondaryColor;
}

/// custom dark theme based on the default Flutter dark theme
class _CustomDarkTheme implements ThemeDefinition {

  @override
  get backgroundColor =>const Color(0xff023535);

  @override
  set backgroundColor(Color backgroundColor) {
	this.backgroundColor = backgroundColor;
  }

  @override
  Color secondaryColor = Colors.grey;
}

/// custom light theme based on the default Flutter light theme
class _CustomLightTheme implements ThemeDefinition {
  @override
  get backgroundColor =>const Color(0xff023535);

  @override
  set backgroundColor(Color backgroundColor) {
	this.backgroundColor = backgroundColor;
  }

  @override
  Color secondaryColor = const Color(0xff9AEBA3);
}

abstract class AppTheme {

	static final ThemeDefinition _darkTheme = _CustomDarkTheme();
	static final ThemeDefinition _lightTheme = _CustomLightTheme();

	/// Since the class does not need more than one instance we
	/// can use singleton pattern to avoid memory leaks.

  static ThemeDefinition getTheme({bool isDarkTheme = true}) {
    return isDarkTheme ? _darkTheme : _lightTheme;
  }
}
