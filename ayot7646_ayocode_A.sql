-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2022 at 07:45 AM
-- Server version: 10.3.34-MariaDB-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayot7646_ayocode_A`
--

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts`
--

CREATE TABLE `canvas_posts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_image_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_posts`
--

INSERT INTO `canvas_posts` (`id`, `slug`, `title`, `summary`, `body`, `published_at`, `featured_image`, `featured_image_caption`, `user_id`, `meta`, `created_at`, `updated_at`, `deleted_at`) VALUES
('01266d9a-88f4-4396-b20d-eb8438778728', 'upside-down-numbers-algorithm-data-structure', 'Upside Down Numbers (Algorithm & Data Structure )', 'Consider the numbers 6969 and 9116. When you rotate them 180 degrees (upside down), these numbers remain the same. To clarify, if we write them down on a paper and turn the paper upside down, the numbers will be the same.', '<p>Consider the numbers&nbsp;<code style=\"color: var(--color-ui-text-hc);\">6969</code>&nbsp;and&nbsp;<code style=\"color: var(--color-ui-text-hc);\">9116</code>. When you rotate them&nbsp;<code style=\"color: var(--color-ui-text-hc);\">180 degrees</code>&nbsp;(upside down), these numbers remain the same. To clarify, if we write them down on a paper and turn the paper upside down, the numbers will be the same. Try it and see! Some numbers such as&nbsp;<code style=\"color: var(--color-ui-text-hc);\">2</code>&nbsp;or&nbsp;<code style=\"color: var(--color-ui-text-hc);\">5</code>&nbsp;don\'t yield numbers when rotated.</p><p>Given a range, return the count of upside down numbers within that range. For example,&nbsp;<code style=\"color: var(--color-ui-text-hc);\">solve(0,10) = 3</code>, because there are only&nbsp;<code style=\"color: var(--color-ui-text-hc);\">3</code>&nbsp;upside down numbers&nbsp;<code style=\"color: var(--color-ui-text-hc);\">&gt;= 0 and &lt; 10</code>. They are&nbsp;<code style=\"color: var(--color-ui-text-hc);\">0, 1, 8</code>.</p><h2>My Solution : </h2><p><code>Note: My codes may not effective enough if you trying to give large input/range</code></p><pre class=\"ql-syntax\" spellcheck=\"false\">function upsideDown(a, b) {\n&nbsp; &nbsp;&nbsp;\n&nbsp; let counter = 0;\n&nbsp; const specialNum = [0, 1, 8];\n&nbsp;&nbsp;\n&nbsp; for (let i = parseInt(a); i &lt; parseInt(b); i++) {\n&nbsp;\n&nbsp; &nbsp; num = i.toString();\n&nbsp; &nbsp;&nbsp;\n&nbsp; &nbsp; let isPalindrom = true; //suppose the number of current iteration is having same value if we flip it up.\n&nbsp; &nbsp;&nbsp;\n&nbsp; &nbsp; for (j = 0; j &lt;= Math.floor(num.length / 2); j++) {\n&nbsp; &nbsp; &nbsp; if (num[j] == \"6\") {\n&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;\n&nbsp; &nbsp; &nbsp; &nbsp; if (!(parseInt(num[num.length - (j + 1)]) - parseInt(num[j]) == 3)) {\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isPalindrom = false;\n&nbsp; &nbsp; &nbsp; &nbsp; }\n&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;\n&nbsp; &nbsp; &nbsp; } else if (num[j] == \"9\") {\n&nbsp;&nbsp;\n&nbsp; &nbsp; &nbsp; &nbsp; if (!(parseInt(num[num.length - (j + 1)]) - parseInt(num[j]) == -3)) {\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isPalindrom = false;\n&nbsp; &nbsp; &nbsp; &nbsp; }\n\n\n&nbsp; &nbsp; &nbsp; } else {\n&nbsp; &nbsp; &nbsp; &nbsp; if ( !(specialNum.includes(parseInt(num[j]))) &amp;&amp; !(specialNum.includes(parseInt(num[num.length - (j + 1)]))) ) {\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isPalindrom = false;\n&nbsp; &nbsp; &nbsp; &nbsp; } else {\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ( !((parseInt(num[j]) == parseInt(num[num.length - (j + 1)]))) ) {\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isPalindrom = false;\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }\n&nbsp; &nbsp; &nbsp; &nbsp; }\n\n\n&nbsp; &nbsp; &nbsp; }\n&nbsp; &nbsp; }\n\n\n&nbsp; &nbsp; if(isPalindrom) {\n&nbsp; &nbsp; &nbsp; &nbsp; counter++\n&nbsp; &nbsp; }\n&nbsp; }\n&nbsp;\n&nbsp; return counter;\n}\n</pre><p>Visits My Codewars</p>', '2021-08-04 15:19:00', '/storage/canvas/images/2dMnKUSZPUnjiIpWHoY96wYqRDP5h7ytUg62io7S.jpg', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":\"Consider the numbers 6969 and 9116. When you rotate them 180 degrees (upside down), these numbers remain the same. To clarify, if we write them down on a paper and turn the paper upside down, the numbers will be the same.\",\"title\":\"Upside Down Numbers (Algorithm & Data Structure )\",\"canonical_link\":null}', '2021-08-06 16:19:44', '2021-10-13 06:18:02', NULL),
('1a026c26-964b-4974-ab22-2374f9250a0f', 'cara-membuat-segitiga-piramida-dengan-for-loop-di-bahasa-c-c', 'Cara membuat segitiga piramida dengan for loop di bahasa C/C++', 'bagaimana cara membuat segitiga piramida dengan bahasa pemrograman C?. sangat mudah kawan!', '<p>Yaps, Kali ini  sayang akan membagikan bagaimana cara membuat segitiga piramida dengan bahasa pemrograman C.</p><p><strong>Contohnya sepert ini:</strong></p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"\" src=\"/storage/canvas/images/GbIuOnSDsl4mjzsLgdF3fKufBjWoK5bufkp01U1s.png\"></div><h2><strong>  Oke kita bahas,</strong></h2><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"\" src=\"/storage/canvas/images/mw2Nc5TZgmUCd49XHIEmF85k6rL3AHkOcSSZk4Jw.png\"></div><p>Jadi agar bisa membentuk segitiga piramida, dibutuhkan karakter bantu, yaitu whitespace -&gt; (\" \") atau spasi,</p><p><code>NOTE: pada gambar diatas karakter whitespace di ilustrasikan dengan tanda petik satu (\')</code></p><p>gimana kalau tidak menggunakan whitespace?</p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"\" src=\"/storage/canvas/images/WDkhkPQgQfKw9Qammstc4KSYlFap4VTjnw51FsYg.png\"></div><p>nah kurang lebih hasilnya akan seperti itu, kenapa?</p><p>karena kita harus memberi tau komputer untuk mencetak whitespace agar karakter bintangnya menjorok ke kanan untuk setiap baris bintang</p><h2><strong>Lalu gimana algoritma nya bekerja?</strong></h2><p>kita ambil input, n = 5 </p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"\" src=\"/storage/canvas/images/JnQuubN0k2QjLN6exQxIFFWH9RPB6fZpalh1wBdE.png\"></div><p>disini saya memasukkan input untuk variable n = 5, artinya kita akan membuat segitiga dengan tinggi 5,</p><p><strong>Analisis:</strong></p><p>	untuk baris ke 1, jumlah karakter = 4 whitespace + 1 bintang</p><p>	untuk baris ke 2, jumlah karakter = 3 whitespace + 3 bintang</p><p>	untuk baris ke 3, jumlah karakter = 2 whitespace + 5 bintang</p><p>	untuk baris ke 4, jumlah karakter = 1 whitespace + 7 bintang</p><p>	untuk baris ke 5, jumlah karakter = 0 whitespace + 9 bintang</p><p><strong>Untuk whitespace terus berkurang jumlahnya, sedangkan bintang terus bertambah</strong></p><p><code>atau bisa dirumuskan:&nbsp;  rows = (n-i) + (2i - 1)</code></p><p>dimana: n = input, i = current iteration</p><p>Contoh kode di bahasa C :</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">()</span> </span>{\n\n&nbsp;&nbsp;<span class=\"hljs-keyword\">int</span> N = <span class=\"hljs-number\">5</span>;\n&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;<span class=\"hljs-comment\">//untuk outter loop ini digunakan untuk&nbsp;</span>\n&nbsp;&nbsp;<span class=\"hljs-comment\">//mencetak baris segitiga (tinggi)&nbsp;</span>\n&nbsp;&nbsp;<span class=\"hljs-comment\">//sebanyak N baris.</span>\n&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;<span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">int</span> i = <span class=\"hljs-number\">1</span>; i &lt;= N; i++) {\n\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">//untuk perulangan ini, digunakan&nbsp;</span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">//untuk mencetak karakter whitespace,</span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">//yang mana akan terus berkurang dari (n - 1) hingga 0.</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">for</span>(<span class=\"hljs-keyword\">int</span> j = N; j &gt; i; j--) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\" \"</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">//untuk perulangan ini, digunakan untuk mencetak karakter bintang,</span>\n    <span class=\"hljs-comment\">//yang mana akan terus bertamah mulai dari 1 hingga N bintang. </span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">for</span>(<span class=\"hljs-keyword\">int</span> k = <span class=\"hljs-number\">1</span>; k &lt;= i + (i<span class=\"hljs-number\">-1</span>); k++) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"*\"</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"\\n\"</span>); cetak baris berikutnya\n&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;\n}\n</pre><p>jika kurang paham bisa nonton video saya ya :))</p>', '2021-10-12 10:48:00', '/storage/canvas/images/8G1HfDa5AY1JEoEzGFONtqh6WIe0NEYhBP9bFCYb.jpg', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":\"bagaimana cara membuat segitiga piramida dengan bahasa pemrograman C?. sangat mudah kawan!\",\"title\":\"Cara membuat segitiga piramida dengan for loop di bahasa C\\/C++\",\"canonical_link\":null}', '2021-10-01 15:05:34', '2021-10-12 10:50:40', NULL),
('1e734a59-866f-4cde-a0b4-e9a4ed7032f0', 'post-1e734a59-866f-4cde-a0b4-e9a4ed7032f0', 'Kenalan sama Flutter!', 'Perkenalan Flutter', '<p>Hei! Welcome to my very first article. Let me introduce myself in a seconds. My name is Jonathan and I\'m a Junior Flutter Developer. So... Salam kenal ya!!</p><p>Pada artikel ini gua mau ngajakin kalian semua buat kenalan sama Flutter. Tapi gua penasaran deh, kalian udah pernah denger soal Flutter belum sebelumnya? Kalau belum tenang aja, karna gua bakal jelasin se-detail mungkin tentang Flutter dan gua juga usahakan supaya bahasanya gampang untuk dimengerti buat kalian yang benar-benar baru di dunia programming dan memilih Flutter sebagai titik awal petualangan kalian.</p><hr><h2><strong>Kenapa Flutter Dibuat?</strong></h2><p>Sebelum gua mulai ke materinya, gua ada sedikit ilustrasi untuk kalian yang gak punya gambaran soal mobile app development. </p><p>Let\'s say gua punya teman yang namanya Budi. Budi adalah seorang senior Ios Developer dan dia punya banyak portfolio yang keren, salah satunya aplikasi yang bisa bantu kalian mencari lagu atau film sesuai dengan mood kalian. Sebagai seorang Ios Developer, tentu Budi akan mem-publish aplikasinya di App Store untuk target pasar pengguna Iphone or Ipad. </p><p>Dan seiring berjalannya waktu, ternyata aplikasi yang Budi bangun menjadi sangat terkenal dan tentu beberapa user Android juga ingin merasakan experience yang sama. Sehingga tiap-tiap hari permintaan aplikasi tersebut dalam versi Android semakin tinggi. So akhirnya Budi memutuskan untuk mempelajari Android App Development.</p><p>Setelah beberapa bulan akhirnya Budi berhasil merilis aplikasinya untuk pengguna Android. It\'s a good news buat para user, tapi mungkin bukan berita yang terbaik untuk Budi. Karna sekarang dia harus mengurus dua codebase yang berbeda, dan mem-publish aplikasinya ke dua tempat yang berbeda pula. Pasti akan sangat merepotkan bukan?</p><p>Nah, berangkat dari beberapa keresahan tersebut akhirnya diciptakanlah Flutter untuk membantu kita para Mobile App Developer dalam membangun aplikasi untuk android dan juga ios hanya dalam satu codebase saja. Bagaimana sampai sini sudah mengerti kenapa Flutter dibuat? Kalau belum mungkin bisa dibaca lagi dan dipahami dengan baik. Dan jika sudah paham, sekarang kita masuk ke menu utamanya.</p><h2><strong>Flutter Itu Apa Sih?</strong></h2><p>Flutter adalah sebuah \"tool\" yang dapat membantu kalian membangun sebuah native cross-platform apps hanya dengan menggunakan satu bahasa pemrograman dan satu codebase. Wah asik banget kan?</p><p>Ada beberapa hal yang perlu digaris bawahi nih.</p><p>Pertama, native cross-platform. Sebelum Flutter hadir, kita perlu pelajari banyak hal dalam membuat aplikasi mobile untuk dua service yang berbeda. Untuk Ios sendiri, kita perlu belajar mengenai Swift atau Objected C untuk dapat membangun sebuah aplikasi yang dapat kita pakai pada device Apple. Sedangkan untuk Android sendiri kita perlu belajar mengenai Java atau Kotlin. Terdengar rumit bukan?</p><p>Kedua, kita hanya butuh satu bahasa pemrograman saja. Lalu Flutter pakai bahasa apa dong? Jadi untuk Flutter sendiri menggunakan Dart, dan otomatis kita hanya perlu mempelajari satu bahasa saja untuk dapat membangun aplikasi menggunakan Flutter. Keren banget kan? Dengan hadirnya Flutter, para developer pasti akan sangat terbantu sekali.</p><p>Dan terakhir, satu codebase. Karna kita hanya butuh satu bahasa saja yaitu Dart, sehingga kita hanya perlu menulis satu buah codebase saja untuk dua aplikasi yang dapat berjalan di dua platform yang berbeda pula. Lalu apa keuntungannya? Dengan satu codebase, akan memudahkan saat kita akan menambahkan fitur baru, atau sekedar memperbaiki bugs dan error pada aplikasi kita. Mantap banget memang Flutter ini.</p><h2><strong>Cara Kerja Flutter</strong></h2><p>Sampai sini mungkin mulai muncul berbagai pertanyaan di benak kalian. Kok bisa kayak gitu ya? Cara kerjanya gimana?</p><p>Tenang guys, gua jelasin kok wkwk.</p><p>Berdasarkan pemahaman yang sudah kita bahas tadi, Flutter itu adalah tool pembantu, lebih tepatnya adalah SDK dan juga sebuah Framework. Kita bahas satu-satu...</p><p>Pada dasarnya Flutter adalah sebuah SDK (Software Development Kit) yang pada akhirnya memungkinkan kita membuat aplikasi cross-platform. Simplenya SDK itu adalah tools yang dapat men-terjemahkan atau men-compile code yang kita buat menjadi native machine code. Sehingga akhirnya kita dapat menggunakan Flutter untuk Ios apps dan Android Apps.</p><p>Dan untuk Framework sendiri dapat dikatakan sebagai sebuah library yang sudah disediakan sehingga kita bisa membuat button, atau mungkin mengatur layout menggunakan column atau row. Dan semua library tersebut dinamakan dengan widget.</p><p>Ohh ya, kita membangun aplikasi Flutter menggunakan widget-widget yang kita susun satu persatu. Mungkin bisa diibaratkan seperti kita menyusun lego block. Karna pada dasarnya aplikasi Flutter hanyalah canvas kosong, dan kita akan melukiskan canvas tersebut menggunakan susunan widget yang sudah disediakan.</p><p><br></p><p>Wahh cukup panjang ya pembahasan kita. Mungkin untuk permulaan info diatas sudah sangat cukup untuk kalian memahami Flutter. Kedepannya gua juga bakal tulis lebih banyak artikel mengenai Flutter. Dan buat kalian yang ingin melihat dokumentasi resmi dari Flutter bisa klik link <a href=\"https://flutter.dev/\" rel=\"noopener noreferrer\" target=\"_blank\">berikut</a>.   </p><p>Oke sekian dari gua, terimakasih buat kalian yang sudah baca dari awal hingga akhir. Semoga bisa membantu kalian yang baru mau belajar Flutter. </p><p>Peace! ✌️</p>', '2021-09-05 13:29:00', '/storage/canvas/images/m8nf4QlSUFcxuCjDp0svkfwiWPuPXrTB4RNUFWoU.jpg', NULL, '7bf903f6-0649-4cab-9bc7-fcde811998e8', '{\"description\":\"Dasar Flutter\\nPerkenalan Flutter\\nBasic Flutter\",\"title\":\"Flutter\",\"canonical_link\":null}', '2021-09-05 12:02:57', '2021-09-05 13:43:17', NULL),
('2b5c2910-95fc-4a3c-b58c-27c825d6a425', 'belajar-mysql-1-pengenalan', 'Belajar MySQL - 1. Pengenalan', 'MySQL adalah Software yang digunakan sebagai Database Management System ( DBMS ). MySQL menganut model database relasional, oleh karena itu MySQL disebut sebagai Relational Database Management System ( RDBMS ).', '<p><strong>Apa itu MySQL?</strong></p><p>MySQL adalah Software yang digunakan sebagai Database Management System ( DBMS ). MySQL menganut model database relasional, oleh karena itu MySQL disebut sebagai Relational Database Management System ( RDBMS ).</p><p><strong>Kenapa harus MySQL?</strong></p><ul><li>Fleksibel</li><li>Peforma Tinggi</li><li>Lintas Platform</li><li>Gratis</li><li>Proteksi Data yang Andal</li><li>Komunitas Luas</li></ul><p>Oke tanpa panjang lebar lagi kita lanjut ke pembelajaran dasar mysql (<em> </em><a href=\"http://127.0.0.1:8000/blogs/posts/cara-install-mysql-di-windows-linux\" rel=\"noopener noreferrer\" target=\"_blank\"><em>cara instal mysql di windows</em></a> )</p><p><code><strong>NOTE: </strong>pada tutorial ini saya menggunakan os linux, jika kawan\" menggunakan os windows juga tidak masalah karena pada dasarnya sama saja</code></p><hr><h3><strong>Menjalankan Program RDBMS MySQL</strong></h3><p>buka terminal ( cmd jika di windows ) lalu masuk ke directory bin di mana software mysql terinstall</p><p>Ketik Perintah berikut untuk login ke console MySQL</p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"login ke console mysql\" src=\"/storage/canvas/images/thEnPhxootM2QSdheYgqeymx6IGeLGmhL6xiXqSR.png\"><p>login ke console mysql</p></div><p>disini saya menggunakan user root ( tanpa password ), jika kawan\" ingin menggunakan user lain tinggal disesuaikan saja ya. Jika login dengan user dan password maka perintahnya menjadi :</p><p><code>mysql -u &lt;nama user&gt; -p &lt;password&gt;&nbsp;</code></p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"MySQL Bash\" src=\"/storage/canvas/images/cjveVBKAP96ZPSZ5a563i47OcJUO9ZzIHYCtOjOH.png\"><p>MySQL Bash</p></div><p>jika berhasil login, kita akan masuk ke console mysql seperti gambar diatas,di tutorial ini saya menggunakan MySQL/MariaDB versi 10.14.8.</p><p>untuk menampilkan database dengan perintah <code>SHOW DATABASES; </code></p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"Diatas adalah database saya\" src=\"/storage/canvas/images/s0RaMTpehAyZ77deAFFPQ2RQsoIuolt6BHOod3nV.png\"><p>Diatas adalah database saya</p></div><p>jika ingin membuat database baru gunakan perintah: <code>CREATE DATABASE &lt;nama database&gt;;</code> misal seperti berikut:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-attribute\">CREATE</span> DATABASE perpustakaan;\n</pre><p>untuk memilih/select database gunakan perintah <code>USE &lt;nama database&gt;;</code> misal seperti berikut:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-attribute\">USE</span> DATABASE perpustakaan;\n</pre><p>sampai sini kawan\" sudah dapat melakukan perintah ke server MySQL, misalnya untuk menulis query, melakukan backup dan restore data, dll.</p><p>Contoh membuat table buku:</p><div class=\"embedded_image\" contenteditable=\"false\" data-layout=\"default\"><img alt=\"Perintah dasar membuat database\" src=\"/storage/canvas/images/gHWJA2XRHfqZcacJqWtm2XH8cVs5kJsmxw4kgA2T.png\"><p>Perintah dasar membuat database</p></div><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> buku ( \n&nbsp;&nbsp;&nbsp;nama <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">255</span>), \n&nbsp;&nbsp;&nbsp;pengarang <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">255</span>), \n&nbsp;&nbsp;&nbsp;penerbit <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">255</span>), \n&nbsp;&nbsp;&nbsp;deskripsi <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">255</span>) \n);\n</pre><div class=\"embedded_image\" data-layout=\"default\" contenteditable=\"false\"><img alt=\"\" src=\"http://127.0.0.1:8000/storage/canvas/images/FABcswJMnm52yNBbZ20yzfKwqRdZadO1rbSS4Be9.png\"></div><p>Oke sampai sini saja pengenalan MySQL, semoga kawan\" sudah paham pengoperasian dasar MySQL.</p><p><em>Whats next? Syntax - syntax dasar mysql</em></p>', '2021-07-25 03:44:00', '/storage/canvas/images/JKbCU8dl5vN5wVGbnsc1VJXKhA64z7pFmwPUW3A9.png', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":\"MySQL adalah Software yang digunakan sebagai Database Management System ( DBMS ). MySQL menganut model database relasional, oleh karena itu MySQL disebut sebagai Relational Database Management System ( RDBMS ).\",\"title\":\"Apa itu MySQL\",\"canonical_link\":null}', '2021-07-29 05:44:32', '2021-08-06 16:12:22', NULL),
('4ea84529-6abd-4c42-9242-86d5fcc8c76a', 'post-4ea84529-6abd-4c42-9242-86d5fcc8c76a', 'Cara perbesar Penis', NULL, '<p>lakukan kocokan 5 kali sehari</p>', '2021-07-29 12:46:00', NULL, NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":null,\"title\":null,\"canonical_link\":null}', '2021-07-29 05:46:52', '2021-07-29 06:00:24', '2021-07-29 06:00:24'),
('7332ae95-d5a0-4a34-9bb7-000f31d7fb10', 'apa-sih-database-itu', 'Apa sih Database Itu?', 'Database didefinisikan sebagai kumpulan data yang terintegrasi dan diatur sedemikian rupa sehingga data tersebut dapat dimanipulasi, diambil, dan dicari secara cepat.', '<p>Apa itu Database? Database didefinisikan sebagai kumpulan data yang terintegrasi dan diatur sedemikian rupa sehingga data tersebut dapat dimanipulasi, diambil, dan dicari secara cepat.</p><p>Selain berisi data, database juga berisi metadata. Database memiliki beberapa model diantaranya adalah model relasional. Dalam model relasional, tabel - tabel yang terdapat dalam suatu database idealnya harus saling berelasi.</p><p><br></p><p><br></p>', '2021-07-26 21:43:00', '/storage/canvas/images/Fv30tmNJ52B9MXfEfj4vsp1Y6qgqIxFoAun8wLdt.png', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":\"Database didefinisikan sebagai kumpulan data yang terintegrasi dan diatur sedemikian rupa sehingga data tersebut dapat dimanipulasi, diambil, dan dicari secara cepat.\",\"title\":\"Apa itu Database\",\"canonical_link\":null}', '2021-07-29 05:43:40', '2021-08-06 16:07:46', NULL),
('9947fca4-0310-4878-8f6a-a33a2970218b', 'cara-install-mysql-di-windows', 'Cara install MySQL di Windows', NULL, '<p>Oke disini saya akan membagikan bagaimana cara instalasi program mysql di linux dan windows.</p>', '2021-07-28 08:42:00', '/storage/canvas/images/c6hFttDR0OB5WPtvu1VvnrfKBGHHegNzPSoig91s.png', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":null,\"title\":null,\"canonical_link\":null}', '2021-07-29 05:42:08', '2021-08-06 16:06:14', NULL),
('b40d21f0-0aa1-49da-879f-9696b84f07d4', 'solved-array-of-all-primes-up-to-number-n-with-javascript', 'Solved Array of all primes up to number N (with JavaScript)', 'How to search prime number with javascript', '<p>Mari mulai dari definisi bilangan prima. Apa itu bilangan prima ?</p><blockquote>A prime number is a whole number greater than 1 with exactly two divisors: 1 and itself. For example, 2 is a prime number because it is only divisible by 1 and 2. In contrast, 4 is not prime since it is divisible by 1, 2 and 4. (freecodecamp.com)</blockquote><p>Dalam definisinya, saya menemukan dua kunci dalam bilangan prima, yaitu<em> </em><strong>bilangan tersebut harus lebih dari 1</strong> dan <strong>bilangan tersebut memiliki dua faktor pembagi yaitu 1 dan bilangan itu sendiri. </strong></p><p>Perhatikan code berikut : </p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">const</span> primeArray = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\">n</span>) </span>{\n&nbsp;<span class=\"hljs-keyword\">var</span> primeArray = [];\n&nbsp;<span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">let</span> i = <span class=\"hljs-number\">2</span>; i &amp;lt;= n; i++) {\n&nbsp;&nbsp;<span class=\"hljs-keyword\">let</span> factor = <span class=\"hljs-number\">0</span>;\n&nbsp;&nbsp;<span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">let</span> j = <span class=\"hljs-number\">1</span>; j &amp;lt;= n; j++) {\n&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (i % j === <span class=\"hljs-number\">0</span>) {\n&nbsp;&nbsp;&nbsp;&nbsp;factor++;\n&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;}\n&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (factor == <span class=\"hljs-number\">2</span>) {\n&nbsp;&nbsp;&nbsp;primeArray.push(i);\n&nbsp;&nbsp;}\n&nbsp;}\n&nbsp;<span class=\"hljs-keyword\">return</span> primeArray;\n}\n</pre><p>Pada function tersebut terdapat array kosong yang nantinya akan diisi oleh bilangan prima, dibaris selanjutnya akan dilakukan looping, yang dimulai dari angka 2 (karena bilangan prima lebih dari 1) sampai sama dengan angka n. Kemudian perulangan tersebut di dalam nya ada perulangan lagi yang berfungsi untuk mencari jumlah factor. Jika angka yang ada di perulangan pertama dimodulus dengan angka yang ada di perulangan kedua hasilnya = 0, maka akan menambahkan jumlah dari variable factor yang ada di perulangan pertama. Jika faktor dari bilangan perulangan pertama tersebut sudah sama dengan 2 (karena faktor dari bilangan prima itu hanya ada 2bilangan), maka taruh bilangan tersebut di array kosong yang dtadi sudah di buat diawal.</p><p>Contoh, jika saya memasukan angka 10 pada fungsi tersebut:</p><p><code>primeArray(10);</code></p><p>kemudian masuk ke perulangan pertama, pada saat variable i = 2, masuk ke perulangan ke-dua, di perulangan ke-dua variabel i, yaitu 2 akan terus dimodulus dengan bilangan 1 sampai sama dengan 10.</p><p>2 % 1 = 0</p><p>2 % 2 = 0</p><p>2 % 3 = 2</p><p>2 % 4 dst sampai 2 %10</p><p>Jika 2 % j === 0, maka akan menambahkan angka pada variable faktor. </p><p>Jika faktor dari variabel i, yaitu 2 nya hanya ada dua bilangan (1, dan 2[bilangan itu sendiri] ), maka variabel i tersebut akan dimasukan ke dalam array. Selanjut nya variable i bertambah 1, jadi 3 sama seperti sebelumnya akan dimodulus dengan bilangan 1 - 10. Begitu terus sampai i mencapai 10.</p><p>Selanjutnya array akan mengembalikan nilai nya.</p>', '2021-07-30 22:47:00', '/storage/canvas/images/0rwdhPGgTkNcQ5UxBdsGVNYD9Cqw8xHagqRtUpOb.jpg', NULL, 'f257c125-67de-44d0-a96b-87abaf6de657', '{\"description\":\"search prime number with javascript\",\"title\":\"javascript algorithm\",\"canonical_link\":null}', '2021-08-11 07:47:25', '2021-10-12 10:58:01', NULL),
('b90b31a9-10e3-4681-a350-a0082860b0e3', 'post-b90b31a9-10e3-4681-a350-a0082860b0e3', 'Test', NULL, '<p>well</p>', '2021-07-14 21:55:00', NULL, NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":null,\"title\":null,\"canonical_link\":null}', '2021-07-15 11:55:35', '2021-07-29 06:00:31', '2021-07-29 06:00:31'),
('c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', 'belajar-mysql-2-sintaks', 'Belajar MySQL - 2. Sintaks', 'Kebanyakan database memiliki satu atau lebih table. Setiap Table di identifikasi dengan nama, contoh: \"buku\" atau \"kategori\". Table terdiri dari records ( baris/rows ) dan memiliki data.', '<p>Kebanyakan database memiliki satu atau lebih table. Setiap Table di identifikasi dengan nama, contoh: \"buku\" atau \"kategori\". Table terdiri dari records ( baris/rows ) dan memiliki data.</p><h2>SQL Statements?</h2><p>Operasi database dilakukan dengan SQL Statements atau biasa disebut perintah SQL.</p><p>SQL Statement berikut untuk memilih semua records di table buku:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">SELECT</span>&nbsp;<span class=\"hljs-operator\">*</span>&nbsp;<span class=\"hljs-keyword\">FROM</span>&nbsp;buku;\n</pre><h2>Hal yang perlu diperhatikan!</h2><p>Sintaks SQL itu tidak case sensitive: <code>select</code> sama saja dengan <code>SELECT</code></p><p><code><strong>Note: Di semua pembelajaran MySQL kita akan menggunakan keyword dalam upper-case</strong></code></p><h2>Tanda titik koma di perintah SQL?</h2><ul><li>Beberapa sistem database memerlukan tanda titik koma atau semicolon di setiap akhir perintah SQL.</li><li>Tanda titik koma adalah aturan standard untuk memisahkan setiap perintah SQL di system database yang memungkinkan beberapa perintah SQL dapat dijalankan secara bersamaan dalam satu request/call ke server.</li></ul><p>Di pembelajaran MySQL ini, kita akan menggunakan tanda titik koma/semicolon di setiap perintah SQL.</p><h2>Beberapa Perintah Dasar Penting SQL!</h2><ul><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">SELECT</code>&nbsp;- ekstrak data di database</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">UPDATE</code>&nbsp;- update data di database</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">DELETE</code>&nbsp;- hapus data di databse</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">INSERT INTO</code>&nbsp;- inserts data baru ke database</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">CREATE DATABASE</code>&nbsp;- membuat database baru</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">ALTER DATABASE</code>&nbsp;- manipulasi database</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">CREATE TABLE</code>&nbsp;- membuat table baru</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">ALTER TABLE</code>&nbsp;- manipulasi table</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">DROP TABLE</code>&nbsp;- hapus table</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">CREATE INDEX</code>&nbsp;- membuat index (search key)</li><li><code style=\"color: crimson; background-color: rgba(222, 222, 222, 0.3);\">DROP INDEX</code>&nbsp;- hapus index</li></ul><p>Nah itulah pengertian dan perintah - perintah dasar SQL, perintah - perintah dasar ini akan kita sering kita gunakan, so tetep stay tune yach!</p><p>Whats next?</p>', '2021-07-28 15:39:00', '/storage/canvas/images/Vak9d3BT22jo0bHDRHq1fPZd7gInM3LqiGfUoCnJ.png', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":null,\"title\":null,\"canonical_link\":null}', '2021-07-29 05:39:25', '2021-08-06 16:04:49', NULL),
('d102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', 'belajar-mysql-31-database-dan-table', 'Belajar MySQL - 3.1. Database dan Table', 'DDL atau singkatan dari Data Definition Language adalah kumpulan perintah SQL yang berkaitan dengan pembuatan, perubahan, dan penghapusan database maupun objek-objek yang terdapat di dalam database, seperti table, index, fungsi/prosedur, trigger, dll.', '<h3><strong>Istilah DDL</strong></h3><p>Sebelum lanjut ke mysql, kita bahas dulu sedikit tentang DDL. DDL atau singkatan dari Data Definition Language adalah kumpulan perintah SQL yang berkaitan dengan pembuatan, perubahan, dan penghapusan database maupun objek-objek yang terdapat di dalam database, seperti table, index, fungsi/prosedur, trigger, dll.</p><p>Perintah SQL yang termasuk kategori DDL contohnya : <code>CREATE, ALTER, DROP</code></p><hr><h3><strong>Studi Kasus: Membuat Database Perpustakaan</strong></h3><h3><strong>Membuat Database</strong> </h3><p>Langkah awal untuk bekerja dengan MySQL adalah membuat database. Pada studi kasus kali ini kita akan menggunakan BUKUDB sebagai nama database.</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-attribute\">CREATE</span> DATABASE BUKUDB;\n</pre><p><code><strong>Note:</strong> Nama database bisa kalian sesuaikan sendiri.</code></p><p>Sebelum database dapat digunakan, kita pilih dulu database dengan perintah:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-attribute\">USE</span> BUKUDB;\n</pre><p>sekarang kita bisa membuat table dan objek-objek lain di dalam database BUKUDB.</p><p><br></p><h3><strong>Menghapus Database</strong></h3><p>pada kasus-kasus tertentu mungkin saja database tidak digunakan lagi, maka dilakukan penghapusan database. Untuk menghapus database digunakan perintah berikut:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">DROP</span> DATABASE IF <span class=\"hljs-keyword\">EXISTS</span> BUKUDB;\n</pre><p>\"IF EXISTS\" bersifat opsional hanya berfungsi untuk mencegah kesalahan jika ternyata database tidak ada di dalam server MySQL.</p><p>Hati-hati saat ingin menghapus database karena semua data dan objek di dalam database akan dihapus permanen.</p><p><br></p><h3><strong>Membuat Table</strong></h3><p>Setelah database dibuat dan dipilih, kita bisa membuat table di dalam database dengan perintah: <code>CREATE TABLE</code>. Contoh umum nya seperti berikut:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> nama_table (\n kolom1 type_data,\n kolom2 type_data,\n ...\n) TYPE <span class=\"hljs-operator\">=</span> engine;\n</pre><p>field1, field2 dan seterusnya merepresentasikan nama kolom table, sedangkan type data merepresentasikan jenis data dari kolom bersangkutan.</p><p>\"TYPE\" bersifat opsional dan berfungsi untuk menentukan type table atau lebih tepatnya storage engine dari table.</p><p><br></p><h3><strong>Membuat Table Kategori</strong></h3><p>Table ini berisi kategori buku dan akan direlasikan dengan table BUKU melalui table bantu(atau table transaksi) dengan nama LINK_BUKU_KATEGORI.</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> KATEGORI (\n  id <span class=\"hljs-type\">INT</span> <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span> AUTO_INCREMENT,\n  nama <span class=\"hljs-type\">VARCHAR</span>(<span class=\"hljs-number\">25</span>),\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY(id)\n) TYPE ﻿<span class=\"hljs-operator\">=</span> InnoDB;\n</pre><p>Dengan perintah diatas kita membuat table <strong>KATEGORI </strong>bersisi dua buah kolom yaitu \"id\" dengan type data <strong>INT</strong>(integer) dan kolom \"nama\" dengan type data <strong>VARCHAR </strong>dengan panjang 25 karakter.</p><p><strong>NOT NULL</strong> berarti kolom ini tidak boleh kosong. Lalu <strong>AUTO_INCREMENT</strong> digunakan untuk menaikan nilai dari kolom ini setiap baris data diisi.</p><p><strong>PRIMARY KEY</strong> berfungsi membuat data menjadi <strong>unique</strong> yaitu data tidak akan memiliki duplikat di dalam table KATEGORI.</p><p><strong>TYPE = InnoDB</strong> adalah perintah untuk menyimpan table dengan engine InnoDB.</p><p><br></p><h3><br></h3><h3><strong>Membuat Table Pengarang</strong></h3><p>Table ini digunakan untuk menyimpan data pengarang. Table ini akan direlasikan dengan table BUKU melalui table transaksi LINK_BUKU_PENGARANG.</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> PENGARANG (\n  id <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">3</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  nama <span class=\"hljs-type\">VARCHAR</span>(<span class=\"hljs-number\">40</span>),\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY (id)\n) TYPE <span class=\"hljs-operator\">=</span> InnoDB;﻿\n</pre><h3><strong>Membuat Table Penerbit</strong></h3><p>Table ini akan menyimpan informasi penerbit dan berelasi dengan table BUKU sebagai acuan data referensi.</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> PENERBIT (\n  id <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">4</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  nama <span class=\"hljs-type\">VARCHAR</span>(<span class=\"hljs-number\">50</span>),\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY (id)\n) TYPE <span class=\"hljs-operator\">=</span> InnoDB;\n</pre><h3><strong>Membuat Table Buku</strong></h3><p>Nah table ini akan menyimpan detail buku-buku.</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> BUKU (\n  isbn <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">15</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  judul <span class=\"hljs-type\">VARCHAR</span>(<span class=\"hljs-number\">50</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  penerbit_id <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">4</span>),\n  tglterbit <span class=\"hljs-type\">DATE</span>,\n  jmlhalaman <span class=\"hljs-type\">INT</span>,\n  deskripsi TEXT,\n  harga <span class=\"hljs-type\">DECIMAL</span>,\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY(isbn),\n  <span class=\"hljs-keyword\">FOREIGN</span> KEY(penerbit_id) <span class=\"hljs-keyword\">REFERENCES</span> PENERBIT(id)\n) TYPE <span class=\"hljs-operator\">=</span> InnoDB;   ﻿﻿﻿﻿\n</pre><p><strong>FOREIGN KEY</strong> merujuk ke nilai di kolom tertentu. Untuk kasus di atas maka kolom penerbit_id akan memiliki/merujuk value dari kolom id di table PENERBIT.</p><p>Syntax untuk membuat foreign key adalah:</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">FOREIGN</span> KEY(nama_kolom) <span class=\"hljs-keyword\">REFERENCES</span> table_referensi(kolom_table_referensi)\n</pre><p><br></p><h3><strong>Membuat Table link buku barang</strong></h3><p>Table ini dibuat untuk merelasikan antara table BUKU dan PENGARANG</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> LINK_BUKU_PENGARANG (\n  buku_isbn <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">15</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  pengarang_id <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">3</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY (buku_isbn,pengarang_id),\n  <span class=\"hljs-keyword\">FOREIGN</span> KEY (buku_isbn) <span class=\"hljs-keyword\">REFERENCES</span> BUKU (isbn),\n  <span class=\"hljs-keyword\">FOREIGN</span> KEY (pengarang_id) <span class=\"hljs-keyword\">REFERENCES</span> PENGARANG (id)\n) TYPE <span class=\"hljs-operator\">=</span> InnoDB;\n</pre><p>Skenario nya adalah pengarang bisa memiliki banyak buku dan sebaliknya sebuah buku bisa dimiliki lebih dari satu pengarang. Maka dari itu buku_isbn dan pengarang_id kita set sebagai primary dan foreign key.</p><p><br></p><h3><strong>Membuat Table link buku kategori</strong></h3><p>Table ini dibuat untuk merelasikan antara table BUKU dan KATEGORI</p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> LINK_BUKU_KATEGORI (\n  buku_isbn <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">15</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  kategori_id <span class=\"hljs-type\">CHAR</span>(<span class=\"hljs-number\">3</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n  <span class=\"hljs-keyword\">PRIMARY</span> KEY (buku_isbn,kategori_id),\n  <span class=\"hljs-keyword\">FOREIGN</span> KEY (buku_isbn) <span class=\"hljs-keyword\">REFERENCES</span> BUKU (isbn),\n  <span class=\"hljs-keyword\">FOREIGN</span> KEY (kategori_id) <span class=\"hljs-keyword\">REFERENCES</span> KATEGORI (id)\n) TYPE <span class=\"hljs-operator\">=</span> InnoDB;\n</pre><p>Skenario yang digunakan adalah, satu buku bisa memiliki banyak kategori dan satu kategori dapat memiliki beberapa buku.</p><p>Oke sampai sini aja dlu hehe soalnya admin capek ngetik :). Admin bakal lanjutin di blog selanjutnya! stay tuned!</p>', '2021-07-26 21:36:00', '/storage/canvas/images/jmoPUEX5wgh93FVOxq8fDBljwjhPVIYb8rXATiub.png', NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":\"DDL atau singkatan dari Data Definition Language adalah kumpulan perintah SQL yang berkaitan dengan pembuatan, perubahan, dan penghapusan database maupun objek-objek yang terdapat di dalam database, seperti table, index, fungsi\\/prosedur, trigger, dll.\",\"title\":\"Apa itu DDL di MySQL\",\"canonical_link\":null}', '2021-07-29 05:36:21', '2021-08-06 16:04:07', NULL),
('ee8683f9-83ff-456a-8acf-a7bf216d5cab', 'post-ee8683f9-83ff-456a-8acf-a7bf216d5cab', 'Test', NULL, NULL, NULL, NULL, NULL, '7b63368a-3463-4358-9ca6-6900fd0b45ae', '{\"description\":null,\"title\":null,\"canonical_link\":null}', '2021-07-29 06:08:25', '2021-07-29 06:08:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts_tags`
--

CREATE TABLE `canvas_posts_tags` (
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_posts_tags`
--

INSERT INTO `canvas_posts_tags` (`post_id`, `tag_id`) VALUES
('01266d9a-88f4-4396-b20d-eb8438778728', '7ec8bd16-ab0e-47a6-a37f-1b0c299f9224'),
('01266d9a-88f4-4396-b20d-eb8438778728', '86b8f442-2154-423c-a56b-98892d3c68ba'),
('01266d9a-88f4-4396-b20d-eb8438778728', 'aa86d2b5-3b3b-4316-a033-c4f0714513d1'),
('01266d9a-88f4-4396-b20d-eb8438778728', 'bafd6f24-334d-413d-998d-664cab13b8a1'),
('1a026c26-964b-4974-ab22-2374f9250a0f', '47324b59-fddd-4de3-ad56-3ce0ff09fc07'),
('1a026c26-964b-4974-ab22-2374f9250a0f', '7ec8bd16-ab0e-47a6-a37f-1b0c299f9224'),
('1a026c26-964b-4974-ab22-2374f9250a0f', '993345a1-c2c1-428f-9518-049bf29d6df2'),
('1a026c26-964b-4974-ab22-2374f9250a0f', 'aa86d2b5-3b3b-4316-a033-c4f0714513d1'),
('1a026c26-964b-4974-ab22-2374f9250a0f', 'ceac5d7d-9288-4e7d-be50-01c06802dbd3'),
('1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '7ec8bd16-ab0e-47a6-a37f-1b0c299f9224'),
('2b5c2910-95fc-4a3c-b58c-27c825d6a425', '62ca866c-4b07-4329-92d3-06ab758fa297'),
('7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '7ec8bd16-ab0e-47a6-a37f-1b0c299f9224'),
('9947fca4-0310-4878-8f6a-a33a2970218b', '62ca866c-4b07-4329-92d3-06ab758fa297'),
('b40d21f0-0aa1-49da-879f-9696b84f07d4', '86b8f442-2154-423c-a56b-98892d3c68ba'),
('b40d21f0-0aa1-49da-879f-9696b84f07d4', '993345a1-c2c1-428f-9518-049bf29d6df2'),
('b40d21f0-0aa1-49da-879f-9696b84f07d4', 'bafd6f24-334d-413d-998d-664cab13b8a1'),
('c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '62ca866c-4b07-4329-92d3-06ab758fa297'),
('d102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '62ca866c-4b07-4329-92d3-06ab758fa297');

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts_topics`
--

CREATE TABLE `canvas_posts_topics` (
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_posts_topics`
--

INSERT INTO `canvas_posts_topics` (`post_id`, `topic_id`) VALUES
('01266d9a-88f4-4396-b20d-eb8438778728', '838409b9-768e-4525-a48f-54ada6a6dfc5'),
('1a026c26-964b-4974-ab22-2374f9250a0f', '838409b9-768e-4525-a48f-54ada6a6dfc5'),
('2b5c2910-95fc-4a3c-b58c-27c825d6a425', '77a835a6-c173-4c9f-a63a-ea5d7f697124'),
('7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '77a835a6-c173-4c9f-a63a-ea5d7f697124'),
('9947fca4-0310-4878-8f6a-a33a2970218b', '7b6e6ed8-8458-4b7d-876e-bb6789d66cc4'),
('b40d21f0-0aa1-49da-879f-9696b84f07d4', '838409b9-768e-4525-a48f-54ada6a6dfc5'),
('c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '77a835a6-c173-4c9f-a63a-ea5d7f697124'),
('d102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '77a835a6-c173-4c9f-a63a-ea5d7f697124');

-- --------------------------------------------------------

--
-- Table structure for table `canvas_tags`
--

CREATE TABLE `canvas_tags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_tags`
--

INSERT INTO `canvas_tags` (`id`, `slug`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('47324b59-fddd-4de3-ad56-3ce0ff09fc07', 'c-language', 'c language', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-10-12 10:45:35', '2021-10-12 10:45:35', NULL),
('62ca866c-4b07-4329-92d3-06ab758fa297', 'mysql', 'MySQL', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-07-29 05:40:21', '2021-07-29 05:40:21', NULL),
('7c689a1c-d19e-44ed-aa24-cd384adba0b0', 'algorythm', 'algorythm', 'f257c125-67de-44d0-a96b-87abaf6de657', '2021-08-11 08:21:15', '2021-08-11 08:21:15', NULL),
('7ec8bd16-ab0e-47a6-a37f-1b0c299f9224', 'learning', 'Learning', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-07-29 06:14:27', '2021-07-29 06:14:27', NULL),
('86b8f442-2154-423c-a56b-98892d3c68ba', 'javascript', 'javascript', 'f257c125-67de-44d0-a96b-87abaf6de657', '2021-08-11 08:21:10', '2021-08-11 08:21:10', NULL),
('993345a1-c2c1-428f-9518-049bf29d6df2', 'algorithm', 'algorithm', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-10-12 10:45:17', '2021-10-12 10:45:17', NULL),
('aa86d2b5-3b3b-4316-a033-c4f0714513d1', 'tutorial', 'tutorial', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-10-12 10:45:50', '2021-10-12 10:45:50', NULL),
('bafd6f24-334d-413d-998d-664cab13b8a1', 'competitive-programming', 'competitive programming', 'f257c125-67de-44d0-a96b-87abaf6de657', '2021-08-11 08:21:05', '2021-08-11 08:21:05', NULL),
('ceac5d7d-9288-4e7d-be50-01c06802dbd3', 'basic-programing', 'basic programing', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-10-12 10:46:04', '2021-10-12 10:46:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `canvas_topics`
--

CREATE TABLE `canvas_topics` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_topics`
--

INSERT INTO `canvas_topics` (`id`, `slug`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('018e18b7-d6a6-4bd4-9b53-6b1afe49cec7', 'algorythm-programming', 'algorythm programming', 'f257c125-67de-44d0-a96b-87abaf6de657', '2021-08-11 08:20:49', '2021-08-11 08:20:49', NULL),
('767fd073-8222-44f6-a77a-2f519e1143f7', 'competitive-programing', 'Competitive Programing', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-08-06 16:33:54', '2021-08-06 16:33:54', NULL),
('77a835a6-c173-4c9f-a63a-ea5d7f697124', 'database', 'Database', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-07-29 06:09:27', '2021-07-29 06:09:27', NULL),
('7b6e6ed8-8458-4b7d-876e-bb6789d66cc4', 'tutorials', 'Tutorials', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-08-06 16:05:44', '2021-08-06 16:05:44', NULL),
('838409b9-768e-4525-a48f-54ada6a6dfc5', 'algorithm', 'algorithm', '7b63368a-3463-4358-9ca6-6900fd0b45ae', '2021-10-12 10:45:06', '2021-10-12 10:45:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `canvas_users`
--

CREATE TABLE `canvas_users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(4) DEFAULT NULL,
  `digest` tinyint(4) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_users`
--

INSERT INTO `canvas_users` (`id`, `name`, `email`, `username`, `password`, `summary`, `avatar`, `dark_mode`, `digest`, `locale`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('7b63368a-3463-4358-9ca6-6900fd0b45ae', 'Septian Putra P', 'septian@ayocode.my.id', 'septian', '$2y$10$RVL4iI25enaYbnypzBJGNe9E/SaPIOWNZryDR/3nLAZ6HUEcqKRmO', NULL, NULL, NULL, NULL, 'en', 2, NULL, '2021-07-15 11:52:44', '2021-07-15 11:53:40', NULL),
('7bf903f6-0649-4cab-9bc7-fcde811998e8', 'Jonathan Tri Christianto', 'jonathan@ayocode.my.id', 'JonathanTriC', '$2y$10$O9UY4J89s5bjY2grczd1mO4kTHnjVs7.qIfMCL19gU35sQaWEji6O', 'Junior Flutter Dev', '/storage/canvas/images/7FhogOnvbGALmPqaHcbBcxTHoxsNI85FhnemjvCH.png', 0, NULL, 'en', 2, NULL, '2021-09-02 12:42:04', '2021-09-05 13:28:49', NULL),
('ce42fbd0-9366-48bb-aede-e7ebca70ad22', 'admin', 'admin@ayocode.my.id', 'admin', '$2y$10$SYpIyPy.diGxnoB1q6aNi.8vlF2vnAkyDP1PFhebaDyknT1Z/8MMS', NULL, NULL, 0, NULL, 'en', 3, NULL, '2021-07-15 10:39:09', '2021-07-15 10:39:09', NULL),
('f257c125-67de-44d0-a96b-87abaf6de657', 'Iqbal Maulana', 'iqbal.maulana@ayocode.my.id', 'iqbal215', '$2y$10$IulepGhkRKP5ybFblV3hqur68kpeo/N1t1pQAo2elKTSO/y/.l5s.', NULL, '/storage/canvas/images/94xZOf55IqcrTQI1CDlp7gMAXfACdnmahzakyZso.jpg', NULL, NULL, 'en', 2, NULL, '2021-08-11 07:40:29', '2021-09-30 00:53:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `canvas_views`
--

CREATE TABLE `canvas_views` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_views`
--

INSERT INTO `canvas_views` (`id`, `post_id`, `ip`, `agent`, `referer`, `created_at`, `updated_at`) VALUES
(1, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 11:56:23', '2021-07-15 11:56:23'),
(2, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-15 11:56:35', '2021-07-15 11:56:35'),
(3, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 12:04:47', '2021-07-15 12:04:47'),
(4, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.33.106', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 12:59:03', '2021-07-15 12:59:03'),
(5, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-15 13:49:39', '2021-07-15 13:49:39'),
(6, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.7.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-19 06:47:51', '2021-07-19 06:47:51'),
(7, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.7.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-19 08:45:52', '2021-07-19 08:45:52'),
(8, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '112.215.65.238', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-20 17:27:30', '2021-07-20 17:27:30'),
(9, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '112.215.170.168', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-07-29 05:28:49', '2021-07-29 05:28:49'),
(10, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '112.215.170.168', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-07-29 05:38:45', '2021-07-29 05:38:45'),
(11, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:48:20', '2021-07-29 05:48:20'),
(12, '4ea84529-6abd-4c42-9242-86d5fcc8c76a', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:48:39', '2021-07-29 05:48:39'),
(13, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:49:44', '2021-07-29 05:49:44'),
(14, '4ea84529-6abd-4c42-9242-86d5fcc8c76a', '112.215.170.168', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:50:32', '2021-07-29 05:50:32'),
(15, '9947fca4-0310-4878-8f6a-a33a2970218b', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:51:07', '2021-07-29 05:51:07'),
(16, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:52:05', '2021-07-29 05:52:05'),
(17, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 06:19:57', '2021-07-29 06:19:57'),
(18, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.127', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-07-30 09:04:35', '2021-07-30 09:04:35'),
(19, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.127', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-07-30 09:18:09', '2021-07-30 09:18:09'),
(20, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.109', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/91.0.4472.90 Safari/537.36', 'www.ayocode.my.id', '2021-07-30 22:57:25', '2021-07-30 22:57:25'),
(21, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 15:59:53', '2021-08-06 15:59:53'),
(22, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:08:01', '2021-08-06 16:08:01'),
(23, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:15:27', '2021-08-06 16:15:27'),
(24, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:15:31', '2021-08-06 16:15:31'),
(25, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:35:27', '2021-08-06 16:35:27'),
(26, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.74.5', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-08-06 18:34:19', '2021-08-06 18:34:19'),
(27, '01266d9a-88f4-4396-b20d-eb8438778728', '112.215.170.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 04:54:36', '2021-08-07 04:54:36'),
(28, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '112.215.170.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 04:55:20', '2021-08-07 04:55:20'),
(29, '01266d9a-88f4-4396-b20d-eb8438778728', '112.215.238.19', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:17:38', '2021-08-07 08:17:38'),
(30, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.33.131', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:27:32', '2021-08-07 08:27:32'),
(31, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.33.131', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:27:59', '2021-08-07 08:27:59'),
(32, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.2.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 09:47:08', '2021-08-07 09:47:08'),
(33, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.2.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 09:47:14', '2021-08-07 09:47:14'),
(34, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.13.251', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 10:11:55', '2021-08-07 10:11:55'),
(35, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:43:48', '2021-08-08 06:43:48'),
(36, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:44:06', '2021-08-08 06:44:06'),
(37, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:44:26', '2021-08-08 06:44:26'),
(38, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 07:00:28', '2021-08-08 07:00:28'),
(39, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '112.215.65.230', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'www.ayocode.my.id', '2021-08-10 08:24:02', '2021-08-10 08:24:02'),
(40, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '112.215.65.230', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-10 08:24:46', '2021-08-10 08:24:46'),
(41, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.35.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-11 07:42:43', '2021-08-11 07:42:43'),
(42, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.35.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-11 08:23:41', '2021-08-11 08:23:41'),
(43, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 13:22:07', '2021-08-12 13:22:07'),
(44, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 15:17:05', '2021-08-12 15:17:05'),
(45, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 15:17:21', '2021-08-12 15:17:21'),
(46, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:42:18', '2021-08-15 03:42:18'),
(47, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:52:38', '2021-08-15 03:52:38'),
(48, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:52:45', '2021-08-15 03:52:45'),
(49, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.19', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 10:16:46', '2021-08-15 10:16:46'),
(50, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.2.107', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-15 16:43:56', '2021-08-15 16:43:56'),
(51, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 16:48:32', '2021-08-15 16:48:32'),
(52, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-08-22 06:00:20', '2021-08-22 06:00:20'),
(53, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-23 07:22:56', '2021-08-23 07:22:56'),
(54, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '180.243.10.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-08-27 09:59:16', '2021-08-27 09:59:16'),
(55, '01266d9a-88f4-4396-b20d-eb8438778728', '180.243.10.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-08-27 10:00:19', '2021-08-27 10:00:19'),
(56, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.45', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-01 04:40:32', '2021-09-01 04:40:32'),
(57, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.45', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/92.0.4515.119 Safari/537.36', 'ayocode.my.id', '2021-09-01 05:55:22', '2021-09-01 05:55:22'),
(58, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:30:27', '2021-09-05 13:30:27'),
(59, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:30:51', '2021-09-05 13:30:51'),
(60, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.6.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:43:59', '2021-09-05 13:43:59'),
(61, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '125.163.73.105', 'Mozilla/5.0 (Linux; U; Android 10; en-us; RMX1821 Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.116 Mobile Safari/537.36 HeyTapBrowser/45.8.0.1', 'ayocode.my.id', '2021-09-05 13:47:00', '2021-09-05 13:47:00'),
(62, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '180.243.6.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:47:40', '2021-09-05 13:47:40'),
(63, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.6.61', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-05 14:00:31', '2021-09-05 14:00:31'),
(64, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '114.124.131.66', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-06 02:36:57', '2021-09-06 02:36:57'),
(65, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:49:07', '2021-09-10 10:49:07'),
(66, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:49:22', '2021-09-10 10:49:22'),
(67, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:50:26', '2021-09-10 10:50:26'),
(68, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-15 16:27:22', '2021-09-15 16:27:22'),
(69, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-15 17:23:16', '2021-09-15 17:23:16'),
(70, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.4.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-16 04:53:59', '2021-09-16 04:53:59'),
(71, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '122.50.6.166', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-18 07:11:00', '2021-09-18 07:11:00'),
(72, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.242.30.228', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-20 09:53:16', '2021-09-20 09:53:16'),
(73, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-21 18:36:15', '2021-09-21 18:36:15'),
(74, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-21 18:36:43', '2021-09-21 18:36:43'),
(75, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 18:41:20', '2021-09-21 18:41:20'),
(76, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 18:41:28', '2021-09-21 18:41:28'),
(77, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.0.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 22:00:02', '2021-09-21 22:00:02'),
(78, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.0.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 22:00:21', '2021-09-21 22:00:21'),
(79, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:16:25', '2021-09-22 00:16:25'),
(80, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:20:23', '2021-09-22 00:20:23'),
(81, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:20:38', '2021-09-22 00:20:38'),
(82, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:22:13', '2021-09-22 00:22:13'),
(83, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:12', '2021-09-22 00:23:12'),
(84, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:33', '2021-09-22 00:23:33'),
(85, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:54', '2021-09-22 00:23:54'),
(86, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.15.9', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:46:36', '2021-09-22 00:46:36'),
(87, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.131.58', 'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 03:53:32', '2021-09-22 03:53:32'),
(88, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-22 06:03:35', '2021-09-22 06:03:35'),
(89, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:08', '2021-09-22 13:00:08'),
(90, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:34', '2021-09-22 13:00:34'),
(91, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:51', '2021-09-22 13:00:51'),
(92, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:15:37', '2021-09-22 13:15:37'),
(93, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:15:46', '2021-09-22 13:15:46'),
(94, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:07:52', '2021-09-22 15:07:52'),
(95, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:08:06', '2021-09-22 15:08:06'),
(96, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:08:11', '2021-09-22 15:08:11'),
(97, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.15.9', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 16:06:51', '2021-09-22 16:06:51'),
(98, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 16:18:24', '2021-09-22 16:18:24'),
(99, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'agency.ayocode.my.id', '2021-09-23 06:17:40', '2021-09-23 06:17:40'),
(100, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.5.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-23 08:34:08', '2021-09-23 08:34:08'),
(101, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-23 13:09:20', '2021-09-23 13:09:20'),
(102, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '140.213.0.76', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-24 06:13:03', '2021-09-24 06:13:03'),
(103, '9947fca4-0310-4878-8f6a-a33a2970218b', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-24 17:06:45', '2021-09-24 17:06:45'),
(104, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.195', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-25 09:17:33', '2021-09-25 09:17:33'),
(105, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:19:05', '2021-09-25 09:19:05'),
(106, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:20:38', '2021-09-25 09:20:38'),
(107, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:21:25', '2021-09-25 09:21:25'),
(108, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:30:23', '2021-09-25 09:30:23'),
(109, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:30:31', '2021-09-25 09:30:31'),
(110, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:41:41', '2021-09-25 09:41:41'),
(111, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-26 14:55:41', '2021-09-26 14:55:41'),
(112, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 03:21:34', '2021-09-27 03:21:34'),
(113, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.104', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2021-09-27 03:26:01', '2021-09-27 03:26:01'),
(114, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:24:17', '2021-09-27 16:24:17'),
(115, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:25:19', '2021-09-27 16:25:19'),
(116, '01266d9a-88f4-4396-b20d-eb8438778728', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:26:38', '2021-09-27 16:26:38'),
(117, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.188.37.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-29 15:28:02', '2021-09-29 15:28:02'),
(118, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-29 22:21:55', '2021-09-29 22:21:55'),
(119, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '112.215.171.203', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-30 01:02:16', '2021-09-30 01:02:16'),
(120, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-30 06:55:09', '2021-09-30 06:55:09'),
(121, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:10:13', '2021-10-01 13:10:13'),
(122, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:13:36', '2021-10-01 13:13:36'),
(123, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-01 13:14:24', '2021-10-01 13:14:24'),
(124, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-01 13:14:29', '2021-10-01 13:14:29'),
(125, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:23:14', '2021-10-01 13:23:14'),
(126, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-05 02:24:53', '2021-10-05 02:24:53'),
(127, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/94.0.4606.61 Safari/537.36', 'ayocode.my.id', '2021-10-05 05:06:21', '2021-10-05 05:06:21'),
(128, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '125.166.57.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-07 18:02:17', '2021-10-07 18:02:17'),
(129, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-08 12:19:44', '2021-10-08 12:19:44'),
(130, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.130.6', 'Mozilla/5.0 (Linux; Android 11; vivo 1901) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.80 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-08 13:45:25', '2021-10-08 13:45:25'),
(131, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.131.89', 'Mozilla/5.0 (Linux; Android 11; vivo 1901) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.80 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-09 11:25:52', '2021-10-09 11:25:52'),
(132, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '36.69.152.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-09 15:25:38', '2021-10-09 15:25:38'),
(133, '01266d9a-88f4-4396-b20d-eb8438778728', '36.69.152.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-09 15:53:04', '2021-10-09 15:53:04'),
(134, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 06:24:35', '2021-10-12 06:24:35'),
(135, '1a026c26-964b-4974-ab22-2374f9250a0f', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 10:51:16', '2021-10-12 10:51:16'),
(136, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 11:05:02', '2021-10-12 11:05:02'),
(137, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 11:15:41', '2021-10-12 11:15:41'),
(138, '1a026c26-964b-4974-ab22-2374f9250a0f', '111.94.47.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-12 11:49:11', '2021-10-12 11:49:11'),
(139, '1a026c26-964b-4974-ab22-2374f9250a0f', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-10-12 13:32:49', '2021-10-12 13:32:49'),
(140, '1a026c26-964b-4974-ab22-2374f9250a0f', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-12 15:24:28', '2021-10-12 15:24:28'),
(141, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 15:44:20', '2021-10-12 15:44:20'),
(142, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 15:44:28', '2021-10-12 15:44:28'),
(143, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-13 06:17:17', '2021-10-13 06:17:17'),
(144, '1a026c26-964b-4974-ab22-2374f9250a0f', '111.94.47.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-13 07:35:48', '2021-10-13 07:35:48'),
(145, '1a026c26-964b-4974-ab22-2374f9250a0f', '111.94.47.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-13 08:58:17', '2021-10-13 08:58:17'),
(146, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '188.150.51.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-13 23:30:29', '2021-10-13 23:30:29'),
(147, '1a026c26-964b-4974-ab22-2374f9250a0f', '116.206.12.45', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-15 23:15:55', '2021-10-15 23:15:55'),
(148, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-19 17:38:51', '2021-10-19 17:38:51'),
(149, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.100', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-28 10:59:13', '2021-10-28 10:59:13'),
(150, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-28 16:42:49', '2021-10-28 16:42:49'),
(151, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.251.182.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'ayocode.my.id', '2021-11-05 05:50:00', '2021-11-05 05:50:00'),
(152, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.100', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/95.0.4638.69 Safari/537.36', 'ayocode.my.id', '2021-11-07 17:43:07', '2021-11-07 17:43:07'),
(153, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.49', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-11-08 21:53:50', '2021-11-08 21:53:50'),
(154, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-11-15 17:07:55', '2021-11-15 17:07:55'),
(155, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-11-17 06:08:43', '2021-11-17 06:08:43'),
(156, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-12-17 11:44:11', '2021-12-17 11:44:11'),
(157, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.93 Safari/537.36', 'ayocode.my.id', '2021-12-17 12:47:40', '2021-12-17 12:47:40'),
(158, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-12-18 10:25:05', '2021-12-18 10:25:05'),
(159, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36 OPR/80.0.4170.16', 'ayocode.my.id', '2021-12-28 03:25:19', '2021-12-28 03:25:19'),
(160, '1a026c26-964b-4974-ab22-2374f9250a0f', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36 OPR/82.0.4227.33', 'ayocode.my.id', '2022-01-02 13:20:44', '2022-01-02 13:20:44'),
(161, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.72.3', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-06 14:13:05', '2022-01-06 14:13:05'),
(162, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-11 16:57:25', '2022-01-11 16:57:25'),
(163, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.110 Safari/537.36', 'ayocode.my.id', '2022-01-11 21:14:42', '2022-01-11 21:14:42'),
(164, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-12 09:18:08', '2022-01-12 09:18:08'),
(165, '01266d9a-88f4-4396-b20d-eb8438778728', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-18 03:56:13', '2022-01-18 03:56:13'),
(166, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-18 04:01:09', '2022-01-18 04:01:09'),
(167, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-18 12:12:16', '2022-01-18 12:12:16'),
(168, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.110 Safari/537.36', 'ayocode.my.id', '2022-01-18 13:11:25', '2022-01-18 13:11:25'),
(169, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:44:48', '2022-01-19 01:44:48'),
(170, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:44:54', '2022-01-19 01:44:54'),
(171, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:45:05', '2022-01-19 01:45:05'),
(172, '01266d9a-88f4-4396-b20d-eb8438778728', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:04:08', '2022-01-19 09:04:08'),
(173, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:04:47', '2022-01-19 09:04:47'),
(174, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:13:38', '2022-01-19 09:13:38'),
(175, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:14:58', '2022-01-19 09:14:58'),
(176, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:15:35', '2022-01-19 09:15:35'),
(177, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:18:59', '2022-01-19 09:18:59'),
(178, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:19:11', '2022-01-19 09:19:11'),
(179, '9947fca4-0310-4878-8f6a-a33a2970218b', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:21:18', '2022-01-19 09:21:18'),
(180, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:21:43', '2022-01-19 09:21:43'),
(181, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 12:39:10', '2022-01-19 12:39:10'),
(182, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '182.3.201.112', 'Mozilla/5.0 (Linux; Android 10; M2006C3MG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-01-21 04:35:07', '2022-01-21 04:35:07'),
(183, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '180.244.13.240', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-01-22 04:29:53', '2022-01-22 04:29:53'),
(184, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.244.13.240', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-01-22 04:30:10', '2022-01-22 04:30:10'),
(185, '1a026c26-964b-4974-ab22-2374f9250a0f', '180.244.13.240', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-22 04:31:52', '2022-01-22 04:31:52'),
(186, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.65.218', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-01 00:38:47', '2022-02-01 00:38:47'),
(187, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-07 20:36:55', '2022-02-07 20:36:55'),
(188, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-08 05:31:56', '2022-02-08 05:31:56'),
(189, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-11 16:11:49', '2022-02-11 16:11:49'),
(190, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-02-11 16:44:27', '2022-02-11 16:44:27'),
(191, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.253', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-12 14:17:49', '2022-02-12 14:17:49'),
(192, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.226', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-15 00:56:59', '2022-02-15 00:56:59'),
(193, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.66', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-18 06:12:48', '2022-02-18 06:12:48'),
(194, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-24 06:12:20', '2022-02-24 06:12:20'),
(195, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-02-25 06:00:49', '2022-02-25 06:00:49'),
(196, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-02-27 14:05:54', '2022-02-27 14:05:54');
INSERT INTO `canvas_views` (`id`, `post_id`, `ip`, `agent`, `referer`, `created_at`, `updated_at`) VALUES
(197, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-01 14:13:18', '2022-03-01 14:13:18'),
(198, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-01 20:03:28', '2022-03-01 20:03:28'),
(199, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-03 15:43:38', '2022-03-03 15:43:38'),
(200, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-04 06:13:25', '2022-03-04 06:13:25'),
(201, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-05 15:42:28', '2022-03-05 15:42:28'),
(202, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-07 17:26:50', '2022-03-07 17:26:50'),
(203, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-07 20:08:44', '2022-03-07 20:08:44'),
(204, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-07 21:17:29', '2022-03-07 21:17:29'),
(205, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '110.50.84.225', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30', 'www.ayocode.my.id', '2022-03-08 09:44:37', '2022-03-08 09:44:37'),
(206, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-09 20:53:02', '2022-03-09 20:53:02'),
(207, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-10 00:03:13', '2022-03-10 00:03:13'),
(208, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-20 17:18:49', '2022-03-20 17:18:49'),
(209, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-20 22:25:43', '2022-03-20 22:25:43'),
(210, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-21 02:26:21', '2022-03-21 02:26:21'),
(211, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-24 08:07:11', '2022-03-24 08:07:11'),
(212, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-01 12:43:24', '2022-04-01 12:43:24'),
(213, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-02 20:33:39', '2022-04-02 20:33:39'),
(214, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'ayocode.my.id', '2022-04-02 21:12:09', '2022-04-02 21:12:09'),
(215, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'www.ayocode.my.id', '2022-04-02 21:13:11', '2022-04-02 21:13:11'),
(216, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2022-04-02 22:38:31', '2022-04-02 22:38:31'),
(217, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.34.29', 'Mozilla/5.0 (Linux; Android 10; RMX1851) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-04-07 06:23:47', '2022-04-07 06:23:47'),
(218, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.229.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', 'ayocode.my.id', '2022-04-10 23:45:06', '2022-04-10 23:45:06'),
(219, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-11 07:36:30', '2022-04-11 07:36:30'),
(220, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'ayocode.my.id', '2022-04-11 12:37:09', '2022-04-11 12:37:09'),
(221, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.58', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-11 20:21:33', '2022-04-11 20:21:33'),
(222, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '125.167.59.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0', 'www.ayocode.my.id', '2022-04-15 19:06:41', '2022-04-15 19:06:41'),
(223, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.243.6.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', 'ayocode.my.id', '2022-04-17 03:48:22', '2022-04-17 03:48:22'),
(224, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:36:43', '2022-04-21 05:36:43'),
(225, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:00', '2022-04-21 05:37:00'),
(226, '9947fca4-0310-4878-8f6a-a33a2970218b', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:16', '2022-04-21 05:37:16'),
(227, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:24', '2022-04-21 05:37:24'),
(228, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-22 12:14:20', '2022-04-22 12:14:20'),
(229, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'ayocode.my.id', '2022-04-22 16:06:51', '2022-04-22 16:06:51'),
(230, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-29 13:03:25', '2022-04-29 13:03:25'),
(231, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'ayocode.my.id', '2022-04-29 16:36:20', '2022-04-29 16:36:20'),
(232, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '101.255.164.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 OPR/83.0.4254.19', 'ayocode.my.id', '2022-04-30 06:53:14', '2022-04-30 06:53:14'),
(233, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2022-05-04 03:11:07', '2022-05-04 03:11:07'),
(234, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'www.ayocode.my.id', '2022-05-04 04:21:04', '2022-05-04 04:21:04'),
(235, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '180.251.118.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'www.ayocode.my.id', '2022-05-06 07:21:13', '2022-05-06 07:21:13'),
(236, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '36.80.76.137', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G313HZ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-05-07 22:52:50', '2022-05-07 22:52:50'),
(237, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.233.89.235', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-05-09 10:59:37', '2022-05-09 10:59:37'),
(238, '01266d9a-88f4-4396-b20d-eb8438778728', '103.233.89.235', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-05-09 10:59:44', '2022-05-09 10:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `canvas_visits`
--

CREATE TABLE `canvas_visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `canvas_visits`
--

INSERT INTO `canvas_visits` (`id`, `post_id`, `ip`, `agent`, `referer`, `created_at`, `updated_at`) VALUES
(1, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 11:56:23', '2021-07-15 11:56:23'),
(2, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-15 11:56:35', '2021-07-15 11:56:35'),
(3, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.9.41', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 12:04:47', '2021-07-15 12:04:47'),
(4, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.33.106', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-15 12:59:03', '2021-07-15 12:59:03'),
(5, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '140.213.7.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-19 06:47:51', '2021-07-19 06:47:51'),
(6, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '112.215.65.238', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-07-20 17:27:30', '2021-07-20 17:27:30'),
(7, 'b90b31a9-10e3-4681-a350-a0082860b0e3', '112.215.170.168', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-07-29 05:28:49', '2021-07-29 05:28:49'),
(8, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '112.215.170.168', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-07-29 05:38:45', '2021-07-29 05:38:45'),
(9, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:48:20', '2021-07-29 05:48:20'),
(10, '4ea84529-6abd-4c42-9242-86d5fcc8c76a', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:48:39', '2021-07-29 05:48:39'),
(11, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:49:44', '2021-07-29 05:49:44'),
(12, '4ea84529-6abd-4c42-9242-86d5fcc8c76a', '112.215.170.168', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:50:32', '2021-07-29 05:50:32'),
(13, '9947fca4-0310-4878-8f6a-a33a2970218b', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:51:07', '2021-07-29 05:51:07'),
(14, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 05:52:05', '2021-07-29 05:52:05'),
(15, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '8.37.43.10', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-07-29 06:19:57', '2021-07-29 06:19:57'),
(16, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.127', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-07-30 09:04:35', '2021-07-30 09:04:35'),
(17, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.127', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-07-30 09:18:09', '2021-07-30 09:18:09'),
(18, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.109', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/91.0.4472.90 Safari/537.36', 'www.ayocode.my.id', '2021-07-30 22:57:25', '2021-07-30 22:57:25'),
(19, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 15:59:53', '2021-08-06 15:59:53'),
(20, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:08:01', '2021-08-06 16:08:01'),
(21, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:15:27', '2021-08-06 16:15:27'),
(22, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:15:31', '2021-08-06 16:15:31'),
(23, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-06 16:35:27', '2021-08-06 16:35:27'),
(24, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.74.5', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-08-06 18:34:19', '2021-08-06 18:34:19'),
(25, '01266d9a-88f4-4396-b20d-eb8438778728', '112.215.170.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 04:54:36', '2021-08-07 04:54:36'),
(26, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '112.215.170.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 04:55:20', '2021-08-07 04:55:20'),
(27, '01266d9a-88f4-4396-b20d-eb8438778728', '112.215.238.19', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:17:38', '2021-08-07 08:17:38'),
(28, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.33.131', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:27:32', '2021-08-07 08:27:32'),
(29, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.33.131', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-07 08:27:59', '2021-08-07 08:27:59'),
(30, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.2.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 09:47:08', '2021-08-07 09:47:08'),
(31, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.2.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 09:47:14', '2021-08-07 09:47:14'),
(32, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.13.251', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 10:11:55', '2021-08-07 10:11:55'),
(33, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.13.251', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-07 10:12:17', '2021-08-07 10:12:17'),
(34, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:43:48', '2021-08-08 06:43:48'),
(35, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:44:06', '2021-08-08 06:44:06'),
(36, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 06:44:26', '2021-08-08 06:44:26'),
(37, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.15.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-08 07:00:28', '2021-08-08 07:00:28'),
(38, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '112.215.65.230', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'www.ayocode.my.id', '2021-08-10 08:24:02', '2021-08-10 08:24:02'),
(39, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '112.215.65.230', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-08-10 08:24:46', '2021-08-10 08:24:46'),
(40, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.35.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-11 07:42:43', '2021-08-11 07:42:43'),
(41, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.35.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-11 08:23:41', '2021-08-11 08:23:41'),
(42, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 13:22:07', '2021-08-12 13:22:07'),
(43, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 15:17:05', '2021-08-12 15:17:05'),
(44, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-12 15:17:21', '2021-08-12 15:17:21'),
(45, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:42:18', '2021-08-15 03:42:18'),
(46, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:52:38', '2021-08-15 03:52:38'),
(47, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '140.213.11.137', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 03:52:45', '2021-08-15 03:52:45'),
(48, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.19', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 10:16:46', '2021-08-15 10:16:46'),
(49, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.2.107', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-15 16:43:56', '2021-08-15 16:43:56'),
(50, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-08-15 16:48:32', '2021-08-15 16:48:32'),
(51, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-08-22 06:00:20', '2021-08-22 06:00:20'),
(52, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'ayocode.my.id', '2021-08-23 07:22:56', '2021-08-23 07:22:56'),
(53, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '180.243.10.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-08-27 09:59:16', '2021-08-27 09:59:16'),
(54, '01266d9a-88f4-4396-b20d-eb8438778728', '180.243.10.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-08-27 10:00:19', '2021-08-27 10:00:19'),
(55, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.45', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-01 04:40:32', '2021-09-01 04:40:32'),
(56, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.45', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/92.0.4515.119 Safari/537.36', 'ayocode.my.id', '2021-09-01 05:55:22', '2021-09-01 05:55:22'),
(57, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:30:27', '2021-09-05 13:30:27'),
(58, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:30:51', '2021-09-05 13:30:51'),
(59, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.6.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:43:59', '2021-09-05 13:43:59'),
(60, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '125.163.73.105', 'Mozilla/5.0 (Linux; U; Android 10; en-us; RMX1821 Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.116 Mobile Safari/537.36 HeyTapBrowser/45.8.0.1', 'ayocode.my.id', '2021-09-05 13:47:00', '2021-09-05 13:47:00'),
(61, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '180.243.6.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 'ayocode.my.id', '2021-09-05 13:47:40', '2021-09-05 13:47:40'),
(62, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.6.61', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-05 14:00:31', '2021-09-05 14:00:31'),
(63, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '114.124.131.66', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-06 02:36:57', '2021-09-06 02:36:57'),
(64, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:49:07', '2021-09-10 10:49:07'),
(65, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:49:22', '2021-09-10 10:49:22'),
(66, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.65.21', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01AD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-10 10:50:26', '2021-09-10 10:50:26'),
(67, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-15 16:27:22', '2021-09-15 16:27:22'),
(68, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-15 17:23:16', '2021-09-15 17:23:16'),
(69, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.4.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'ayocode.my.id', '2021-09-16 04:53:59', '2021-09-16 04:53:59'),
(70, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '122.50.6.166', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-18 07:11:00', '2021-09-18 07:11:00'),
(71, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.242.30.228', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-20 09:53:16', '2021-09-20 09:53:16'),
(72, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-21 18:36:15', '2021-09-21 18:36:15'),
(73, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-21 18:36:43', '2021-09-21 18:36:43'),
(74, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 18:41:20', '2021-09-21 18:41:20'),
(75, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 18:41:28', '2021-09-21 18:41:28'),
(76, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.0.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 22:00:02', '2021-09-21 22:00:02'),
(77, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.0.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-21 22:00:21', '2021-09-21 22:00:21'),
(78, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:16:25', '2021-09-22 00:16:25'),
(79, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:20:23', '2021-09-22 00:20:23'),
(80, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:20:38', '2021-09-22 00:20:38'),
(81, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:22:13', '2021-09-22 00:22:13'),
(82, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:12', '2021-09-22 00:23:12'),
(83, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:33', '2021-09-22 00:23:33'),
(84, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:23:54', '2021-09-22 00:23:54'),
(85, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.15.9', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 00:46:36', '2021-09-22 00:46:36'),
(86, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.131.58', 'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 03:53:32', '2021-09-22 03:53:32'),
(87, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-22 06:03:35', '2021-09-22 06:03:35'),
(88, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:08', '2021-09-22 13:00:08'),
(89, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:34', '2021-09-22 13:00:34'),
(90, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:00:51', '2021-09-22 13:00:51'),
(91, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:15:37', '2021-09-22 13:15:37'),
(92, '9947fca4-0310-4878-8f6a-a33a2970218b', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 13:15:46', '2021-09-22 13:15:46'),
(93, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:07:52', '2021-09-22 15:07:52'),
(94, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:08:06', '2021-09-22 15:08:06'),
(95, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-22 15:08:11', '2021-09-22 15:08:11'),
(96, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.243.15.9', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 16:06:51', '2021-09-22 16:06:51'),
(97, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-22 16:18:24', '2021-09-22 16:18:24'),
(98, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'agency.ayocode.my.id', '2021-09-23 06:17:40', '2021-09-23 06:17:40'),
(99, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.5.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-23 08:34:08', '2021-09-23 08:34:08'),
(100, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-09-23 13:09:20', '2021-09-23 13:09:20'),
(101, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '140.213.0.76', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-24 06:13:03', '2021-09-24 06:13:03'),
(102, '9947fca4-0310-4878-8f6a-a33a2970218b', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-24 17:06:45', '2021-09-24 17:06:45'),
(103, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.195', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-25 09:17:33', '2021-09-25 09:17:33'),
(104, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:19:05', '2021-09-25 09:19:05'),
(105, '01266d9a-88f4-4396-b20d-eb8438778728', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:20:38', '2021-09-25 09:20:38'),
(106, '9947fca4-0310-4878-8f6a-a33a2970218b', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:21:25', '2021-09-25 09:21:25'),
(107, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:30:23', '2021-09-25 09:30:23'),
(108, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:30:31', '2021-09-25 09:30:31'),
(109, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '140.213.9.195', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 'ayocode.my.id', '2021-09-25 09:41:41', '2021-09-25 09:41:41'),
(110, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-26 14:55:41', '2021-09-26 14:55:41'),
(111, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 03:21:34', '2021-09-27 03:21:34'),
(112, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.104', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2021-09-27 03:26:01', '2021-09-27 03:26:01'),
(113, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:24:17', '2021-09-27 16:24:17'),
(114, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:25:19', '2021-09-27 16:25:19'),
(115, '01266d9a-88f4-4396-b20d-eb8438778728', '182.0.205.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-27 16:26:38', '2021-09-27 16:26:38'),
(116, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.188.37.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'ayocode.my.id', '2021-09-29 15:28:02', '2021-09-29 15:28:02'),
(117, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-29 22:21:55', '2021-09-29 22:21:55'),
(118, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '112.215.171.203', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-09-30 01:02:16', '2021-09-30 01:02:16'),
(119, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-09-30 06:55:09', '2021-09-30 06:55:09'),
(120, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:10:13', '2021-10-01 13:10:13'),
(121, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:13:36', '2021-10-01 13:13:36'),
(122, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-01 13:14:24', '2021-10-01 13:14:24'),
(123, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-01 13:14:29', '2021-10-01 13:14:29'),
(124, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-01 13:23:14', '2021-10-01 13:23:14'),
(125, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-05 02:24:53', '2021-10-05 02:24:53'),
(126, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/94.0.4606.61 Safari/537.36', 'ayocode.my.id', '2021-10-05 05:06:21', '2021-10-05 05:06:21'),
(127, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '125.166.57.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-07 18:02:17', '2021-10-07 18:02:17'),
(128, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-08 12:19:44', '2021-10-08 12:19:44'),
(129, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.130.6', 'Mozilla/5.0 (Linux; Android 11; vivo 1901) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.80 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-08 13:45:25', '2021-10-08 13:45:25'),
(130, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '114.124.131.89', 'Mozilla/5.0 (Linux; Android 11; vivo 1901) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.80 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-09 11:25:52', '2021-10-09 11:25:52'),
(131, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '36.69.152.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-09 15:25:38', '2021-10-09 15:25:38'),
(132, '01266d9a-88f4-4396-b20d-eb8438778728', '36.69.152.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'ayocode.my.id', '2021-10-09 15:53:04', '2021-10-09 15:53:04'),
(133, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 06:24:35', '2021-10-12 06:24:35'),
(134, '1a026c26-964b-4974-ab22-2374f9250a0f', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 10:51:16', '2021-10-12 10:51:16'),
(135, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 11:05:02', '2021-10-12 11:05:02'),
(136, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-12 11:15:41', '2021-10-12 11:15:41'),
(137, '1a026c26-964b-4974-ab22-2374f9250a0f', '111.94.47.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-12 11:49:11', '2021-10-12 11:49:11'),
(138, '1a026c26-964b-4974-ab22-2374f9250a0f', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-10-12 13:32:49', '2021-10-12 13:32:49'),
(139, '1a026c26-964b-4974-ab22-2374f9250a0f', '192.140.224.201', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-12 15:24:28', '2021-10-12 15:24:28'),
(140, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 15:44:20', '2021-10-12 15:44:20'),
(141, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-12 15:44:28', '2021-10-12 15:44:28'),
(142, '01266d9a-88f4-4396-b20d-eb8438778728', '192.140.224.201', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'ayocode.my.id', '2021-10-13 06:17:17', '2021-10-13 06:17:17'),
(143, '1a026c26-964b-4974-ab22-2374f9250a0f', '111.94.47.140', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-13 07:35:48', '2021-10-13 07:35:48'),
(144, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '188.150.51.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-13 23:30:29', '2021-10-13 23:30:29'),
(145, '1a026c26-964b-4974-ab22-2374f9250a0f', '116.206.12.45', 'Mozilla/5.0 (Linux; Android 10; M2004J19C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', 'ayocode.my.id', '2021-10-15 23:15:55', '2021-10-15 23:15:55'),
(146, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-19 17:38:51', '2021-10-19 17:38:51'),
(147, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.127', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-19 17:39:09', '2021-10-19 17:39:09'),
(148, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.100', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-10-28 10:59:13', '2021-10-28 10:59:13'),
(149, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.123', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/94.0.4606.81 Safari/537.36', 'ayocode.my.id', '2021-10-28 16:42:49', '2021-10-28 16:42:49'),
(150, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.251.182.81', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'ayocode.my.id', '2021-11-05 05:50:00', '2021-11-05 05:50:00'),
(151, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.100', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/95.0.4638.69 Safari/537.36', 'ayocode.my.id', '2021-11-07 17:43:07', '2021-11-07 17:43:07'),
(152, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.49', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-11-08 21:53:50', '2021-11-08 21:53:50'),
(153, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-11-15 17:07:55', '2021-11-15 17:07:55'),
(154, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.156.112.74', 'Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0', 'ayocode.my.id', '2021-11-17 06:08:43', '2021-11-17 06:08:43'),
(155, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-12-17 11:44:11', '2021-12-17 11:44:11'),
(156, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.93 Safari/537.36', 'ayocode.my.id', '2021-12-17 12:47:40', '2021-12-17 12:47:40'),
(157, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2021-12-18 10:25:05', '2021-12-18 10:25:05'),
(158, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36 OPR/80.0.4170.16', 'ayocode.my.id', '2021-12-28 03:25:19', '2021-12-28 03:25:19'),
(159, '1a026c26-964b-4974-ab22-2374f9250a0f', '103.156.112.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36 OPR/82.0.4227.33', 'ayocode.my.id', '2022-01-02 13:20:44', '2022-01-02 13:20:44'),
(160, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.72.3', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-06 14:13:05', '2022-01-06 14:13:05'),
(161, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-11 16:57:25', '2022-01-11 16:57:25'),
(162, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.110 Safari/537.36', 'ayocode.my.id', '2022-01-11 21:14:42', '2022-01-11 21:14:42'),
(163, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-12 09:18:08', '2022-01-12 09:18:08'),
(164, '01266d9a-88f4-4396-b20d-eb8438778728', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-18 03:56:13', '2022-01-18 03:56:13'),
(165, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-18 04:01:09', '2022-01-18 04:01:09'),
(166, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-01-18 12:12:16', '2022-01-18 12:12:16'),
(167, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/96.0.4664.110 Safari/537.36', 'ayocode.my.id', '2022-01-18 13:11:25', '2022-01-18 13:11:25'),
(168, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:44:48', '2022-01-19 01:44:48'),
(169, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:44:54', '2022-01-19 01:44:54'),
(170, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 01:45:05', '2022-01-19 01:45:05'),
(171, '01266d9a-88f4-4396-b20d-eb8438778728', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:04:08', '2022-01-19 09:04:08'),
(172, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:04:47', '2022-01-19 09:04:47'),
(173, '1a026c26-964b-4974-ab22-2374f9250a0f', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:13:38', '2022-01-19 09:13:38'),
(174, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:14:58', '2022-01-19 09:14:58'),
(175, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:15:35', '2022-01-19 09:15:35'),
(176, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:18:59', '2022-01-19 09:18:59'),
(177, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:19:11', '2022-01-19 09:19:11'),
(178, '9947fca4-0310-4878-8f6a-a33a2970218b', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:21:18', '2022-01-19 09:21:18'),
(179, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.67.53', 'Mozilla/5.0 (Linux; Android 11; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-19 09:21:43', '2022-01-19 09:21:43'),
(180, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '120.89.95.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-01-19 12:39:10', '2022-01-19 12:39:10'),
(181, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '182.3.201.112', 'Mozilla/5.0 (Linux; Android 10; M2006C3MG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-01-21 04:35:07', '2022-01-21 04:35:07'),
(182, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '180.244.13.240', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-01-22 04:29:53', '2022-01-22 04:29:53'),
(183, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '180.244.13.240', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-01-22 04:30:10', '2022-01-22 04:30:10'),
(184, '1a026c26-964b-4974-ab22-2374f9250a0f', '180.244.13.240', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-01-22 04:31:52', '2022-01-22 04:31:52'),
(185, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.65.218', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-01 00:38:47', '2022-02-01 00:38:47'),
(186, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-07 20:36:55', '2022-02-07 20:36:55'),
(187, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-08 05:31:56', '2022-02-08 05:31:56'),
(188, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-11 16:11:49', '2022-02-11 16:11:49'),
(189, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/97.0.4692.71 Safari/537.36', 'ayocode.my.id', '2022-02-11 16:44:27', '2022-02-11 16:44:27'),
(190, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.253', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-12 14:17:49', '2022-02-12 14:17:49'),
(191, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.226', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-15 00:56:59', '2022-02-15 00:56:59'),
(192, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.79.66', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-18 06:12:48', '2022-02-18 06:12:48'),
(193, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-02-24 06:12:20', '2022-02-24 06:12:20'),
(194, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-02-25 06:00:49', '2022-02-25 06:00:49'),
(195, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-02-27 14:05:54', '2022-02-27 14:05:54');
INSERT INTO `canvas_visits` (`id`, `post_id`, `ip`, `agent`, `referer`, `created_at`, `updated_at`) VALUES
(196, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-01 14:13:18', '2022-03-01 14:13:18'),
(197, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-01 20:03:28', '2022-03-01 20:03:28'),
(198, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-03 15:43:39', '2022-03-03 15:43:39'),
(199, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-04 06:13:25', '2022-03-04 06:13:25'),
(200, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-05 15:42:28', '2022-03-05 15:42:28'),
(201, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-07 17:26:50', '2022-03-07 17:26:50'),
(202, '7332ae95-d5a0-4a34-9bb7-000f31d7fb10', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-07 20:08:44', '2022-03-07 20:08:44'),
(203, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-07 21:17:29', '2022-03-07 21:17:29'),
(204, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '110.50.84.225', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30', 'www.ayocode.my.id', '2022-03-08 09:44:37', '2022-03-08 09:44:37'),
(205, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-09 20:53:02', '2022-03-09 20:53:02'),
(206, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-10 00:03:13', '2022-03-10 00:03:13'),
(207, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-20 17:18:49', '2022-03-20 17:18:49'),
(208, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/98.0.4758.102 Safari/537.36', 'ayocode.my.id', '2022-03-20 22:25:43', '2022-03-20 22:25:43'),
(209, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-21 02:26:21', '2022-03-21 02:26:21'),
(210, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-03-24 08:07:11', '2022-03-24 08:07:11'),
(211, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-01 12:43:24', '2022-04-01 12:43:24'),
(212, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-02 20:33:39', '2022-04-02 20:33:39'),
(213, 'c99bbd6a-2aed-4cc9-99ac-6e0add7019ba', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'ayocode.my.id', '2022-04-02 21:12:09', '2022-04-02 21:12:09'),
(214, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'www.ayocode.my.id', '2022-04-02 21:13:11', '2022-04-02 21:13:11'),
(215, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2022-04-02 22:38:31', '2022-04-02 22:38:31'),
(216, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '120.188.34.29', 'Mozilla/5.0 (Linux; Android 10; RMX1851) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-04-07 06:23:47', '2022-04-07 06:23:47'),
(217, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '140.213.229.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', 'ayocode.my.id', '2022-04-10 23:45:06', '2022-04-10 23:45:06'),
(218, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.111', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-11 07:36:30', '2022-04-11 07:36:30'),
(219, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'ayocode.my.id', '2022-04-11 12:37:09', '2022-04-11 12:37:09'),
(220, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/99.0.4844.84 Safari/537.36', 'ayocode.my.id', '2022-04-11 12:38:03', '2022-04-11 12:38:03'),
(221, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.58', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-11 20:21:33', '2022-04-11 20:21:33'),
(222, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '125.167.59.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0', 'www.ayocode.my.id', '2022-04-15 19:06:41', '2022-04-15 19:06:41'),
(223, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '180.243.6.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', 'ayocode.my.id', '2022-04-17 03:48:22', '2022-04-17 03:48:22'),
(224, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:36:43', '2022-04-21 05:36:43'),
(225, '1e734a59-866f-4cde-a0b4-e9a4ed7032f0', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:00', '2022-04-21 05:37:00'),
(226, '9947fca4-0310-4878-8f6a-a33a2970218b', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:16', '2022-04-21 05:37:16'),
(227, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '103.233.89.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.43', 'ayocode.my.id', '2022-04-21 05:37:24', '2022-04-21 05:37:24'),
(228, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.120', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-22 12:14:20', '2022-04-22 12:14:20'),
(229, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'ayocode.my.id', '2022-04-22 16:06:51', '2022-04-22 16:06:51'),
(230, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ayocode.my.id', '2022-04-29 13:03:25', '2022-04-29 13:03:25'),
(231, '2b5c2910-95fc-4a3c-b58c-27c825d6a425', '66.249.71.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'ayocode.my.id', '2022-04-29 16:36:20', '2022-04-29 16:36:20'),
(232, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '101.255.164.62', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 OPR/83.0.4254.19', 'ayocode.my.id', '2022-04-30 06:53:14', '2022-04-30 06:53:14'),
(233, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.106', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'www.ayocode.my.id', '2022-05-04 03:11:07', '2022-05-04 03:11:07'),
(234, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '66.249.71.111', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/100.0.4896.127 Safari/537.36', 'www.ayocode.my.id', '2022-05-04 04:21:04', '2022-05-04 04:21:04'),
(235, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '180.251.118.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'www.ayocode.my.id', '2022-05-06 07:21:13', '2022-05-06 07:21:13'),
(236, 'd102b1f8-a2ce-4dc2-b0dd-1fd102f0502c', '36.80.76.137', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G313HZ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', 'www.ayocode.my.id', '2022-05-07 22:52:50', '2022-05-07 22:52:50'),
(237, 'b40d21f0-0aa1-49da-879f-9696b84f07d4', '103.233.89.235', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-05-09 10:59:37', '2022-05-09 10:59:37'),
(238, '01266d9a-88f4-4396-b20d-eb8438778728', '103.233.89.235', 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Mobile Safari/537.36', 'ayocode.my.id', '2022-05-09 10:59:44', '2022-05-09 10:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `parent_id`, `comment`, `reply_target`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'post-b90b31a9-10e3-4681-a350-a0082860b0e3', NULL, '<p>good!</p>', NULL, NULL, '2021-07-15 12:26:50', '2021-07-15 12:26:50'),
(2, 1, 'post-b90b31a9-10e3-4681-a350-a0082860b0e3', 1, '<p>wkwk</p>', '{\"name\":\"iyan pratama\",\"email\":\"iyanpratama2002@gmail.com\",\"comment\":\"<p>good!</p>\\n\"}', NULL, '2021-07-15 12:28:13', '2021-07-15 12:28:13'),
(3, 2, 'post-b90b31a9-10e3-4681-a350-a0082860b0e3', NULL, '<p>test</p>', NULL, NULL, '2021-07-29 05:29:26', '2021-07-29 05:29:26'),
(4, 1, 'post-b40d21f0-0aa1-49da-879f-9696b84f07d4', NULL, '<p>test</p>\n\n<p>&nbsp;</p>', NULL, NULL, '2021-09-15 17:23:26', '2021-09-15 17:23:26'),
(5, 3, 'post-1e734a59-866f-4cde-a0b4-e9a4ed7032f0', NULL, '<p>Nice</p>', NULL, NULL, '2021-11-15 17:08:20', '2021-11-15 17:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `comment_users`
--

CREATE TABLE `comment_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_users`
--

INSERT INTO `comment_users` (`id`, `name`, `email`, `is_admin`, `avatar`, `website`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'iyan pratama', 'iyanpratama2002@gmail.com', 0, 'https://secure.gravatar.com/avatar/6d93a459ca7f18b08742e911251415aa?s=200&d=retro&r=g', NULL, NULL, '2021-07-15 12:26:50', '2021-07-15 12:26:50'),
(2, 'iqbal', 'trickster.net215@gmail.com', 0, 'https://secure.gravatar.com/avatar/e38fe37e97016fb4d9eae4480504c2f8?s=200&d=retro&r=g', NULL, NULL, '2021-07-29 05:29:26', '2021-07-29 05:29:26'),
(3, 'Iqbal', 'iqbal@gmail.com', 0, 'https://secure.gravatar.com/avatar/7fc162ba3cc26077924a93c9e394056f?s=200&d=retro&r=g', NULL, NULL, '2021-11-15 17:08:20', '2021-11-15 17:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"b1309a5d-f908-450e-bf7b-040362bc51f2\",\"displayName\":\"App\\\\Events\\\\NewDiscussion\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1626352010, 1626352010),
(2, 'default', '{\"uuid\":\"6bdf8f08-fda1-4210-aedc-9ce74a297d2d\",\"displayName\":\"App\\\\Listeners\\\\sendDiscussionNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:40:\\\"App\\\\Listeners\\\\sendDiscussionNotification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1626352010, 1626352010),
(3, 'default', '{\"uuid\":\"a4eee2bd-014d-47be-8285-efb08e8cf6b9\",\"displayName\":\"App\\\\Events\\\\NewDiscussion\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1626352093, 1626352093),
(4, 'default', '{\"uuid\":\"d16c8b66-ee11-44e6-9d8b-102fc59df174\",\"displayName\":\"App\\\\Listeners\\\\sendDiscussionNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:40:\\\"App\\\\Listeners\\\\sendDiscussionNotification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1626352093, 1626352093),
(5, 'default', '{\"uuid\":\"cfce2bcb-56a4-481c-b37d-fb830bd44de3\",\"displayName\":\"App\\\\Events\\\\NewDiscussion\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1627536566, 1627536566),
(6, 'default', '{\"uuid\":\"8fb32f9f-57d4-4aa1-8042-93b9353a7444\",\"displayName\":\"App\\\\Listeners\\\\sendDiscussionNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:40:\\\"App\\\\Listeners\\\\sendDiscussionNotification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1627536566, 1627536566),
(7, 'default', '{\"uuid\":\"47be6e20-d4c6-48ca-a781-0ab58254ff4e\",\"displayName\":\"App\\\\Events\\\\NewDiscussion\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1631726606, 1631726606),
(8, 'default', '{\"uuid\":\"3f4c56d8-ce7d-4fa5-9667-37a8cc0b51a9\",\"displayName\":\"App\\\\Listeners\\\\sendDiscussionNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:40:\\\"App\\\\Listeners\\\\sendDiscussionNotification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1631726606, 1631726606),
(9, 'default', '{\"uuid\":\"da34ef18-a5e0-4107-9e50-3aa03d1d09b3\",\"displayName\":\"App\\\\Events\\\\NewDiscussion\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1636996100, 1636996100),
(10, 'default', '{\"uuid\":\"9106d041-449c-412d-9496-dca10b4f1436\",\"displayName\":\"App\\\\Listeners\\\\sendDiscussionNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:40:\\\"App\\\\Listeners\\\\sendDiscussionNotification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:24:\\\"App\\\\Events\\\\NewDiscussion\\\":2:{s:10:\\\"discussion\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Comment\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1636996100, 1636996100);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canvas_posts`
--
ALTER TABLE `canvas_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_posts_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_posts_user_id_index` (`user_id`);
ALTER TABLE `canvas_posts` ADD FULLTEXT KEY `title` (`title`,`summary`);

--
-- Indexes for table `canvas_posts_tags`
--
ALTER TABLE `canvas_posts_tags`
  ADD UNIQUE KEY `canvas_posts_tags_post_id_tag_id_unique` (`post_id`,`tag_id`);

--
-- Indexes for table `canvas_posts_topics`
--
ALTER TABLE `canvas_posts_topics`
  ADD UNIQUE KEY `canvas_posts_topics_post_id_topic_id_unique` (`post_id`,`topic_id`);

--
-- Indexes for table `canvas_tags`
--
ALTER TABLE `canvas_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_tags_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_tags_created_at_index` (`created_at`),
  ADD KEY `canvas_tags_user_id_index` (`user_id`);

--
-- Indexes for table `canvas_topics`
--
ALTER TABLE `canvas_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_topics_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_topics_created_at_index` (`created_at`),
  ADD KEY `canvas_topics_user_id_index` (`user_id`);

--
-- Indexes for table `canvas_users`
--
ALTER TABLE `canvas_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_users_email_unique` (`email`),
  ADD UNIQUE KEY `canvas_users_username_unique` (`username`);

--
-- Indexes for table `canvas_views`
--
ALTER TABLE `canvas_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canvas_views_created_at_index` (`created_at`),
  ADD KEY `canvas_views_post_id_index` (`post_id`);

--
-- Indexes for table `canvas_visits`
--
ALTER TABLE `canvas_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_users`
--
ALTER TABLE `comment_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canvas_views`
--
ALTER TABLE `canvas_views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `canvas_visits`
--
ALTER TABLE `canvas_visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment_users`
--
ALTER TABLE `comment_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
