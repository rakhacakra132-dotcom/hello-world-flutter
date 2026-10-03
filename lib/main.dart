import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5369B5),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF8FF),
      ),
      home: const ProfilMahasiswaPage(),
    );
  }
}

class ProfilMahasiswaPage extends StatefulWidget {
  const ProfilMahasiswaPage({super.key});

  @override
  State<ProfilMahasiswaPage> createState() => _ProfilMahasiswaPageState();
}

class _ProfilMahasiswaPageState extends State<ProfilMahasiswaPage> {
  String nama = 'Shofyan';
  int semester = 8;
  bool mahasiswaAktif = true;

  final TextEditingController namaController =
      TextEditingController(text: 'Shofyan');

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  void simpanNama() {
    setState(() {
      nama = namaController.text.trim().isEmpty
          ? 'Rakha Cakrabirawa'
          : namaController.text.trim();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nama berhasil disimpan'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFFAF8FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =========================
            // STATELESS WIDGET
            // =========================
            const Text(
              'Contoh StatelessWidget',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Kartu profil menerima data dari halaman induk.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            // KARTU PROFIL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F7FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE2DFE8),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [

                  // FOTO / ICON PROFIL
                  Container(
                    width: 58,
                    height: 58,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE8EBFF),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 34,
                      color: Color(0xFF5369B5),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 14),

                  infoText('NIM:', '2024001001'),
                  infoText('Jurusan:', 'Teknik Informatika'),
                  infoText('Semester:', semester.toString()),
                  infoText(
                    'Status:',
                    mahasiswaAktif ? 'Aktif' : 'Tidak Aktif',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // =========================
            // STATEFUL WIDGET
            // =========================
            const Text(
              'Contoh StatefulWidget',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Ubah data di bawah. setState memperbarui kartu profil.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            // INPUT NAMA
            const Text(
              'Nama mahasiswa',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 5),

            TextField(
              controller: namaController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color(0xFF5369B5),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // TOMBOL SIMPAN
            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton.icon(
                onPressed: simpanNama,
                icon: const Icon(
                  Icons.save,
                  size: 16,
                ),
                label: const Text(
                  'Simpan nama',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5369B5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // SEMESTER
            // =========================
            Row(
              children: [
                const Text(
                  'Semester',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    setState(() {
                      if (semester > 1) {
                        semester--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 18,
                  ),
                ),

                Text(
                  semester.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      if (semester < 14) {
                        semester++;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // =========================
            // MAHASISWA AKTIF
            // =========================
            Row(
              children: [
                const Text(
                  'Mahasiswa aktif',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                const Spacer(),

                Switch(
                  value: mahasiswaAktif,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF5369B5),
                  onChanged: (value) {
                    setState(() {
                      mahasiswaAktif = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi kartu
  Widget infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 65,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}