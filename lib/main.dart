import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Step',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color(0xFF252C4A),
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF252C4A)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
