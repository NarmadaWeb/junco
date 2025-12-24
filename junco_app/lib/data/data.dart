import '../models/models.dart';

// --- SYMPTOMS ---

const List<Symptom> symptoms = [
  // Leaf Symptoms
  Symptom(
      id: 'leaf_yellowing',
      title: 'Daun Menguning',
      description: 'Perubahan warna klorosis',
      type: 'leaf',
      icon: 'format_color_reset'),
  Symptom(
      id: 'leaf_spots',
      title: 'Bercak Daun',
      description: 'Bintik coklat/hitam menyebar',
      type: 'leaf',
      icon: 'grain'),
  Symptom(
      id: 'leaf_curling',
      title: 'Keriting / Melengkung',
      description: 'Deformasi bentuk daun',
      type: 'leaf',
      icon: 'waves'),
  Symptom(
      id: 'leaf_wilting',
      title: 'Layu / Mengering',
      description: 'Daun tampak layu atau mati',
      type: 'leaf',
      icon: 'grass'),
  Symptom(
      id: 'leaf_holes',
      title: 'Berlubang',
      description: 'Kerusakan fisik atau hama',
      type: 'leaf',
      icon: 'grid_goldenratio'),
  Symptom(
      id: 'leaf_yellow_veins',
      title: 'Tulang Daun Menguning',
      description: 'Warna kuning di sekitar tulang daun',
      type: 'leaf',
      icon: 'texture'),
  Symptom(
      id: 'leaf_shot_holes',
      title: 'Daun Berlubang Tembus',
      description: 'Banyak lubang kecil-kecil',
      type: 'leaf',
      icon: 'scatter_plot'),

  // Fruit Symptoms
  Symptom(
      id: 'fruit_rot',
      title: 'Buah Busuk',
      description: 'Daging buah lunak dan berair',
      type: 'fruit',
      icon: 'sentiment_very_dissatisfied'),
  Symptom(
      id: 'fruit_spots',
      title: 'Bercak pada Buah',
      description: 'Bintik hitam/coklat di kulit',
      type: 'fruit',
      icon: 'blur_on'),
  Symptom(
      id: 'fruit_stunted',
      title: 'Buah Mengecil/Kerdil',
      description: 'Ukuran tidak normal atau keriput',
      type: 'fruit',
      icon: 'compress'),
  Symptom(
      id: 'fruit_hard',
      title: 'Buah Mengeras',
      description: 'Kulit buah keras seperti batu',
      type: 'fruit',
      icon: 'landscape'),
  Symptom(
      id: 'fruit_uneven_ripening',
      title: 'Masak Tidak Merata',
      description: 'Warna buah belang-belang',
      type: 'fruit',
      icon: 'palette'),

  // Stem Symptoms
  Symptom(
      id: 'stem_gum',
      title: 'Batang Bergetah',
      description: 'Keluar cairan/getah gelap',
      type: 'stem',
      icon: 'water_drop'),
  Symptom(
      id: 'stem_cracked',
      title: 'Batang Pecah-pecah',
      description: 'Retakan pada kulit batang',
      type: 'stem',
      icon: 'broken_image'),
  Symptom(
      id: 'stem_dry',
      title: 'Batang Kering',
      description: 'Batang tampak kering/mati',
      type: 'stem',
      icon: 'block'),
  Symptom(
      id: 'stem_holes',
      title: 'Lubang Hama',
      description: 'Lubang kecil bekas gerekan',
      type: 'stem',
      icon: 'pest_control'),
  Symptom(
      id: 'stem_cancer',
      title: 'Kanker Batang',
      description: 'Benjolan atau luka terbuka',
      type: 'stem',
      icon: 'coronavirus'),
];

// --- DISEASES ---

