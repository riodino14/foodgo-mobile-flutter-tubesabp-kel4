Berikut adalah versi profesional dan lengkap dari **README.md** untuk proyek Flutter *Food Delivery* kelompok Anda berdasarkan semua informasi yang sudah Anda sampaikan:

---

# 🍔 FoodGo - Aplikasi Pemesanan Makanan Berbasis Flutter

> Tugas Besar Aplikasi Berbasis Platform
> IF-46-04 – Informatika S1, Universitas Telkom
> Periode: Maret 2025 – Juni 2025

FoodGo adalah aplikasi pemesanan makanan digital berbasis **Flutter** yang dirancang untuk menyediakan pengalaman food delivery yang sederhana, efisien, dan user-friendly bagi pengguna dan admin. Aplikasi ini mendukung manajemen transaksi, dompet digital, hingga panel admin untuk memantau pesanan secara real-time.

---

## 🚀 Fitur Utama

### Untuk Pengguna (User)

* 🔐 **Registrasi & Login** pengguna
* 🍕 **Lihat Daftar Menu** makanan berdasarkan kategori
* 🛒 **Pemesanan Makanan** dengan sistem dompet digital
* 💼 **Top-up & Riwayat Transaksi**
* 🔍 **Pencarian Menu**
* 📦 **Riwayat Pesanan & Status (Pending / Delivered)**
* 👤 **Manajemen Profil** (lihat data akun, hapus akun, logout)

### Untuk Admin

* 🔐 Login khusus admin
* 👥 **Manajemen Pengguna** (lihat & hapus akun)
* 🧾 **Lihat & Kelola Semua Pesanan**
* 💰 **Pantau Transaksi Dompet**
* 🔍 **Fitur Pencarian data pengguna, transaksi, dan pesanan**

---

## 📱 Teknologi yang Digunakan

| Stack        | Deskripsi                       |
| ------------ | ------------------------------- |
| **Flutter**  | UI Framework utama aplikasi     |
| **Dart**     | Bahasa pemrograman utama        |
| **Firebase** | Autentikasi & Realtime Database |
| **GitHub**   | Version Control & Kolaborasi    |

---

## 🧩 Struktur Proyek

```
tubes_abp/
├── lib/               # Sumber kode utama aplikasi
│   ├── pages/         # Halaman UI (Login, Home, Admin, Wallet, dsb.)
│   ├── models/        # Model data seperti User, Orders
│   ├── services/      # Integrasi Firebase
│   └── widgets/       # Komponen UI custom
├── images/            # Aset gambar (menu, ikon, dll.)
├── android/           # Konfigurasi Android
├── ios/               # Konfigurasi iOS
├── web/               # Konfigurasi Web
├── README.md          # Dokumentasi proyek
└── pubspec.yaml       # Konfigurasi dependency
```

---

## ⚙️ Cara Menjalankan Proyek

1. **Clone Repository**

```bash
git clone https://github.com/riodino14/tubes_abp.git
cd tubes_abp
```

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Jalankan di Emulator/Web**

```bash
flutter run
```

> Pastikan Anda sudah login ke Firebase Console dan mengatur project serta konfigurasi `google-services.json` dan `GoogleService-Info.plist`.

---

## 👨‍💻 Anggota Tim & Pembagian Tugas

| Nama                         | NIM        | Tugas                                                 |
| ---------------------------- | ---------- | ----------------------------------------------------- |
| **Riodino Raihan**           | 1301220413 | UI onboarding & home page                             |
| **Abdurrahman Azzam**        | 1301223137 | UI detail produk, sign up, dan login                  |
| **Rusdi Affandi**            | 1301223361 | Integrasi Firebase dan backend login/signup           |
| **Muhammad Fakhrul Hizrian** | 1301223174 | Backend halaman detail, pemesanan, dan transaksi      |
| **Fauzi Zaidan Pratama**     | 1301223053 | UI & backend Wallet, admin login                      |
| **Faiq Misbah Yazdi**        | 1301223228 | Admin dashboard, manajemen transaksi, fitur pencarian |

---

## 📸 Cuplikan Tampilan

* Page Onboarding
* Sign Up / Login Page
* Home Page (kategori menu)
* Order Page
* Wallet & Riwayat Transaksi
* Admin Dashboard & Order Management

📂 Lihat lebih lanjut di folder `images/`.

---

## 🔮 Pengembangan Selanjutnya

* [ ] Notifikasi Real-time untuk Pesanan
* [ ] Tracking Lokasi Kurir (GPS)
* [ ] Ulasan & Rating Menu
* [ ] Dashboard UMKM (Analytics)

---

## 📄 Lisensi

Proyek ini dibuat sebagai bagian dari tugas besar kuliah dan **tidak untuk keperluan komersial**. Semua hak cipta gambar/menu dimiliki oleh pemilik aslinya.

---

Jika Anda butuh versi README ini dalam bahasa Indonesia penuh atau ingin README bilingual (ENG-ID), saya bisa bantu juga!
