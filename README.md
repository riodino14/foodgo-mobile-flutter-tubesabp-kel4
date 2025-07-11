

---

# 🍔 FoodGo - Aplikasi Pemesanan Makanan Berbasis Flutter

> Tugas Besar Aplikasi Berbasis Platform
> IF-46-04 – Informatika S1, Universitas Telkom
> Periode: Maret 2025 – Juni 2025

**FoodGo** adalah aplikasi food delivery berbasis Flutter yang dirancang untuk memberikan pengalaman pemesanan makanan yang cepat, sederhana, dan efisien. Aplikasi ini memiliki fitur lengkap untuk pengguna dan admin, termasuk dompet digital, manajemen pesanan, dan tampilan antarmuka yang modern dan responsif.

---

## 🚀 Fitur Utama

### Pengguna

* 🔐 Registrasi dan login akun pengguna
* 🍔 Daftar menu berdasarkan kategori makanan
* 🛒 Pemesanan makanan dengan pengecekan saldo dompet
* 💰 Top-up dan riwayat transaksi dompet
* 📦 Riwayat dan status pesanan (Pending / Delivered)
* 🔍 Pencarian menu makanan
* 👤 Pengelolaan profil pengguna (logout dan hapus akun)

### Admin

* 🔐 Login khusus admin
* 📋 Manajemen data pengguna dan akun
* 🧾 Monitoring semua pesanan pengguna
* 💳 Pemantauan transaksi dompet pengguna
* 🔍 Fitur pencarian pesanan, pengguna, dan transaksi

---

## 🧑‍💻 Teknologi yang Digunakan

| Stack        | Deskripsi                         |
| ------------ | --------------------------------- |
| **Flutter**  | Framework UI utama aplikasi       |
| **Dart**     | Bahasa pemrograman utama          |
| **Firebase** | Autentikasi dan realtime database |
| **GitHub**   | Version control & kolaborasi tim  |

---

## 🧩 Struktur Proyek

```
tubes_abp/
├── lib/               # Kode sumber utama
│   ├── pages/         # Halaman UI (Home, Login, Admin, Wallet, dsb.)
│   ├── models/        # Data model (User, Orders, Menu)
│   ├── services/      # Integrasi ke Firebase
│   └── widgets/       # Komponen UI reusable
├── images/            # Gambar dan ikon menu
├── android/           # Konfigurasi untuk platform Android
├── ios/               # Konfigurasi iOS
├── web/               # Dukungan untuk Flutter Web
├── README.md          # Dokumentasi proyek ini
└── pubspec.yaml       # File dependency dan konfigurasi proyek
```

---

## ⚙️ Cara Menjalankan Proyek

1. **Clone repository**

```bash
git clone https://github.com/riodino14/tubes_abp.git
cd tubes_abp
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Jalankan proyek di emulator atau browser**

```bash
flutter run
```

> Pastikan konfigurasi Firebase sudah terhubung dan file `google-services.json` (Android) serta `GoogleService-Info.plist` (iOS) telah disiapkan sesuai environment.

---

## 📸 Cuplikan Fitur

* ✅ Onboarding Page
* ✅ Halaman Sign Up & Sign In
* ✅ Home Page (Menu Makanan)
* ✅ Halaman Order Makanan
* ✅ Fitur Wallet & Top Up
* ✅ Status Pesanan (Pending / Delivered)
* ✅ Dashboard Admin & Manajemen Pesanan

---

## 🔮 Rencana Pengembangan Lanjutan

* [ ] Notifikasi status pesanan (push notification)
* [ ] Tracking pengantaran berbasis lokasi (GPS)
* [ ] Fitur ulasan dan rating makanan
* [ ] Dashboard analitik untuk mitra restoran

---

## 👨‍👩‍👧‍👦 Anggota Kelompok IF-46-04

| Nama                     | NIM        |
| ------------------------ | ---------- |
| Riodino Raihan           | 1301220413 |
| Abdurrahman Azzam        | 1301223137 |
| Faiq Misbah Yazdi        | 1301223228 |
| Fauzi Zaidan Pratama     | 1301223053 |
| Rusdi Affandi            | 1301223361 |
| Muhammad Fakhrul Hizrian | 1301223174 |

---

## 📄 Lisensi

Proyek ini dibuat untuk keperluan akademik dalam mata kuliah Aplikasi Berbasis Platform di Universitas Telkom. Seluruh konten hanya digunakan untuk keperluan pendidikan.

---
