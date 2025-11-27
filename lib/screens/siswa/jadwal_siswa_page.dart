import 'package:flutter/material.dart';

class JadwalSiswaPage extends StatelessWidget {
  const JadwalSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal Pelajaran")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.schedule, size: 70, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              "Tidak ada jadwal untuk ditampilkan",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
