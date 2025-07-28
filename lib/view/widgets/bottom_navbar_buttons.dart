import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class BottomNavBarButton extends StatelessWidget {
  final String assetPath;
  final String label;
  final Function function;
  final double width;
  final double height;
  final BorderRadius? radious;
  final double customPadding;
  const BottomNavBarButton({
    super.key,
    required this.assetPath,
    required this.label,
    required this.function,
    this.width = 130,
    this.height = 40,
    this.customPadding = 10,
    this.radious,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () => function(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(customPadding),
          backgroundColor: Color.fromARGB(0, 34, 34, 34),
          side: BorderSide(color: Color.fromARGB(255, 90, 90, 90)),
          shape: RoundedRectangleBorder(
            // Border'ın çalışması için şart
            borderRadius: radious != null ? radious! : borderRadius,
          ),
        ),

        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(assetPath), Text(label, style: thinTextStyle)],
        ),
      ),
    );
  }
}
