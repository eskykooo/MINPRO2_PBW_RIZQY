<?php
include 'koneksi.php';

$profil = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM profil WHERE id = 1"));
$pengalaman_query = mysqli_query($conn, "SELECT * FROM pengalaman");
$skills_query = mysqli_query($conn, "SELECT * FROM skills");
$sertifikat_query = mysqli_query($conn, "SELECT * FROM sertifikat");
$projek_query = mysqli_query($conn, "SELECT * FROM projek");
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio <?= $profil['nama'] ?></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css?v=<?= time(); ?>">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">My Mine Portofolio Guweh</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#home">Halaman Utama</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">Tentang</a></li>
                <li class="nav-item"><a class="nav-link" href="#certificates">Sertifikat</a></li>
                <li class="nav-item"><a class="nav-link" href="#project">Projek</a></li>
            </ul>
        </div>
    </div>
</nav>

<section id="home" class="hero d-flex align-items-center text-center">
    <div class="container">
        <img src="assets/img/profil.jpeg" class="rounded-circle mb-3 profile-img" alt="Profile" width="150" height="150">
        <h1 class="fw-bold">Halo, Saya <?= $profil['nama'] ?></h1>
        <p class="lead"><?= $profil['deskripsi_hero'] ?></p>
        <a href="#about" class="btn btn-primary mt-3">Tentang Saya</a>
    </div>
</section>

<section id="about" class="py-5">
    <div class="container">
        <h2 class="text-center mb-4 fw-bold">About Me</h2>

        <div class="row">
            <div class="col-md-6">
                <h5>Deskripsi</h5>
                <p><?= $profil['deskripsi_about'] ?></p>

                <h5 class="mt-4">Pengalaman</h5>
                <ul>
                    <?php while($pengalaman = mysqli_fetch_assoc($pengalaman_query)) : ?>
                        <li><?= $pengalaman['nama_pengalaman'] ?></li>
                    <?php endwhile; ?>
                </ul>
            </div>

            <div class="col-md-6">
                <h5 class="mb-4">Skills</h5>
                <?php while($skill = mysqli_fetch_assoc($skills_query)) : ?>
                    <div class="d-flex justify-content-between align-items-end">
                        <p class="mb-1"><?= $skill['nama_skill'] ?></p>
                        <small class="mb-1 fw-bold" style="color: #00c6ff;"><?= $skill['persentase'] ?>%</small>
                    </div>
                    <div class="progress mb-4">
                        <div class="progress-bar <?= $skill['kelas_css'] ?>" style="width: <?= $skill['persentase'] ?>%;"></div>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</section>

<section id="certificates" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-4 fw-bold">Certificates</h2>

        <div class="row g-4">
            <?php while($sertif = mysqli_fetch_assoc($sertifikat_query)) : ?>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img src="<?= $sertif['gambar'] ?>" class="card-img-top" alt="Certificate" loading="lazy" width="100%" style="height: auto;">
                    <div class="card-body">
                        <h5 class="card-title"><?= $sertif['judul'] ?></h5>
                        <p class="card-text"><?= $sertif['deskripsi'] ?></p>
                    </div>
                </div>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>

<section id="project" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-4 fw-bold">Projects Video Showcase</h2>

        <div class="row g-4">
            <?php while($projek = mysqli_fetch_assoc($projek_query)) : ?>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <video class="video-round video-lazy" preload="metadata" muted loop playsinline width="100%" height="auto" style="background: #121212;">
                        <source src="<?= $projek['video_url'] ?>" type="video/mp4">
                    </video>
                </div>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>

<footer class="bg-dark text-white text-center py-3">
    <p class="mb-0">© 2026 <?= $profil['nama'] ?> | Sistem Informasi A</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
<script defer>
    document.addEventListener("DOMContentLoaded", () => {
        const videos = document.querySelectorAll('.video-lazy');

        const videoObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                const video = entry.target;
                
                if (entry.isIntersecting) {
                    video.play().catch(err => console.log(err));
                } else {
                    video.pause();
                    video.muted = true;
                }
            });
        }, { threshold: 0.5 });

        videos.forEach(video => {
            videoObserver.observe(video);

            video.addEventListener("mouseenter", () => {
                video.muted = false; 
                video.play().catch(err => console.log(err));
            });

            video.addEventListener("mouseleave", () => {
                video.muted = true; 
            });
        });
    });
</script>

</body>
</html>