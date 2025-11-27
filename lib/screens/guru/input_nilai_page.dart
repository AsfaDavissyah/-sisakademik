import 'package:flutter/material.dart';

class InputNilaiPage extends StatefulWidget {
  const InputNilaiPage({super.key});

  @override
  State<InputNilaiPage> createState() => _InputNilaiPageState();
}

class _InputNilaiPageState extends State<InputNilaiPage> {
  final TextEditingController tugasC = TextEditingController();
  final TextEditingController utsC = TextEditingController();
  final TextEditingController uasC = TextEditingController();
  final TextEditingController namaSiswaC = TextEditingController();
  final TextEditingController mapelC = TextEditingController();

  double nilaiAkhir = 0.0;
  String predikat = "-";

  void hitungNilai() {
    double tugas = double.tryParse(tugasC.text) ?? 0;
    double uts   = double.tryParse(utsC.text) ?? 0;
    double uas   = double.tryParse(uasC.text) ?? 0;

    double hasil = (tugas * 0.4) + (uts * 0.3) + (uas * 0.3);

    String grade;
    if (hasil >= 90) grade = "A";
    else if (hasil >= 80) grade = "B";
    else if (hasil >= 70) grade = "C";
    else if (hasil >= 60) grade = "D";
    else grade = "E";

    setState(() {
      nilaiAkhir = hasil;
      predikat = grade;
    });
  }

  void simpanData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data siap disimpan ke database!"))
    );

    /// 🔥 Step selanjutnya → kirim ke Firestore
    /// kita lanjut setelah halaman jadwal & pengumuman jadi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Nilai Siswa")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            TextField(
              controller: namaSiswaC,
              decoration: const InputDecoration(labelText: "Nama Siswa"),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: mapelC,
              decoration: const InputDecoration(labelText: "Mata Pelajaran"),
            ),
            const SizedBox(height: 12),

            TextField(
              keyboardType: TextInputType.number,
              controller: tugasC,
              decoration: const InputDecoration(labelText: "Nilai Tugas (40%)"),
              onChanged: (_) => hitungNilai(),
            ),
            const SizedBox(height: 12),

            TextField(
              keyboardType: TextInputType.number,
              controller: utsC,
              decoration: const InputDecoration(labelText: "Nilai UTS (30%)"),
              onChanged: (_) => hitungNilai(),
            ),
            const SizedBox(height: 12),

            TextField(
              keyboardType: TextInputType.number,
              controller: uasC,
              decoration: const InputDecoration(labelText: "Nilai UAS (30%)"),
              onChanged: (_) => hitungNilai(),
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Text("Nilai Akhir: ${nilaiAkhir.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Predikat: $predikat",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: simpanData,
              child: const Text("Simpan Nilai"),
            )
          ],
        ),
      ),
    );
  }
}
