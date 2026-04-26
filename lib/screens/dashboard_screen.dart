import 'package:flutter/material.dart'; // Mengimport package material Flutter
import '../models/news_model.dart'; // Mengimport model berita
import '../widgets/news_card.dart'; // Mengimport widget card berita

class DashboardScreen extends StatelessWidget {
  // Membuat halaman dashboard
  const DashboardScreen({super.key}); // Constructor DashboardScreen

  final List<NewsModel> newsList = const [
    // Membuat list data berita dummy
    NewsModel(
      title: 'Berita Terkini Brain Academy',
      image: 'assets/news1.png',
    ), // Data berita pertama
    NewsModel(
      title: 'Gerakan Aceh Bangkit',
      image: 'assets/news2.png',
    ), // Data berita kedua
    NewsModel(
      title: 'Pemerintah Tidak Ikut Terlibat Di Kasus Ini',
      image: 'assets/news3.png',
    ), // Data berita ketiga
    NewsModel(
      title: 'Rapat Dewan Pengurus II 2026',
      image: 'assets/news4.png',
    ), // Data berita keempat
    NewsModel(
      title: 'Seminar Teknologi Kampus',
      image: 'assets/news1.png',
    ), // Data berita kelima
    NewsModel(
      title: 'Mahasiswa Berprestasi Nasional',
      image: 'assets/news2.png',
    ), // Data berita keenam
    NewsModel(
      title: 'Kegiatan Organisasi Mahasiswa',
      image: 'assets/news3.png',
    ), // Data berita ketujuh
    NewsModel(
      title: 'Informasi Jadwal UTS',
      image: 'assets/news4.png',
    ), // Data berita kedelapan
    NewsModel(
      title: 'Workshop Mobile Programming',
      image: 'assets/news1.png',
    ), // Data berita kesembilan
    NewsModel(
      title: 'Pengumuman Akademik Terbaru',
      image: 'assets/news2.png',
    ), // Data berita kesepuluh
  ]; // Akhir list berita

  @override // Menandakan build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method membangun tampilan dashboard
    final email =
        ModalRoute.of(context)!.settings.arguments as String? ??
        'User'; // Mengambil email dari halaman login

    return Scaffold(
      // Kerangka halaman dashboard
      appBar: AppBar(
        // Header dashboard
        title: const Text('SHINE NEWS'), // Judul AppBar
        automaticallyImplyLeading: false, // Menghilangkan tombol back otomatis
        actions: [
          // Daftar tombol di kanan AppBar
          IconButton(
            // Tombol icon logout
            icon: const Icon(Icons.logout), // Icon logout
            onPressed: () {
              // Aksi saat logout diklik
              Navigator.pushNamedAndRemoveUntil(
                // Pindah ke login dan hapus semua halaman sebelumnya
                context, // Context halaman saat ini
                '/', // Route tujuan login
                (route) => false, // Menghapus semua route sebelumnya
              ); // Akhir Navigator
            }, // Akhir onPressed
          ), // Akhir IconButton
        ], // Akhir actions
      ), // Akhir AppBar

      body: ListView.builder(
        // Membuat list berita secara dinamis
        padding: const EdgeInsets.all(16), // Jarak isi list
        itemCount:
            newsList.length + 1, // Jumlah item ditambah 1 untuk card sambutan
        itemBuilder: (context, index) {
          // Fungsi pembuat item list
          if (index == 0) {
            // Jika index pertama
            return Card(
              // Card sambutan user
              margin: const EdgeInsets.only(bottom: 16), // Jarak bawah card
              child: Padding(
                // Jarak dalam card
                padding: const EdgeInsets.all(16), // Padding semua sisi 16
                child: Text(
                  // Menampilkan teks sambutan
                  'Selamat datang, $email', // Isi sambutan dengan email user
                  style: const TextStyle(
                    // Mengatur gaya teks
                    fontSize: 18, // Ukuran font
                    fontWeight: FontWeight.bold, // Teks tebal
                  ), // Akhir TextStyle
                ), // Akhir Text
              ), // Akhir Padding
            ); // Akhir Card
          } // Akhir kondisi index pertama

          final news =
              newsList[index - 1]; // Mengambil data berita sesuai index

          return NewsCard(
            // Menampilkan widget card berita
            title: news.title, // Mengirim judul berita ke NewsCard
            image: news.image, // Mengirim gambar berita ke NewsCard
          ); // Akhir NewsCard
        }, // Akhir itemBuilder
      ), // Akhir ListView.builder
    ); // Akhir Scaffold
  } // Akhir build
} // Akhir class DashboardScreen
