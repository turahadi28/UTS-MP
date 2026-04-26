import 'package:flutter/material.dart'; // Mengimport package material Flutter

class InputField extends StatelessWidget {
  // Membuat widget input custom
  final String label; // Variabel untuk teks label input
  final IconData icon; // Variabel untuk icon input
  final TextEditingController
  controller; // Controller untuk mengambil isi input
  final bool obscureText; // Menentukan apakah teks disembunyikan
  final String? Function(String?)? validator; // Fungsi validasi input

  const InputField({
    // Constructor InputField
    super.key, // Key bawaan Flutter
    required this.label, // Label wajib diisi
    required this.icon, // Icon wajib diisi
    required this.controller, // Controller wajib diisi
    this.obscureText = false, // Default teks tidak disembunyikan
    this.validator, // Validator bersifat opsional
  }); // Akhir constructor

  @override // Menandakan method build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method untuk membangun widget
    return TextFormField(
      // Widget input yang mendukung validasi
      controller: controller, // Menghubungkan input dengan controller
      obscureText: obscureText, // Menentukan apakah teks disembunyikan
      validator: validator, // Menjalankan fungsi validasi
      decoration: InputDecoration(
        // Mengatur tampilan input
        labelText: label, // Menampilkan label input
        prefixIcon: Icon(icon), // Menampilkan icon di kiri input
        border:
            const OutlineInputBorder(), // Memberikan border kotak pada input
      ), // Akhir InputDecoration
    ); // Akhir TextFormField
  } // Akhir method build
} // Akhir class InputField
