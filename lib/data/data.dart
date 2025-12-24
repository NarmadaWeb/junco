import '../models/models.dart';

// --- SYMPTOMS ---
// Updated with more granular symptoms for better precision

const List<Symptom> symptoms = [
  // --- LEAF SYMPTOMS ---
  Symptom(
      id: 'leaf_yellowing',
      title: 'Daun Menguning (Klorosis)',
      description: 'Daun berubah warna menjadi kuning, bisa menyeluruh atau bercak.',
      type: 'leaf',
      icon: 'format_color_reset'),
  Symptom(
      id: 'leaf_spots_brown',
      title: 'Bercak Daun Coklat',
      description: 'Bintik coklat menyebar, seringkali dengan tepi kuning.',
      type: 'leaf',
      icon: 'grain'),
  Symptom(
      id: 'leaf_spots_white',
      title: 'Bercak Putih/Transparan',
      description: 'Bercak putih atau transparan pada daun muda.',
      type: 'leaf',
      icon: 'opacity'),
  Symptom(
      id: 'leaf_curling',
      title: 'Daun Keriting/Melengkung',
      description: 'Bentuk daun tidak normal, melengkung ke atas atau bawah.',
      type: 'leaf',
      icon: 'waves'),
  Symptom(
      id: 'leaf_wilting',
      title: 'Layu Mendadak',
      description: 'Daun tampak layu seolah kekurangan air padahal tanah basah.',
      type: 'leaf',
      icon: 'grass'),
  Symptom(
      id: 'leaf_holes',
      title: 'Daun Berlubang',
      description: 'Lubang-lubang besar tidak beraturan (bekas gigitan).',
      type: 'leaf',
      icon: 'grid_goldenratio'),
  Symptom(
      id: 'leaf_shot_holes',
      title: 'Lubang Jarum (Shot Holes)',
      description: 'Banyak lubang kecil-kecil seperti tembakan peluru.',
      type: 'leaf',
      icon: 'scatter_plot'),
  Symptom(
      id: 'leaf_skeleton',
      title: 'Sisa Tulang Daun',
      description: 'Daging daun habis dimakan, tersisa tulang daun saja.',
      type: 'leaf',
      icon: 'account_tree'),
  Symptom(
      id: 'leaf_tip_burn',
      title: 'Ujung Daun Terbakar',
      description: 'Ujung dan tepi daun mengering (nekrosis).',
      type: 'leaf',
      icon: 'local_fire_department'),
  Symptom(
      id: 'leaf_fall',
      title: 'Daun Gugur (Rontok)',
      description: 'Daun rontok sebelum waktunya (defoliasi).',
      type: 'leaf',
      icon: 'vertical_align_bottom'),

  // --- FRUIT SYMPTOMS ---
  Symptom(
      id: 'fruit_rot_black',
      title: 'Busuk Hitam',
      description: 'Bercak coklat kehitaman meluas cepat dari pangkal/ujung.',
      type: 'fruit',
      icon: 'sentiment_very_dissatisfied'),
  Symptom(
      id: 'fruit_rot_watery',
      title: 'Busuk Basah/Berair',
      description: 'Daging buah lunak, berair, dan berbau masam.',
      type: 'fruit',
      icon: 'water_drop'),
  Symptom(
      id: 'fruit_spots_scab',
      title: 'Bercak Kudis/Kering',
      description: 'Bercak kasar/kering pada kulit buah.',
      type: 'fruit',
      icon: 'texture'),
  Symptom(
      id: 'fruit_stunted',
      title: 'Buah Kerdil/Mengecil',
      description: 'Perkembangan buah terhambat, bentuk tidak simetris.',
      type: 'fruit',
      icon: 'compress'),
  Symptom(
      id: 'fruit_hard',
      title: 'Buah Mengeras (Batu)',
      description: 'Kulit dan daging buah keras, sulit dibuka.',
      type: 'fruit',
      icon: 'landscape'),
  Symptom(
      id: 'fruit_premature_ripening',
      title: 'Masak Awal Belang',
      description: 'Buah tampak masak (kuning/oranye) tapi tidak merata.',
      type: 'fruit',
      icon: 'palette'),
  Symptom(
      id: 'fruit_mummy',
      title: 'Buah Mumifikasi',
      description: 'Buah mengering, mengecil, dan tetap menggantung di pohon.',
      type: 'fruit',
      icon: 'block'),

  // --- STEM SYMPTOMS ---
  Symptom(
      id: 'stem_gum',
      title: 'Keluar Getah (Gumosis)',
      description: 'Cairan kental berwarna gelap keluar dari batang.',
      type: 'stem',
      icon: 'bloodtype'),
  Symptom(
      id: 'stem_canker',
      title: 'Kanker Batang',
      description: 'Luka terbuka, kulit batang melepuh atau cekung.',
      type: 'stem',
      icon: 'coronavirus'),
  Symptom(
      id: 'stem_holes_borer',
      title: 'Lubang Gerekan',
      description: 'Lubang kecil dengan serbuk kayu/kotoran di sekitarnya.',
      type: 'stem',
      icon: 'pest_control'),
  Symptom(
      id: 'stem_white_threads',
      title: 'Benang Putih (Jamur)',
      description: 'Anyaman benang putih (miselium) pada permukaan batang/ranting.',
      type: 'stem',
      icon: 'linear_scale'),
  Symptom(
      id: 'stem_dieback',
      title: 'Mati Ujung (Dieback)',
      description: 'Kematian ranting dimulai dari ujung menyebar ke pangkal.',
      type: 'stem',
      icon: 'north_east'),
];

