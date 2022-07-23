import 'dart:math';

import 'package:flutter/material.dart';
import 'package:technical_test/config/custom_theme.dart';

/// A ring chart that will show the current month's revenue.
class CurrentMonthChart extends StatelessWidget {

  const CurrentMonthChart({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {

		final size = MediaQuery.of(context).size;

		return Padding(
		  padding: const EdgeInsets.all(24.0),
		  child: CustomPaint(
		  	painter: _CustomRevenueTool(),
		  	child: Container(
		  		margin: const EdgeInsets.all(20.0),
		  		width: size.width * 0.6,
		  		height: size.width * 0.6,
		  		child: Center(
					child: Stack(
					  children: [
					    Column(
					    	mainAxisAlignment: MainAxisAlignment.center,
					      children: const [
					        Text(
					        	"\$ 5018",
					        	style: TextStyle(
					        		color: Colors.white,
					        		fontSize: 35.0,
					        		fontWeight: FontWeight.normal
					        	)
					        ),
					    	Text(
					    		"This month",
					    		style: TextStyle(
					    			color: Colors.grey,
					    			fontSize: 15.0,
					    			fontWeight: FontWeight.normal
					    		)
					    	),
					      ],
					    ),
						Transform.translate(
							offset: Offset(size.width * 0.25, size.width * 0.05),
							child: IconButton(
								icon: const CircleAvatar(
									backgroundColor: Colors.white,
									child: Icon(
										Icons.add,
										color: Colors.grey
									),
								),
								onPressed: (){}
							)
						)
					  ],
					)
				)
		  	)
		  ),
		);
	}
}

class _CustomRevenueTool extends CustomPainter {
	/// the separation between arcs
	double arcSep = pi/30;
	/// the size of the drow arc
	final double arcSize = 2*pi/3 - pi/30;

	final double strokeMainWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
	  // drawing three ring segments
	  final paint = Paint()
		  ..strokeWidth = strokeMainWidth;

	  _getCustomArc(
		  paint, canvas, size,
		  -pi/2
	  );

	  _getCustomArc(
		  paint, canvas, size,
		  pi/6
	  );

	  _getCustomArc(
		  paint, canvas, size,
		  pi - pi/6
	  );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
	  return true;
  }

  _getCustomArc(Paint paint, Canvas canvas, Size size, double origin) {

	  paint.style = PaintingStyle.stroke;
	  paint.strokeWidth = strokeMainWidth;
	  paint.color = Colors.grey;

	  canvas.drawArc(
		  Rect.fromCircle(
			  center: Offset(size.width / 2, size.height / 2),
			  radius: size.width / 2,
		  ),
		  origin + arcSep,
		  arcSize,
		  true, // draws from the center of the circle
		  paint,
	  );

	  paint.strokeWidth = 2.0;

	  canvas.drawArc(
		  Rect.fromCircle(
			  center: Offset(size.width / 2, size.height / 2),
			  radius: size.width*0.75 / 2,
		  ),
		  origin + arcSep,
		  arcSize,
		  true, // draws from the center of the circle
		  paint,
	  );
	  paint.style = PaintingStyle.fill;
	  paint.color = AppTheme.getTheme().backgroundColor;

	  canvas.drawArc(
		  Rect.fromCircle(
			  center: Offset(size.width / 2, size.height / 2),
			  radius: size.width * 0.75 / 2,
		  ),
		  origin + arcSep,
		  2 * pi,
		  true, // draws from the center of the circle
		  paint,
	  );

	  paint.color = Colors.grey.withOpacity(0.1);

	  canvas.drawArc(
		  Rect.fromCircle(
			  center: Offset(size.width / 2, size.height / 2),
			  radius: size.width * 0.7 / 2,
		  ),
		  origin + arcSep,
		  2 * pi,
		  true, // draws from the center of the circle
		  paint,
	  );
  }


}
