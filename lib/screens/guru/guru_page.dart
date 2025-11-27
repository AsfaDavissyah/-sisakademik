import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GuruPage extends StatelessWidget {
  final String username;

  const GuruPage({super.key, required this.username});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Guru")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Selamat datang, $username 👋",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Silahkan pilih menu di bawah:",
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 30),

            // MENU BUTTON 1 – Input Nilai
            menuButton(
              icon: Icons.edit_note,
              title: "Input Nilai Siswa",
              onTap: () => Navigator.pushNamed(context, "/inputNilai"),
            ),
            const SizedBox(height: 15),

            // MENU BUTTON 2 – Jadwal Mengajar
            menuButton(
              icon: Icons.schedule,
              title: "Jadwal Mengajar",
              onTap: () => Navigator.pushNamed(context, "/jadwalGuru"),
            ),
            const SizedBox(height: 15),

            // MENU BUTTON 3 – Pengumuman Admin
            menuButton(
              icon: Icons.campaign,
              title: "Pengumuman",
              onTap: () => Navigator.pushNamed(context, "/pengumumanGuru"),
            ),

            const Spacer(),

            Center(
              child: ElevatedButton.icon(
                onPressed: () => logout(context),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // WIDGET MENU
  Widget menuButton({required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.indigo.shade50,
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Colors.indigo),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
