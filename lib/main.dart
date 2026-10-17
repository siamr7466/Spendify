import 'package:expense_tracker/view/splash/splash_screen.dart';
import 'package:expense_tracker/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/view_model/expense_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Expense Tracker',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            cardColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2196F3),
              surface: Colors.white,
              onSurface: Colors.black87,
              onPrimary: Colors.white,
            ),
            dividerColor: const Color(0xFFE0E0E0),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF0F0F0F),
            cardColor: const Color(0xFF1A1A1A),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF2196F3),
              surface: Color(0xFF1A1A1A),
              onSurface: Colors.white,
              onPrimary: Colors.white,
            ),
            dividerColor: const Color(0xFF2A2A2A),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF111111),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),

          themeMode: themeProvider.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          home: const SplashScreen(),
        );
      },
    );
  }
}
