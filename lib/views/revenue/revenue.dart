import 'package:flutter/material.dart';
import 'package:technical_test/config/custom_theme.dart';
import 'package:technical_test/router/enum.routes.dart';
import 'package:technical_test/views/common/bottom_menu.dart';
import 'package:technical_test/views/revenue/components/current_month_chart.dart';

/// Revenue main screen
class Revenue extends StatelessWidget {
  const Revenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        bottomNavigationBar: CustomBottomMenu(route: RouteNames.revenue),
        body: SingleChildScrollView(
            child: Column(
				children: [
					_getHeader(context),
					const CurrentMonthChart(),
					_body(),
				]
			)
		)
	);
  }

  /// Body containing a line chart with the current month's revenue
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text("Current shows",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
                Text("Week",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300))
              ],
            ),
		  const SizedBox(height: 30.0),
		  Container(
			  width: double.infinity,
			  height: 200.0,
			  decoration: BoxDecoration(
				  color: Colors.grey.withOpacity(0.2),
				  borderRadius:  BorderRadius.circular(10.0)
			  )
		  )
        ],
      ),
    );
  }

  /// Gets a basic header for the current page
  Widget _getHeader(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          child: Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				_customButton(Icons.chevron_left, ()=>Navigator.pop(context)),
				const Text(
					"Revenue",
					style: TextStyle(color: Colors.white, fontSize: 20.0)
				),
				_customButton(Icons.more_horiz),
			]
		)
	  ),
    );
  }

  /// Custom button with an opacity on its background
  Container _customButton(IconData icon, [void Function()? onPressed]) {
    return Container(
	  decoration: BoxDecoration(
		color: Colors.grey.withOpacity(0.1),
		borderRadius: BorderRadius.circular(10.0),
	  ),
	  padding: const EdgeInsets.all(10.0),
	  child: GestureDetector(
		onTap: onPressed ?? () {},
		child: Center(
			child: Icon(icon, color: Colors.white)
		),
	  ),
	);
  }
}
