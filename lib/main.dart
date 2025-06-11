import 'package:apiexample/presentation/dashboard_screen.dart';
import 'package:apiexample/presentation/login_screen.dart';
import 'package:apiexample/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn =
        SharedPrefs.getIntValue(key: SharedPrefs.userIdKey) != null;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: isUserLoggedIn ? const DashboardScreen() : const LoginScreen(),
    );
  }
}
