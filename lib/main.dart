import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/admin/admin_page.dart';
import 'screens/guru/guru_page.dart';
import 'screens/siswa/siswa_page.dart';

import 'screens/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        "/admin": (context) => AdminPage(username: "admin"),
        "/guru": (context) => GuruPage(username: "guru"),
        "/siswa": (context) => SiswaPage(username: "siswa"),
      },
    );
  }
}
