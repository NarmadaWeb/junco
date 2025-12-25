import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/mobile_container.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileContainer(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).dividerColor.withOpacity(0.1))),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Kebijakan Privasi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: const [
                Text(
                  'Kebijakan Privasi JunCo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Terakhir diperbarui: 24 Mei 2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 24),
                _PrivacySection(
                  title: '1. Pengumpulan Data',
                  content:
                      'JunCo adalah aplikasi yang beroperasi sepenuhnya secara offline (lokal). Kami tidak mengumpulkan, menyimpan, atau mengirimkan data pribadi Anda ke server eksternal manapun. Semua data diagnosis dan riwayat disimpan secara lokal di perangkat Anda.',
                ),
                _PrivacySection(
                  title: '2. Penggunaan Kamera & Galeri',
                  content:
                      'Aplikasi mungkin meminta izin akses kamera atau galeri hanya jika Anda menggunakan fitur identifikasi visual berbasis gambar (jika tersedia). Gambar yang diambil diproses secara lokal dan tidak diunggah ke cloud.',
                ),
                _PrivacySection(
                  title: '3. Penyimpanan Data Lokal',
                  content:
                      'Data riwayat diagnosis Anda disimpan menggunakan penyimpanan lokal perangkat. Jika Anda menghapus aplikasi atau menghapus data aplikasi, riwayat ini akan hilang permanen karena kami tidak memiliki cadangan di server.',
                ),
                _PrivacySection(
                  title: '4. Perubahan Kebijakan',
                  content:
                      'Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Perubahan akan diberitahukan melalui pembaruan aplikasi.',
                ),
                SizedBox(height: 32),
                Text(
                  'Hubungi Kami',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Jika Anda memiliki pertanyaan tentang kebijakan ini, silakan hubungi pengembang aplikasi.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  final String title;
  final String content;

  const _PrivacySection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
                fontSize: 14, color: Colors.grey.shade600, height: 1.5),
          ),
        ],
      ),
    );
  }
}
