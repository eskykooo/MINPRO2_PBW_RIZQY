# Portfolio Website Dinamis - Rizqy / 2409116039 / Sistem Informasi A'2024

Website portfolio personal branding yang menampilkan profil, pengalaman, sertifikat, dan *showcase* project video. Pada versi terbaru ini, website telah di-*upgrade* dari statis menjadi **Dinamis** menggunakan arsitektur backend sederhana dengan PHP dan database MySQL.

Tampilan antarmuka juga telah dirombak ulang menggunakan tema *Modern Dark Mode* dengan elemen *Glassmorphism* dan aksen *Neon Gradients*.

## Teknologi yang Digunakan

* **Frontend:** HTML5, CSS3, Bootstrap 5
* **Backend:** PHP
* **Database:** MySQL
* **Interaktivitas & Optimasi:** Vanilla JavaScript (Intersection Observer API)
* **Styling Khusus:** Custom CSS (Glassmorphism, Neon Gradients)

---

## Penjelasan Code Setiap Section

### 1. Sistem Koneksi Database (`koneksi.php`)
* **Fungsi:** Menjembatani komunikasi antara file UI (`index.php`) dengan server database MySQL agar data bisa dipanggil secara dinamis.
* **Penjelasan Code:** Menggunakan fungsi bawaan `mysqli_connect($host, $user, $pass, $db)`. Terdapat pengkondisian `if (!$conn)` yang akan menjalankan fungsi `die()` jika koneksi gagal. Hal ini penting untuk menghentikan proses *render* jika database mati, sehingga mencegah *error* berantai pada halaman antarmuka.

### 2. Navbar (Navigasi Utama)
* **Tampilan:** Bar navigasi *fixed-top* dengan efek kaca tembus pandang (*Glassmorphism*) yang mem-*blur* konten di bawahnya saat halaman di-*scroll*.
* **Penjelasan Code:** Menggunakan komponen *Navbar* Bootstrap 5. Efek tembus pandang dicapai secara kustom di CSS dengan `backdrop-filter: blur(15px);` dan `background: rgba(5, 5, 5, 0.7)`. Tautan navigasi menggunakan *anchor link* untuk *smooth scrolling* antar *section*.

### 3. Hero Section (Halaman Utama)
* **Tampilan:** Layar penuh (100vh) dengan *background* gradasi radial gelap. Menampilkan foto profil dengan bingkai neon, teks sapaan bergradasi biru, dan tombol *Call-to-Action*.
* **Penjelasan Code:** Teks sapaan tidak lagi di-*hardcode*, melainkan dipanggil dari tabel `profil` menggunakan *Shorthand Echo* PHP: `<?= $profil['nama'] ?>`. Efek teks gradasi modern diatur di CSS menggunakan `background-clip: text;` dan `-webkit-text-fill-color: transparent;`.

### 4. About & Skills Section
* **Tampilan:** Layout 2 kolom (Grid Bootstrap). Menampilkan teks deskripsi, daftar pengalaman, dan *Progress Bar* persentase keahlian. *Progress bar* menggunakan warna gradasi *neon* spesifik (Ungu untuk After Effects, Pink untuk Premiere Pro, Biru untuk Photoshop).
* **Penjelasan Code:** Data di-*render* secara dinamis menggunakan perulangan PHP: `while($row = mysqli_fetch_assoc($query)) : ... endwhile;`.
    * Lebar *progress bar* merespons data database secara langsung dengan menyisipkannya pada *inline CSS*: `style="width: <?= $skill['persentase'] ?>%;"`. Angka persentase diposisikan di atas *bar* agar UI terlihat lebih *clean*.

### 5. Certificates Section
* **Tampilan:** Menampilkan deretan kartu (*card*) sertifikat. Saat disorot kursor (*hover*), kartu akan melayang naik dan memancarkan efek cahaya (*glow shadow*) kebiruan.
* **Penjelasan Code:** Menggunakan sistem *Grid* Bootstrap (`col-md-4`). Konten gambar dan teks kartu di-*generate* otomatis melalui *looping* PHP dari tabel `sertifikat`. Animasi transisi menggunakan CSS `transform: translateY(-10px)` dan `box-shadow`.

### 6. Project Video Showcase
* **Tampilan:** Menampilkan hasil karya video (*mp4*) dalam *grid* kartu dengan sudut membulat (*rounded*).
* **Penjelasan Code:** File video dipanggil secara dinamis dari tabel `projek`. Video dibungkus dengan tag HTML5 `<video preload="metadata" muted loop playsinline>` untuk optimasi *loading* awal.

### 7. Optimasi Performa Video (JavaScript)
* **Fungsi:** Mencegah *browser freeze* (kelebihan beban RAM/CPU) akibat memuat banyak video sekaligus, serta mengakali aturan pemblokiran *Autoplay Audio* oleh *browser*.
* **Penjelasan Code:**
    * **Intersection Observer API:** Memantau elemen `.video-lazy`. Jika video masuk ke dalam area pandang (minimal 50%), perintah `video.play()` otomatis dijalankan. **Krusial:** Saat video di-*scroll* dan keluar dari layar, `video.pause()` dieksekusi agar sistem tidak terbebani proses latar belakang.
    * **Event Listener Audio:** Menggunakan *event* `mouseenter` untuk mengeksekusi `video.muted = false` (memunculkan suara saat di-*hover*), dan `mouseleave` untuk mengembalikannya menjadi senyap.

 ---

## Tampilan Website

### Halaman Utama
<img width="1899" height="955" alt="image" src="https://github.com/user-attachments/assets/b6412398-1683-4910-ba75-feb4ac5df521" />

### Halaman Tentang
<img width="1897" height="956" alt="image" src="https://github.com/user-attachments/assets/5f588f26-e7e3-40a0-8034-fa6067edc860" />

### Halaman Sertifikat
<img width="1901" height="956" alt="image" src="https://github.com/user-attachments/assets/eebe11fb-03bc-40fd-9d77-7affe27bbf1b" />

### Halaman Projek
<img width="1899" height="950" alt="image" src="https://github.com/user-attachments/assets/a0372966-c0da-444c-803b-75c43b1a4e20" />
