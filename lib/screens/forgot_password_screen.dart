import 'package:flutter/material.dart'; // Mengimport package material Flutter
import '../utils/validators.dart'; // Mengimport validasi
import '../widgets/input_field.dart'; // Mengimport input custom

class ForgotPasswordScreen extends StatefulWidget {
  // Membuat halaman lupa password
  const ForgotPasswordScreen({super.key}); // Constructor ForgotPasswordScreen

  @override // Menandakan createState menimpa method bawaan
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState(); // Menghubungkan widget dengan state
} // Akhir class ForgotPasswordScreen

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // State halaman lupa password
  final _formKey = GlobalKey<FormState>(); // Key untuk validasi form
  final emailController =
      TextEditingController(); // Controller untuk input email

  bool isLoading = false; // State loading saat kirim reset

  void sendReset() async {
    // Fungsi untuk mengirim link reset
    if (!_formKey.currentState!.validate())
      return; // Jika form tidak valid, proses berhenti

    setState(() {
      // Memperbarui tampilan
      isLoading = true; // Mengaktifkan loading
    }); // Akhir setState

    await Future.delayed(
      const Duration(seconds: 1),
    ); // Simulasi proses pengiriman link

    setState(() {
      // Memperbarui tampilan
      isLoading = false; // Mematikan loading
    }); // Akhir setState

    ScaffoldMessenger.of(context).showSnackBar(
      // Menampilkan snackbar
      const SnackBar(
        content: Text('Link reset berhasil dikirim'),
      ), // Pesan berhasil
    ); // Akhir snackbar
  } // Akhir fungsi sendReset

  @override // Menandakan dispose menimpa method bawaan
  void dispose() {
    // Fungsi membersihkan resource
    emailController.dispose(); // Membersihkan controller email
    super.dispose(); // Memanggil dispose parent
  } // Akhir dispose

  @override // Menandakan build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method membangun tampilan
    return Scaffold(
      // Kerangka halaman
      appBar: AppBar(
        // Header halaman
        title: const Text('Lupa Password'), // Judul AppBar
      ), // Akhir AppBar
      body: SafeArea(
        // Menghindari notch/status bar
        child: Padding(
          // Memberikan jarak halaman
          padding: const EdgeInsets.all(24), // Jarak semua sisi 24
          child: Form(
            // Form validasi
            key: _formKey, // Menghubungkan form dengan key
            child: Column(
              // Menyusun widget secara vertikal
              children: [
                // Daftar widget dalam Column
                const SizedBox(height: 40), // Jarak atas

                const Icon(Icons.email, size: 80), // Icon email

                const SizedBox(height: 16), // Jarak bawah icon

                const Text(
                  // Teks judul halaman
                  'Reset Password', // Isi teks
                  style: TextStyle(fontSize: 24), // Ukuran teks
                ), // Akhir Text

                const SizedBox(height: 24), // Jarak sebelum input

                InputField(
                  // Widget input email
                  label: 'Masukkan Email', // Label input
                  icon: Icons.email, // Icon email
                  controller: emailController, // Controller email
                  validator: Validators.email, // Validasi email
                ), // Akhir InputField

                const SizedBox(height: 20), // Jarak sebelum tombol

                SizedBox(
                  // Mengatur ukuran tombol
                  width: double.infinity, // Tombol selebar layar
                  child: ElevatedButton(
                    // Tombol kirim reset
                    onPressed: isLoading
                        ? null
                        : sendReset, // Jika loading tombol mati, jika tidak jalankan sendReset
                    child:
                        isLoading // Mengecek loading
                        ? const CircularProgressIndicator() // Tampilkan loading
                        : const Text(
                            'Kirim Link Reset',
                          ), // Tampilkan teks tombol
                  ), // Akhir ElevatedButton
                ), // Akhir SizedBox

                TextButton(
                  // Tombol kembali
                  onPressed: () {
                    // Aksi saat tombol diklik
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  }, // Akhir onPressed
                  child: const Text('Kembali ke Login'), // Teks tombol kembali
                ), // Akhir TextButton
              ], // Akhir children Column
            ), // Akhir Column
          ), // Akhir Form
        ), // Akhir Padding
      ), // Akhir SafeArea
    ); // Akhir Scaffold
  } // Akhir build
} // Akhir class _ForgotPasswordScreenState
