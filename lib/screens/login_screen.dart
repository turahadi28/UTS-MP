import 'package:flutter/material.dart'; // Mengimport package material Flutter
import '../utils/validators.dart'; // Mengimport file validasi
import '../widgets/input_field.dart'; // Mengimport widget input custom

class LoginScreen extends StatefulWidget {
  // Membuat halaman login dengan StatefulWidget
  const LoginScreen({super.key}); // Constructor LoginScreen

  @override // Menandakan createState menimpa method bawaan
  State<LoginScreen> createState() => _LoginScreenState(); // Menghubungkan LoginScreen dengan state
} // Akhir class LoginScreen

class _LoginScreenState extends State<LoginScreen> {
  // State untuk halaman login
  final _formKey =
      GlobalKey<FormState>(); // Key untuk mengontrol dan memvalidasi Form

  final emailController =
      TextEditingController(); // Controller untuk input email
  final passwordController =
      TextEditingController(); // Controller untuk input password

  bool isLoading = false; // State untuk menandakan proses loading login
  bool isPasswordVisible = false; // State untuk show atau hide password
  String? errorMessage; // State untuk menyimpan pesan error

  void login() async {
    // Fungsi login
    if (!_formKey.currentState!.validate())
      return; // Jika form tidak valid, proses berhenti

    setState(() {
      // Memperbarui tampilan
      isLoading = true; // Mengaktifkan loading
      errorMessage = null; // Menghapus pesan error sebelumnya
    }); // Akhir setState

    await Future.delayed(
      const Duration(seconds: 1),
    ); // Simulasi proses login selama 1 detik

    if (emailController.text ==
            'admin@test.com' && // Mengecek apakah email benar
        passwordController.text == 'Admin123') {
      // Mengecek apakah password benar

      Navigator.pushReplacementNamed(
        // Pindah halaman dan mengganti halaman login
        context, // Context halaman saat ini
        '/dashboard', // Route tujuan dashboard
        arguments: emailController.text, // Mengirim data email ke dashboard
      ); // Akhir Navigator
    } else {
      // Jika email atau password salah
      setState(() {
        // Memperbarui tampilan
        errorMessage = 'Email atau password salah'; // Mengisi pesan error
      }); // Akhir setState

      ScaffoldMessenger.of(context).showSnackBar(
        // Menampilkan snackbar
        const SnackBar(
          content: Text('Login gagal'),
        ), // Isi snackbar login gagal
      ); // Akhir snackbar
    } // Akhir kondisi login

    setState(() {
      // Memperbarui tampilan
      isLoading = false; // Mematikan loading
    }); // Akhir setState
  } // Akhir fungsi login

  @override // Menandakan dispose menimpa method bawaan
  void dispose() {
    // Fungsi untuk membersihkan resource
    emailController.dispose(); // Membersihkan controller email
    passwordController.dispose(); // Membersihkan controller password
    super.dispose(); // Memanggil dispose bawaan parent
  } // Akhir dispose

  @override // Menandakan build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method untuk membangun tampilan
    return Scaffold(
      // Kerangka utama halaman
      body: SafeArea(
        // Menghindari area notch/status bar
        child: Padding(
          // Memberikan jarak sisi halaman
          padding: const EdgeInsets.all(24), // Jarak semua sisi 24
          child: Form(
            // Form untuk validasi input
            key: _formKey, // Menghubungkan Form dengan GlobalKey
            child: Column(
              // Menyusun widget secara vertikal
              mainAxisAlignment:
                  MainAxisAlignment.center, // Membuat isi berada di tengah
              children: [
                // Daftar widget di dalam Column
                const Icon(Icons.newspaper, size: 80), // Icon aplikasi berita
                const SizedBox(height: 16), // Jarak bawah icon

                const Text(
                  // Menampilkan judul aplikasi
                  'SHINE NEWS', // Teks judul
                  style: TextStyle(
                    // Mengatur gaya teks
                    fontSize: 28, // Ukuran font judul
                    fontWeight: FontWeight.bold, // Membuat judul tebal
                  ), // Akhir TextStyle
                ), // Akhir Text

                const SizedBox(height: 32), // Jarak antara judul dan input

                InputField(
                  // Widget input email custom
                  label: 'Email', // Label input email
                  icon: Icons.email, // Icon email
                  controller: emailController, // Controller email
                  validator: Validators.email, // Validasi email
                ), // Akhir InputField email

                const SizedBox(height: 16), // Jarak antar input

                TextFormField(
                  // Input password
                  controller: passwordController, // Controller password
                  obscureText:
                      !isPasswordVisible, // Password disembunyikan jika state false
                  validator: Validators.password, // Validasi password
                  decoration: InputDecoration(
                    // Mengatur tampilan input password
                    labelText: 'Password', // Label password
                    prefixIcon: const Icon(Icons.lock), // Icon lock di kiri
                    border: const OutlineInputBorder(), // Border kotak input
                    suffixIcon: IconButton(
                      // Tombol show/hide password
                      icon: Icon(
                        // Icon tombol password
                        isPasswordVisible // Mengecek status password
                            ? Icons
                                  .visibility // Icon jika password terlihat
                            : Icons
                                  .visibility_off, // Icon jika password tersembunyi
                      ), // Akhir Icon
                      onPressed: () {
                        // Aksi saat icon diklik
                        setState(() {
                          // Memperbarui tampilan
                          isPasswordVisible =
                              !isPasswordVisible; // Membalik status password
                        }); // Akhir setState
                      }, // Akhir onPressed
                    ), // Akhir suffixIcon
                  ), // Akhir InputDecoration
                ), // Akhir TextFormField password

                const SizedBox(height: 8), // Jarak kecil

                Align(
                  // Mengatur posisi widget
                  alignment: Alignment.centerRight, // Meletakkan ke kanan
                  child: TextButton(
                    // Tombol teks lupa password
                    onPressed: () {
                      // Aksi saat tombol diklik
                      Navigator.pushNamed(
                        context,
                        '/forgot-password',
                      ); // Pindah ke halaman lupa password
                    }, // Akhir onPressed
                    child: const Text('Lupa Password?'), // Teks tombol
                  ), // Akhir TextButton
                ), // Akhir Align

                const SizedBox(height: 8), // Jarak kecil

                SizedBox(
                  // Mengatur ukuran tombol
                  width: double.infinity, // Lebar tombol memenuhi layar
                  child: ElevatedButton(
                    // Tombol login utama
                    onPressed: isLoading
                        ? null
                        : login, // Jika loading tombol dimatikan, jika tidak jalankan login
                    child:
                        isLoading // Mengecek loading
                        ? const CircularProgressIndicator() // Jika loading tampil animasi loading
                        : const Text(
                            'Login',
                          ), // Jika tidak loading tampil teks Login
                  ), // Akhir ElevatedButton
                ), // Akhir SizedBox

                const SizedBox(height: 12), // Jarak bawah tombol

                if (errorMessage != null) // Jika ada pesan error
                  Text(
                    // Menampilkan pesan error
                    errorMessage!, // Isi pesan error
                    style: const TextStyle(
                      color: Colors.red,
                    ), // Warna teks merah
                  ), // Akhir Text error

                const SizedBox(height: 20), // Jarak bawah error

                const Text('Email: admin@test.com'), // Menampilkan email contoh
                const Text('Password: Admin123'), // Menampilkan password contoh
              ], // Akhir children Column
            ), // Akhir Column
          ), // Akhir Form
        ), // Akhir Padding
      ), // Akhir SafeArea
    ); // Akhir Scaffold
  } // Akhir build
} // Akhir class _LoginScreenState
