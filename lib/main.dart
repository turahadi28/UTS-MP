import 'package:flutter/material.dart'; // Mengimport package material untuk menggunakan widget Flutter

import 'screens/login_screen.dart'; // Mengimport halaman login
import 'screens/forgot_password_screen.dart'; // Mengimport halaman lupa password
import 'screens/dashboard_screen.dart'; // Mengimport halaman dashboard

void main() {
  // Fungsi utama yang pertama kali dijalankan
  runApp(const MyApp()); // Menjalankan aplikasi dengan widget MyApp
}

class MyApp extends StatelessWidget {
  // Membuat class MyApp sebagai widget stateless
  const MyApp({super.key}); // Constructor MyApp

  @override // Menandakan method build menimpa method bawaan
  Widget build(BuildContext context) {
    // Method untuk membangun tampilan aplikasi
    return MaterialApp(
      // Widget utama aplikasi berbasis Material Design
      debugShowCheckedModeBanner:
          false, // Menghilangkan tulisan debug di pojok kanan atas
      title: 'Shine News', // Judul aplikasi

      initialRoute: '/', // Menentukan halaman pertama yang dibuka

      routes: {
        // Mendaftarkan semua route halaman
        '/': (context) =>
            const LoginScreen(), // Route awal menuju halaman login
        '/forgot-password': (context) =>
            const ForgotPasswordScreen(), // Route menuju halaman lupa password
        '/dashboard': (context) =>
            const DashboardScreen(), // Route menuju halaman dashboard
      }, // Akhir daftar route
    ); // Akhir MaterialApp
  } // Akhir method build
} // Akhir class MyApp