// --- DISEASES ---

const List<Disease> diseases = [
  // 1. Busuk Buah (Black Pod)
  Disease(
    id: 'black_pod',
    name: 'Busuk Buah (Black Pod)',
    scientificName: 'Phytophthora palmivora',
    description:
        'Penyakit paling merugikan pada kakao. Disebabkan oleh jamur yang menyerang berbagai bagian tanaman, terutama buah. Infeksi menyebar cepat pada kondisi lembab dan curah hujan tinggi.',
    symptomIds: ['fruit_rot_black', 'fruit_mummy', 'stem_canker', 'leaf_spots_brown'],
    symptomWeights: {
      'fruit_rot_black': 1.0, // Indikator utama
      'fruit_mummy': 0.8,
      'stem_canker': 0.6,
      'leaf_spots_brown': 0.4,
    },
    solution:
        '''
**Tindakan Kuratif (Pengobatan):**
1.  **Panen & Sanitasi Rutin:** Petik buah sakit segera (jangan dibiarkan di pohon). Kubur buah sakit sedalam 30cm.
2.  **Fungisida:** Semprot fungisida berbahan aktif tembaga (Cu) atau Metalaksil pada buah sehat untuk perlindungan. Lakukan 2 minggu sekali saat musim hujan.

**Tindakan Preventif:**
1.  **Pemangkasan:** Pangkas pohon pelindung dan pohon kakao untuk mengurangi kelembaban kebun (sinar matahari masuk 50-70%).
2.  **Drainase:** Perbaiki saluran air agar tidak ada genangan.
3.  **Panen Sering:** Lakukan panen seminggu sekali untuk memutus siklus spora jamur.
        ''',
    prevention: 'Gunakan klon tahan (ICCRI 03, ICCRI 04). Jaga kebersihan alat pertanian agar tidak menularkan spora.',
    riskLevel: 'Tinggi',
    cause: 'Jamur (Fungi)',
  ),

  // 2. VSD (Vascular Streak Dieback)
  Disease(
    id: 'vsd',
    name: 'VSD (Vascular Streak Dieback)',
    scientificName: 'Ceratobasidium theobromae',
    description:
        'Penyakit pembuluh kayu yang mematikan ranting produktif. Gejala khas adalah daun menguning dengan bercak hijau (green island) dan rontok, menyisakan ranting gundul.',
    symptomIds: ['leaf_yellowing', 'leaf_fall', 'stem_dieback', 'leaf_spots_brown'],
    symptomWeights: {
      'leaf_yellowing': 0.9,
      'leaf_fall': 0.8,
      'stem_dieback': 1.0, // Sangat khas
      'leaf_spots_brown': 0.3,
    },
    solution:
        '''
**Pengendalian:**
1.  **Pangkas Sanitasi:** Potong ranting yang terinfeksi minimal 30-40 cm di bawah gejala terlihat (sampai kayu terlihat sehat/putih bersih).
2.  **Proteksi Luka:** Oleskan fungisida pada bekas potongan untuk mencegah infeksi sekunder.
3.  **Penguatan Tanaman:** Berikan pupuk ekstra (Kalium & Kalsium) untuk meningkatkan ketahanan tanaman.
        ''',
    prevention: 'Karantina bibit dari daerah wabah. Gunakan bibit yang sudah teruji tahan VSD.',
    riskLevel: 'Sedang',
    cause: 'Jamur (Fungi)',
  ),

  // 3. Penggerek Buah Kakao (PBK)
  Disease(
    id: 'pbk',
    name: 'Penggerek Buah Kakao (PBK)',
    scientificName: 'Conopomorpha cramerella',
    description:
        'Hama ulat yang menggerek masuk ke dalam buah, memakan plasenta biji sehingga biji lengket (gumpal) dan mutu turun drastis.',
    symptomIds: ['fruit_premature_ripening', 'fruit_hard', 'fruit_stunted'],
    symptomWeights: {
      'fruit_premature_ripening': 1.0, // Masak tidak merata sangat khas
      'fruit_hard': 0.7,
      'fruit_stunted': 0.5,
    },
    solution:
        '''
**Strategi P3S (Panen Sering, Pemangkasan, Pemupukan, Sanitasi):**
1.  **Panen Sering:** Lakukan panen 1 minggu sekali untuk memutus siklus hidup ulat sebelum keluar dari buah.
2.  **Sarungisasi:** Bungkus buah muda (panjang 8-10 cm) dengan plastik bening yang dilubangi bagian bawahnya.
3.  **Sanitasi:** Kubur kulit buah sisa panen, jangan ditumpuk di kebun.
        ''',
    prevention: 'Gunakan perangkap feromon seksual untuk menangkap ngengat jantan. Gunakan musuh alami semut hitam.',
    riskLevel: 'Tinggi',
    cause: 'Hama (Serangga)',
  ),

  // 4. Helopeltis (Kepik Penghisap)
  Disease(
    id: 'helopeltis',
    name: 'Hama Helopeltis',
    scientificName: 'Helopeltis spp.',
    description:
        'Kepik yang menusuk dan menghisap cairan buah muda serta pucuk daun. Menimbulkan bercak cekung coklat/hitam pada kulit buah (kudis).',
    symptomIds: ['fruit_spots_scab', 'leaf_shot_holes', 'leaf_wilting', 'stem_dieback'],
    symptomWeights: {
      'fruit_spots_scab': 1.0, // Bercak khas
      'stem_dieback': 0.6, // Pada serangan pucuk
      'leaf_wilting': 0.5,
      'leaf_shot_holes': 0.3,
    },
    solution:
        '''
**Pengendalian Terpadu:**
1.  **Biologis:** Gunakan semut hitam (Dolichoderus thoracicus) dan kutu putih sebagai musuh alami.
2.  **Nabati:** Semprot ekstrak daun mimba atau sirsak pada pagi/sore hari.
3.  **Kimia:** Jika serangan berat, gunakan insektisida kontak lambung (golongan piretroid sintetik) secara bijaksana.
        ''',
    prevention: 'Kurangi naungan yang terlalu rimbun karena Helopeltis suka tempat gelap dan lembab.',
    riskLevel: 'Sedang',
    cause: 'Hama (Serangga)',
  ),

  // 5. Kanker Batang (Stem Canker)
  Disease(
    id: 'stem_canker',
    name: 'Kanker Batang',
    scientificName: 'Phytophthora palmivora',
    description:
        'Infeksi jamur pada kulit batang. Kulit membusuk, basah, berwarna gelap, dan mengeluarkan cairan kemerahan. Dapat mematikan pohon jika melingkar penuh.',
    symptomIds: ['stem_canker', 'stem_gum', 'leaf_yellowing'],
    symptomWeights: {
      'stem_canker': 1.0,
      'stem_gum': 0.9,
      'leaf_yellowing': 0.4, // Gejala sekunder akibat gangguan nutrisi
    },
    solution:
        '''
**Pembedahan & Pengobatan:**
1.  **Kupas:** Kupas kulit batang yang sakit sampai batas jaringan sehat (warna putih).
2.  **Oles:** Oleskan fungisida (bubur bordo atau formulasi tembaga) pada bagian yang dikupas.
3.  **Tutup:** Biarkan kering angin, jangan ditutup tanah basah.
        ''',
    prevention: 'Hindari melukai batang saat menyiangi gulma. Kendalikan populasi semut yang bisa membawa tanah berjamur ke batang.',
    riskLevel: 'Tinggi',
    cause: 'Jamur (Fungi)',
  ),

  // 6. Penyakit Jamur Upas (Pink Disease)
  Disease(
    id: 'pink_disease',
    name: 'Jamur Upas',
    scientificName: 'Upasia salmonicolor',
    description:
        'Penyakit jamur yang menyerang cabang/ranting. Terlihat kerak berwarna merah muda (pink) pada sisi bawah cabang.',
    symptomIds: ['stem_white_threads', 'stem_dieback', 'leaf_wilting'],
    symptomWeights: {
      'stem_white_threads': 0.9, // Awalnya putih lalu jadi pink
      'stem_dieback': 0.8,
      'leaf_wilting': 0.6,
    },
    solution:
        '''
**Pengobatan:**
1.  **Awal:** Jika masih benang putih, oles fungisida tembaga.
2.  **Lanjut:** Potong cabang sakit 10 cm di bawah gejala. Bakar potongan tersebut.
        ''',
    prevention: 'Kurangi kelembaban kebun dengan pemangkasan teratur.',
    riskLevel: 'Rendah',
    cause: 'Jamur (Fungi)',
  ),

  // 7. Penggerek Batang (Stem Borer)
  Disease(
    id: 'stem_borer',
    name: 'Penggerek Batang',
    scientificName: 'Zeuzera coffeae',
    description:
        'Larva serangga yang melubangi batang dan cabang untuk hidup di dalamnya. Menyebabkan cabang mudah patah dan mati.',
    symptomIds: ['stem_holes_borer', 'stem_dieback', 'leaf_wilting'],
    symptomWeights: {
      'stem_holes_borer': 1.0,
      'stem_dieback': 0.7,
      'leaf_wilting': 0.5,
    },
    solution:
        '''
**Mekanik & Kimia:**
1.  **Sogok:** Tusuk lubang dengan kawat untuk membunuh larva.
2.  **Sumbat:** Masukkan kapas yang dibasahi insektisida sistemik ke lubang, lalu tutup dengan tanah liat/lilin.
3.  **Potong:** Jika cabang kecil, potong dan bakar.
        ''',
    prevention: 'Jaga kebersihan kebun dari gulma inang.',
    riskLevel: 'Sedang',
    cause: 'Hama (Serangga)',
  ),

  // 8. Defisiensi Nutrisi (Umum)
  Disease(
    id: 'nutrient_deficiency',
    name: 'Defisiensi Nutrisi (Hara)',
    scientificName: 'Fisiologis',
    description:
        'Kekurangan unsur hara (N, P, K, Mg, dll) menyebabkan pertumbuhan terhambat dan kelainan daun, namun tidak ada tanda patogen/hama.',
    symptomIds: ['leaf_yellowing', 'leaf_tip_burn', 'fruit_stunted'],
    symptomWeights: {
      'leaf_yellowing': 0.8,
      'leaf_tip_burn': 0.7,
      'fruit_stunted': 0.5,
    },
    solution:
        '''
**Pemupukan Berimbang:**
1.  **Uji Tanah:** Sebaiknya uji tanah untuk tahu kekurangan spesifik.
2.  **Aplikasi:** Berikan pupuk NPK dan unsur mikro (seperti Kieserite untuk Mg) sesuai dosis anjuran umur tanaman.
3.  **Organik:** Tambahkan kompos/pupuk kandang untuk memperbaiki struktur tanah.
        ''',
    prevention: 'Jadwal pemupukan rutin 2x setahun (awal & akhir musim hujan).',
    riskLevel: 'Rendah',
    cause: 'Fisiologis',
  ),

  // 9. Tanaman Sehat
  Disease(
    id: 'healthy',
    name: 'Tanaman Sehat',
    scientificName: 'Theobroma cacao',
    description:
        'Tidak ditemukan indikasi penyakit atau hama utama yang signifikan. Kondisi fisik tanaman tampak normal.',
    symptomIds: [],
    symptomWeights: {},
    solution:
        '''
**Pemeliharaan Rutin:**
1.  Lanjutkan pemupukan berimbang.
2.  Lakukan pemangkasan bentuk dan pemeliharaan rutin.
3.  Monitor kebun secara berkala.
        ''',
    prevention: 'Pertahankan sanitasi dan drainase yang baik.',
    riskLevel: 'Aman',
    cause: '-',
  ),
];
