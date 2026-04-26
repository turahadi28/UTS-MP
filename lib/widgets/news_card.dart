import 'package:flutter/material.dart'; // Mengimport package material Flutter

class NewsCard extends StatelessWidget {
  // Membuat widget card berita
  final String title; // Variabel judul berita
  final String image; // Variabel path gambar berita

  const NewsCard({
    // Constructor NewsCard
    super.key, // Key bawaan Flutter
    required this.title, // Judul wajib diisi
    required this.image, // Gambar wajib diisi
  }); // Akhir constructor

  @override // Menandakan method build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method untuk membangun tampilan card
    return Card(
      // Widget card untuk tampilan kotak berita
      margin: const EdgeInsets.only(
        bottom: 12,
      ), // Memberi jarak bawah antar card
      elevation: 3, // Memberi efek bayangan pada card
      child: Padding(
        // Memberi jarak di dalam card
        padding: const EdgeInsets.all(12), // Jarak dalam card sebesar 12
        child: Row(
          // Menyusun isi card secara horizontal
          children: [
            // Daftar widget di dalam Row
            Image.asset(
              // Menampilkan gambar dari folder assets
              image, // Path gambar yang akan ditampilkan
              width: 80, // Lebar gambar
              height: 80, // Tinggi gambar
              fit: BoxFit.cover, // Membuat gambar menyesuaikan area
              errorBuilder: (context, error, stackTrace) {
                // Jika gambar gagal ditampilkan
                return const Icon(
                  Icons.image,
                  size: 80,
                ); // Menampilkan icon cadangan
              }, // Akhir errorBuilder
            ), // Akhir Image.asset

            const SizedBox(width: 12), // Memberi jarak antara gambar dan teks

            Expanded(
              // Membuat teks memenuhi sisa ruang
              child: Text(
                // Menampilkan judul berita
                title, // Isi teks judul berita
                style: const TextStyle(
                  // Mengatur gaya teks
                  fontSize: 16, // Ukuran font
                  fontWeight: FontWeight.bold, // Membuat teks tebal
                ), // Akhir TextStyle
              ), // Akhir Text
            ), // Akhir Expanded
          ], // Akhir children Row
        ), // Akhir Row
      ), // Akhir Padding
    ); // Akhir Card
  } // Akhir method build
} // Akhir class NewsCard
