import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class RectangleButton extends StatelessWidget {
  final String assetPath;
  final Function function;
  final double width;
  final double height;
  final BorderRadius? radious;
  final double customPadding;
  final File? file;
  final Color? imageColor;
  const RectangleButton({
    super.key,
    required this.assetPath,
    required this.function,
    this.width = 65,
    this.height = 65,
    this.customPadding = 20,
    this.radious,
    this.file,
    this.imageColor,
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
          backgroundColor: Color(0xFF222222),
          side: BorderSide(color: Color.fromARGB(255, 90, 90, 90)),
          shape: RoundedRectangleBorder(
            // Border'ın çalışması için şart
            borderRadius: radious != null ? radious! : borderRadius,
          ),
        ),

        child: Center(
          child:
              file != null
                  ? ClipRRect(
                    borderRadius: radious != null ? radious! : borderRadius,
                    child: Image.file(
                      file!,
                      fit: BoxFit.cover,
                      height: height,
                      width: width,
                    ),
                  )
                  : Image.asset(assetPath, color: imageColor),
        ),
      ),
    );
  }
}
