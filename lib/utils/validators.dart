class Validators {
  // Class khusus untuk validasi input

  static String? email(String? value) {
    // Fungsi validasi email
    if (value == null || value.isEmpty) {
      // Mengecek apakah email kosong
      return 'Email wajib diisi'; // Pesan jika email kosong
    } // Akhir kondisi email kosong

    if (!value.contains('@')) {
      // Mengecek apakah email memiliki simbol @
      return 'Email tidak valid'; // Pesan jika format email salah
    } // Akhir kondisi email tidak valid

    return null; // Mengembalikan null jika email valid
  } // Akhir fungsi validasi email

  static String? password(String? value) {
    // Fungsi validasi password
    if (value == null || value.isEmpty) {
      // Mengecek apakah password kosong
      return 'Password wajib diisi'; // Pesan jika password kosong
    } // Akhir kondisi password kosong

    if (value.length < 8) {
      // Mengecek apakah password kurang dari 8 karakter
      return 'Password minimal 8 karakter'; // Pesan jika password terlalu pendek
    } // Akhir kondisi panjang password

    return null; // Mengembalikan null jika password valid
  } // Akhir fungsi validasi password
} // Akhir class Validators
