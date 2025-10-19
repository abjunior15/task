import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'colors/color_scheme.dart';
import 'text_theme/text_theme.dart';

class TaskAppTheme extends AppTheme {
  @override
  ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: awqafColorScheme.surface,
      useMaterial3: true,
      brightness: awqafColorScheme.brightness,
      appBarTheme: AppBarTheme(
        surfaceTintColor: awqafColorScheme.surface,
        backgroundColor: awqafColorScheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: taskTextTheme().bodyMedium?.copyWith(
              color: awqafColorScheme.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
        iconTheme: IconThemeData(
          color: awqafColorScheme.onSurface,
          size: 24,
        ),
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: awqafColorScheme,
      textTheme: taskTextTheme(),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: awqafColorScheme.surface,
        modalBarrierColor: awqafColorScheme.inverseSurface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: awqafColorScheme.surfaceContainerLowest,
        selectedItemColor: awqafColorScheme.tertiary,
        selectedLabelStyle: taskTextTheme().labelSmall,
        unselectedLabelStyle: taskTextTheme().labelSmall,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
