import 'package:flutter/material.dart';

class NilaiSiswaPage extends StatelessWidget {
  const NilaiSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nilai Saya")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.school, size: 70, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              "Belum ada nilai yang ditampilkan",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
