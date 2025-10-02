class Character {
  final String id, name, role, description, imageUrl;
  Character({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.imageUrl,
  });
}

final demoCharacters = [
  Character(
    id: 't1',
    name: 'Tanjiro Kamado',
    role: 'Demon Slayer — Sun Breathing User',
    description:
        'Seorang pemuda berhati emas yang menjadi Pembasmi Iblis untuk menyembuhkan adiknya. Awalnya pengguna Pernapasan Air, ia juga mewarisi tarian Hinokami Kagura, sebuah bentuk Pernapasan Matahari legendaris.',
    imageUrl: 'assets/tnj.png',
  ),
  Character(
    id: 't2',
    name: 'Nezuko Kamado',
    role: 'Demon — The Chosen Demon',
    description:
        'Adik Tanjiro yang menjadi iblis namun menolak memakan manusia. Ia melindungi manusia dan menggunakan Blood Demon Art "Exploding Blood" yang dapat membakar racun iblis dan melukai iblis lain.',
    imageUrl: 'assets/nzkk.png',
  ),
  Character(
    id: 't3',
    name: 'Zenitsu Agatsuma',
    role: 'Demon Slayer — Thunder Breathing User',
    description:
        'Sangat penakut saat sadar, namun berubah menjadi petarung kilat saat tertidur. Ia hanya menguasai Bentuk Pertama Pernapasan Petir, tetapi telah menyempurnakannya hingga level ekstrim dengan teknik Godspeed.',
    imageUrl: 'assets/zns.png',
  ),
  Character(
    id: 't4',
    name: 'Inosuke Hashibira',
    role: 'Demon Slayer — Beast Breathing User',
    description:
        'Dibesarkan oleh babi hutan, ia sangat liar, kompetitif, dan bangga dengan kekuatannya. Ia menciptakan Pernapasan Binatang sendiri dan bertarung menggunakan dua pedang Nichirin bergerigi.',
    imageUrl: 'assets/ins.png',
  ),
  Character(
    id: 't5',
    name: 'Giyu Tomioka',
    role: 'Hashira — Water Pillar',
    description:
        'Hashira Air yang pendiam dan penyendiri. Dia adalah pendekar pedang yang sangat kuat dan pencipta Bentuk Kesebelas Pernapasan Air: Dead Calm, sebuah teknik pertahanan mutlak.',
    imageUrl: 'assets/gyu.png',
  ),
  Character(
    id: 't6',
    name: 'Shinobu Kocho',
    role: 'Hashira — Insect Pillar',
    description:
        'Terlihat ramah dan santai, namun menyimpan amarah yang dalam terhadap iblis. Karena fisiknya tidak cukup kuat untuk memenggal iblis, ia menjadi ahli racun yang mematikan, membunuh iblis dari dalam.',
    imageUrl: 'assets/snb.png',
  ),
  Character(
    id: 't7',
    name: 'Kanao Tsuyuri',
    role: 'Demon Slayer — Flower Breathing User',
    description:
        'Tsuguko (penerus) dari Shinobu Kocho. Awalnya sangat pendiam dan tidak bisa mengambil keputusan, namun memiliki bakat luar biasa dan penglihatan super yang ia gunakan dalam pertempuran.',
    imageUrl: 'assets/kno.png',
  ),
  Character(
    id: 't8',
    name: 'Kyojuro Rengoku',
    role: 'Hashira — Flame Pillar',
    description:
        'Hashira Api dengan semangat yang membara dan kepribadian karismatik. Ia sangat kuat, optimis, dan menjadi mentor penting bagi Tanjiro. Teknik pedangnya adalah pertunjukan kekuatan yang luar biasa.',
    imageUrl: 'assets/rng.png',
  ),
  Character(
    id: 't9',
    name: 'Tengen Uzui',
    role: 'Hashira — Sound Pillar',
    description:
        'Mantan shinobi yang sangat eksentrik dan "flamboyan". Hashira Suara ini bertarung dengan dua pedang besar, menganalisis serangan musuh sebagai "partitur musik" untuk menemukan celah.',
    imageUrl: 'assets/tgn.png',
  ),
  Character(
    id: 't10',
    name: 'Muichiro Tokito',
    role: 'Hashira — Mist Pillar',
    description:
        'Seorang jenius yang menjadi Hashira hanya dalam dua bulan. Ia sering terlihat linglung dan tanpa emosi karena amnesia, namun bertarung dengan logika murni dan teknik Pernapasan Kabut yang mengelabui.',
    imageUrl: 'assets/mcr.png',
  ),
  Character(
    id: 't11',
    name: 'Mitsuri Kanroji',
    role: 'Hashira — Love Pillar',
    description:
        'Hashira Cinta yang ceria dan emosional, dengan kekuatan fisik delapan kali lipat dari manusia normal. Ia menggunakan pedang unik yang tipis dan fleksibel seperti cambuk, dikombinasikan dengan Pernapasan Cinta.',
    imageUrl: 'assets/mts.png',
  ),
  Character(
    id: 'mzn',
    name: 'Muzan Kibutsuji',
    role: 'Progenitor of Demons',
    description:
        'Iblis pertama dan antagonis utama seri ini. Kejam, narsisistik, dan terobsesi untuk menaklukkan matahari. Ia adalah musuh bebuyutan Korps Pembasmi Iblis.',
    imageUrl: 'assets/mzn.png',
  ),
  Character(
    id: 'd2',
    name: 'Akaza',
    role: 'Upper Rank Three Demon',
    description:
        'Iblis Peringkat Atas Tiga yang menghormati kekuatan di atas segalanya. Ia bertarung dengan tangan kosong menggunakan seni bela diri yang menghancurkan dan selalu mengajak lawan kuat untuk menjadi iblis.',
    imageUrl: 'assets/akz.png',
  ),
  Character(
    id: 'd3',
    name: 'Daki & Gyutaro',
    role: 'Upper Rank Six Demon',
    description:
        'Kakak-beradik yang berbagi posisi Peringkat Atas Enam. Daki menggunakan selendangnya sebagai senjata, sementara Gyutaro muncul dari punggungnya dengan sabit beracun. Mereka hanya bisa dikalahkan jika dipenggal bersamaan.',
    imageUrl: 'assets/dgy.png',
  ),
];