const List<Disease> diseases = [
  Disease(
    id: 'black_pod',
    name: 'Busuk Buah',
    scientificName: 'Black Pod Disease (Phytophthora palmivora)',
    description:
        'Penyakit yang disebabkan oleh jamur Phytophthora palmivora, menyebabkan buah membusuk dengan cepat, terutama pada musim hujan.',
    symptomIds: ['fruit_rot', 'fruit_spots', 'fruit_hard'],
    solution:
        '1. Sanitasi kebun: Buang buah sakit.\n2. Pemangkasan: Kurangi kelembaban.\n3. Fungisida: Semprot dengan fungisida tembaga (Copper Sandoz) setiap 2 minggu saat musim hujan.',
    prevention:
        'Jaga kebersihan kebun, lakukan pemangkasan rutin agar sirkulasi udara lancar, dan gunakan klon tahan penyakit.',
    riskLevel: 'Tinggi',
    cause: 'Jamur',
  ),
  Disease(
    id: 'vsd',
    name: 'VSD (Vascular Streak Dieback)',
    scientificName: 'Ceratobasidium theobromae',
    description:
        'Penyakit pembuluh kayu yang menyebabkan kematian ranting (dieback). Daun menguning pada satu ranting tertentu dan kemudian gugur.',
    symptomIds: ['leaf_yellowing', 'leaf_wilting', 'leaf_spots', 'leaf_yellow_veins'],
    solution:
        '1. Pangkas ranting yang sakit sampai 30 cm di bawah bagian yang terinfeksi.\n2. Oleskan fungisida pada bekas potongan.\n3. Pemberian pupuk berimbang.',
    prevention:
        'Gunakan bibit bebas VSD, karantina bibit baru, dan pemupukan yang cukup untuk meningkatkan ketahanan tanaman.',
    riskLevel: 'Sedang',
    cause: 'Jamur',
  ),
  Disease(
    id: 'stem_cancer',
    name: 'Kanker Batang',
    scientificName: 'Phytophthora palmivora',
    description:
        'Infeksi jamur pada batang yang menyebabkan kulit batang membusuk, mengeluarkan cairan, dan akhirnya bisa mematikan pohon.',
    symptomIds: ['stem_gum', 'stem_cracked', 'stem_cancer'],
    solution:
        '1. Kerok kulit yang sakit sampai bagian kayu yang sehat.\n2. Oleskan fungisida pada bagian yang dikerok.\n3. Bakar sisa kulit sakit.',
    prevention:
        'Hindari luka pada batang saat pemangkasan atau panen, kendalikan penyakit busuk buah karena penyebabnya sama.',
    riskLevel: 'Tinggi',
    cause: 'Jamur',
  ),
  Disease(
    id: 'helopeltis',
    name: 'Hama Helopeltis',
    scientificName: 'Helopeltis spp.',
    description:
        'Hama kepik penghisap buah muda dan pucuk daun, menyebabkan bercak cekung berwarna coklat/hitam.',
    symptomIds: ['fruit_spots', 'leaf_wilting', 'leaf_shot_holes', 'fruit_stunted'],
    solution:
        '1. Pengendalian hayati dengan semut hitam (Dolichoderus thoracicus).\n2. Insektisida nabati (ekstrak daun sirsak/mimba).\n3. Insektisida kimia jika serangan parah.',
    prevention:
        'Lakukan sarungisasi buah muda (pembungkusan), kurangi naungan yang terlalu gelap.',
    riskLevel: 'Sedang',
    cause: 'Hama',
  ),
  Disease(
    id: 'pbk',
    name: 'Penggerek Buah Kakao (PBK)',
    scientificName: 'Conopomorpha cramerella',
    description:
        'Ulat yang menggerek ke dalam buah, memakan daging buah dan biji, menyebabkan buah masak awal tidak merata dan biji lengket.',
    symptomIds: ['fruit_uneven_ripening', 'fruit_hard', 'fruit_stunted'],
    solution:
        '1. Panen Sering: Panen setiap minggu untuk memutus siklus hidup.\n2. Sarungisasi: Bungkus buah muda.\n3. Pangkas: Jaga ketinggian pohon maks 3-4 meter.',
    prevention:
        'Sanitasi kebun, kubur kulit buah sisa panen, dan gunakan perangkap feromon.',
    riskLevel: 'Tinggi',
    cause: 'Hama',
  ),
  Disease(
    id: 'stem_borer',
    name: 'Penggerek Batang',
    scientificName: 'Zeuzera coffeae',
    description:
        'Larva menggerek batang atau cabang, menyebabkan lubang dengan kotoran seperti serbuk gergaji.',
    symptomIds: ['stem_holes', 'stem_dry', 'leaf_wilting'],
    solution:
        '1. Potong cabang yang terserang.\n2. Masukkan kawat ke lubang untuk membunuh larva.\n3. Sumbat lubang dengan kapas berinsectisida.',
    prevention:
        'Monitor tanaman secara rutin, bersihkan gulma di sekitar tanaman.',
    riskLevel: 'Sedang',
    cause: 'Hama',
  ),
  Disease(
    id: 'healthy',
    name: 'Tanaman Sehat',
    scientificName: 'Theobroma cacao',
    description:
        'Tidak ditemukan gejala penyakit yang signifikan. Lanjutkan perawatan rutin.',
    symptomIds: [],
    solution:
        'Lanjutkan pemupukan dan penyiraman rutin. Lakukan pemangkasan bentuk dan pemeliharaan.',
    prevention:
        'Pertahankan sanitasi kebun yang baik.',
    riskLevel: 'Rendah',
    cause: '-',
  ),
];
