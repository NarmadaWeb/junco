import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/mobile_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileContainer(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
              border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1))),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(backgroundColor: Theme.of(context).cardColor),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Tentang JunCo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppTheme.primary, Color(0xFF1e8a4a)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.forest, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'JunCo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Sistem Pakar Diagnosis Kakao',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'JunCo adalah aplikasi sistem pakar yang dirancang untuk membantu petani kakao dalam mendiagnosis penyakit dan hama pada tanaman kakao secara dini. Menggunakan metode Certainty Factor, aplikasi ini memberikan hasil diagnosis yang akurat berdasarkan gejala yang diamati.',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.5),
                  ),

                  const SizedBox(height: 32),
                  _InfoItem(
                    icon: Icons.offline_pin,
                    title: 'Bekerja Offline',
                    description: 'Aplikasi ini dirancang untuk bekerja tanpa koneksi internet, sangat cocok untuk penggunaan di kebun.',
                  ),
                  const SizedBox(height: 16),
                  _InfoItem(
                    icon: Icons.science,
                    title: 'Basis Pengetahuan Pakar',
                    description: 'Data gejala dan penyakit dikompilasi dari literatur pertanian terpercaya dan pakar kakao.',
                  ),

                  const SizedBox(height: 48),
                  Text(
                    'Versi 1.0.0',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InfoItem({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
