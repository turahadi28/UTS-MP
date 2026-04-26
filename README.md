# 📱 SHINE NEWS - UTS Mobile Programming

## 👨‍🎓 Identitas

* Nama: I GUSTI NGURAH ADI PRAYOGA
* NIM: 2401020048
* Prodi: Rekayasa Sistem Komputer
* Semester: 4
* Mata Kuliah: Mobile Programming

---

## 📌 Deskripsi Aplikasi

Aplikasi **Shine News** adalah aplikasi Flutter sederhana yang dibuat untuk memenuhi tugas UTS Mobile Programming.

Aplikasi ini memiliki 3 halaman utama:

* 🔐 Login
* 🔑 Lupa Password
* 📊 Dashboard (menampilkan berita)

---

## 🔐 Login

Fitur login menggunakan:

* Form validation (email & password)
* State management menggunakan `setState`
* Snackbar untuk feedback user

### 📥 Data Login

```
Email    : admin@test.com
Password : Admin123
```

---

## 🔑 Lupa Password

Fitur:

* Input email
* Validasi email
* Simulasi kirim link reset password
* Feedback menggunakan Snackbar

---

## 📊 Dashboard

Fitur:

* Menampilkan data berita (dummy)
* Menggunakan `ListView.builder`
* Menggunakan `Card` sebagai tampilan
* Menampilkan nama/email user
* Tombol logout

---

## 🧱 Struktur Folder

```
lib/
├── main.dart
├── models/
│   └── news_model.dart
├── screens/
│   ├── login_screen.dart
│   ├── forgot_password_screen.dart
│   └── dashboard_screen.dart
├── utils/
│   └── validators.dart
└── widgets/
    ├── input_field.dart
    └── news_card.dart
```

---

## 🧩 Widget yang Digunakan

🧱 Struktur Dasar
Scaffold
→ Kerangka utama halaman (mengatur AppBar, body, dll)
AppBar
→ Header di bagian atas halaman (judul & tombol)

📝 Tampilan
Text
→ Menampilkan tulisan di layar
Icon
→ Menampilkan gambar icon (seperti email, lock, logout)

🔘 Button
ElevatedButton
→ Tombol utama dengan tampilan menonjol (contoh: Login)
TextButton
→ Tombol sederhana berupa teks (contoh: Lupa Password)

📐 Layout (Pengaturan Posisi)
Column
→ Menyusun widget secara vertikal (atas ke bawah)
Padding
→ Memberikan jarak di dalam widget
SizedBox
→ Memberikan jarak antar widget

🧾 Form & Input
Form
→ Pembungkus untuk validasi input
TextFormField
→ Input text yang bisa divalidasi (email & password)

📊 Data & List
ListView.builder
→ Menampilkan data list secara dinamis (efisien)

🎨 UI Card
Card
→ Membuat tampilan kotak dengan bayangan
ListTile
→ Isi dalam Card (icon + teks + layout rapi)

🔔 Feedback ke User
SnackBar
→ Menampilkan pesan sementara di bawah layar (login berhasil/gagal)

⏳ Loading
CircularProgressIndicator
→ Menampilkan animasi loading saat proses berlangsung

---

## 🔄 Navigasi

Menggunakan **Named Routes**:

* `/` → Login
* `/forgot-password` → Lupa Password
* `/dashboard` → Dashboard

---

## 🖼️ Assets

Semua gambar disimpan dalam folder:

```
assets/
```

Dan didaftarkan di `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/
```

---

## ▶️ Cara Menjalankan

1. Buka project Flutter
2. Jalankan perintah:

```
flutter pub get
```

3. Jalankan aplikasi:

```
flutter run
```

---




## 📱 Tampilan Aplikasi

### 🔐 Menu Login
<p align="center">
  <img src="https://i.imgur.com/m4WJXpY.png" width="300">
</p>

### 🔑 Menu Lupa Password
<p align="center">
  <img src="https://i.imgur.com/7ltcsIM.png" width="300">
</p>

### 🏠 Dashboard
<p align="center">
  <img src="https://i.imgur.com/sqHM6jw.png" width="300">
</p>





## 🎯 Kesimpulan

Aplikasi ini dibuat sederhana namun sudah memenuhi semua ketentuan UTS:

* 3 halaman utama
* Validasi form
* State management
* Navigasi
* List data pada dashboard

---
