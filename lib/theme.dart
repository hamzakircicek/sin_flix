import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xFF090909),
  scaffoldBackgroundColor: Color(0xFF090909),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    backgroundColor: Color(0xFF090909),
    foregroundColor: Color(0xFF090909),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
    titleLarge: TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xFF222222),
    filled: true,

    border: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
      borderRadius: borderRadius,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),

    suffixIconColor: Colors.white,

    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(decoration: TextDecoration.underline),
      foregroundColor: Colors.white,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xFFe50914)),
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),

      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
  ),
);

BorderRadius borderRadius = BorderRadius.circular(20);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(surfaceTint: Colors.transparent),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

final TextStyle boldTextStyle = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final TextStyle thinTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

final TextStyle faintTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: const Color.fromARGB(255, 161, 161, 161),
);

final ButtonStyle textButtonNonUnderLine = ButtonStyle(
  textStyle: WidgetStateProperty.all(
    TextStyle(
      fontSize: 12,
      color: Color(0xFFFFFFFF),
      decoration: TextDecoration.none,
    ),
  ),
);




//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: textColorLight, fontSize: 15),
//     titleLarge: TextStyle(
//       color: const Color.fromARGB(255, 0, 0, 0),
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//     ),
    
//   ),
//   inputDecorationTheme: InputDecorationTheme(
    
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(borderRadius),
//       borderSide: BorderSide(width: 1, color: textFieldBorderColor),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(width: 0.5, color: textFieldBorderColor),
//       borderRadius: BorderRadius.circular(borderRadius),
//     ),

//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(borderRadius),
//       borderSide: BorderSide(width: 1, color: textFieldBorderColor),
//     ),

//     suffixIconColor: textFieldBorderColor,

//     hintStyle: TextStyle(color: Colors.grey),
//   ),

//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: bottomNavbarBackgroundColorLight,
//     elevation: 0,
//     selectedItemColor: bottomNavbarSelectedColorLight,
//     unselectedItemColor: bottomNavbarUnselectedColorLight,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: ButtonStyle(
//       iconColor: WidgetStatePropertyAll(textButtonTextColorLight),
//       foregroundColor: WidgetStatePropertyAll(textButtonTextColorLight),
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all(
//         elevatetButtonBackgroundColorLight,
//       ),
//       foregroundColor: WidgetStateProperty.all(elevatetButtonTextColorLight),
//       textStyle: WidgetStateProperty.all(
//         TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//       ),

//       shape: WidgetStateProperty.all(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//       ),
//     ),
//   ),
// );
