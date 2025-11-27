import 'package:flutter/material.dart';

class JadwalGuruPage extends StatelessWidget {
  const JadwalGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal Mengajar Guru")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.schedule, size: 70, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              "Belum ada jadwal mengajar",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
