import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import 'custome_theme/BottomSheetTheme.dart';
import 'custome_theme/appbarTheme.dart';
import 'custome_theme/checkbox_theme.dart';
import 'custome_theme/chip_theme.dart';
import 'custome_theme/elevated_button_theme.dart';
import 'custome_theme/outlined_button_theme.dart';
import 'custome_theme/text_field_theme.dart';
import 'custome_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: textTheme.lightTextTheme,
    chipTheme: chipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme.lightAppBarTheme,
    checkboxTheme: checkboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: elevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: textFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: textTheme.darkTextTheme,
    chipTheme: chipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme.darkAppBarTheme,
    checkboxTheme: checkboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: elevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: textFormFieldTheme.darkInputDecorationTheme,
  );
}
