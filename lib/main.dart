import 'package:dashboard/constants/theme.dart';
import 'package:dashboard/helpers/route_deligate.dart';
import 'package:dashboard/helpers/route_information_parser.dart';
import 'package:dashboard/pages/large_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _routerDelegate = SiteRouterDelegate();
  final _routeInformationParser = SiteRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    const defaultTextStyle =
        TextStyle(fontFamily: 'IranYekan', color: LightTheme.primaryTextColor);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        title: "پنل مدیریتی",
        theme: ThemeData(
          snackBarTheme:
              const SnackBarThemeData(backgroundColor: Color(0xff19CC56)),
          inputDecorationTheme: const InputDecorationTheme(
              hoverColor: Colors.grey,
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: LightTheme.primary, width: 2)),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: LightTheme.secondary, width: 2))),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.w700)))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.w700)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
                  elevation: const MaterialStatePropertyAll(2),
                  backgroundColor:
                      MaterialStateProperty.all(LightTheme.primary),
                  foregroundColor:
                      MaterialStateProperty.all(LightTheme.onPrimary))),
          textTheme: TextTheme(
            displayLarge: defaultTextStyle.copyWith(
                fontSize: 96, fontWeight: FontWeight.w300),
            displayMedium: defaultTextStyle.copyWith(
                fontSize: 60, fontWeight: FontWeight.w400),
            displaySmall: defaultTextStyle.copyWith(
                fontSize: 48, fontWeight: FontWeight.w400),
            headlineMedium: defaultTextStyle.copyWith(
                fontSize: 34, fontWeight: FontWeight.w400),
            headlineSmall: defaultTextStyle.copyWith(
                fontSize: 24, fontWeight: FontWeight.w400),
            titleLarge: defaultTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w500),
            titleMedium: defaultTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w500),
            bodyLarge: defaultTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
            bodyMedium: defaultTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
            bodySmall: defaultTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
            labelLarge: defaultTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500),
          ),
          colorScheme: const ColorScheme.light(
              primary: LightTheme.primary,
              onPrimary: LightTheme.onPrimary,
              surface: LightTheme.surface,
              surfaceVariant: LightTheme.variantSurfaceColor,
              onSurface: LightTheme.onSurface,
              secondary: LightTheme.secondary,
              onSecondary: LightTheme.onSecondary,
              primaryContainer: LightTheme.primaryVariantColor,
              background: LightTheme.backgroundColor,
              onBackground: LightTheme.onBackground),
          dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 1),
          useMaterial3: true,
        ),
      home: LargeDashboard(isDash: (value) {},),
      /*routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,*/
    );
  }
}
