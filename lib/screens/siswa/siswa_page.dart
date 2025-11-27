import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SiswaPage extends StatelessWidget {
  final String username;

  const SiswaPage({super.key, required this.username});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Siswa")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, $username",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Silakan pilih menu berikut:"),
            const SizedBox(height: 30),

            /// MENU JADWAL
            _menuButton(
              title: "Jadwal",
              onTap: () {
                Navigator.pushNamed(context, "/jadwalSiswa");
              },
            ),

            /// MENU NILAI
            _menuButton(
              title: "Nilai",
              onTap: () {
                Navigator.pushNamed(context, "/nilaiSiswa");
              },
            ),

            /// MENU PENGUMUMAN
            _menuButton(
              title: "Pengumuman",
              onTap: () {
                Navigator.pushNamed(context, "/pengumumanSiswa");
              },
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () => logout(context),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 🔹 Widget Tombol Menu
Widget _menuButton({required String title, required Function() onTap}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 15),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(title, style: const TextStyle(fontSize: 18)),
    ),
  );
}
