import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '_themes/bottom_sheet_theme.dart';
import '_themes/chip_theme.dart';
import '_themes/text_field_theme.dart';
import '_themes/text_theme.dart';
import '_themes/appbar_theme.dart';
import '_themes/checkbox_theme.dart';
import '_themes/elevated_button_theme.dart';
import '_themes/outlined_button_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    disabledColor: TColors.grey,
    colorScheme: ColorScheme.light(primary: TColors.primary),
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: GoogleFonts.poppinsTextTheme(TTextTheme.lightTextTheme),
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(primary: TColors.primary),
    primaryColor: TColors.primary,
    textTheme: GoogleFonts.poppinsTextTheme(TTextTheme.darkTextTheme),
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
