/// Route names to work with on the whole application.
enum RouteNames {
	wrapper, // Entry point of the application.
	home,
	revenue,
	location,
	calendar,
	notFound
}

/// Extension to get a user friendly route based on the
/// enums defined above.
extension StringNames on RouteNames {
	/// Gets an url like path
	String get path {
		switch(this) {
			case RouteNames.notFound:
				return '/404';
			case RouteNames.wrapper:
				return '/boot';
			case RouteNames.home:
				return '/home';
			case RouteNames.revenue:
				return '/revenue';
			case RouteNames.location:
				return '/location';
			case RouteNames.calendar:
				return '/calendar';
		}
	}
}
