import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/bottom_nav.dart';
import 'package:junco_app/widgets/mobile_container.dart';
import 'package:provider/provider.dart';
import 'package:junco_app/main.dart'; // To access DiagnosisState

class DiagnosisStartScreen extends StatelessWidget {
  const DiagnosisStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileContainer(
      bottomNav: const BottomNav(currentRoute: '/diagnosis-start'),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.go('/home'),
                  icon: const Icon(Icons.arrow_back),
                  style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor),
                ),
                const Text(
                  'Diagnosis Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    // Reset diagnosis
                    context.read<DiagnosisState>().clearSymptoms();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Data diagnosis direset')));
                  },
                  icon: const Icon(Icons.refresh),
                  style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                    children: const [
                      TextSpan(text: 'Pilih Lokasi '),
                      TextSpan(
                          text: 'Gejala',
                          style: TextStyle(color: AppTheme.primary)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih bagian tanaman yang menunjukkan tanda-tanda penyakit untuk memulai analisis data offline.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 32),
                _CategoryCard(
                  title: 'Gejala pada Daun',
                  subtitle:
                      'Bercak, perubahan warna, lubang, atau layu pada dedaunan.',
                  icon: Icons.spa,
                  bgIcon: Icons.eco,
                  color: Colors.green,
                  onTap: () => context.push('/diagnosis-leaf'),
                ),
                const SizedBox(height: 16),
                _CategoryCard(
                  title: 'Gejala pada Buah',
                  subtitle:
                      'Busuk buah, pengerasan, atau perubahan bentuk pada kakao.',
                  icon: Icons
                      .local_dining, // Replaced non-existent nutrition icon
                  bgIcon: Icons.local_florist, // Fallback
                  color: Colors.orange,
                  onTap: () => context.push('/diagnosis-fruit'),
                ),
                const SizedBox(height: 16),
                _CategoryCard(
                  title: 'Gejala Batang & Akar',
                  subtitle:
                      'Kanker batang, retakan kulit, atau masalah pada pangkal akar.',
                  icon: Icons.forest,
                  bgIcon: Icons.forest,
                  color: Colors.brown,
                  onTap: () => context.push('/diagnosis-stem'),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    border:
                        Border.all(color: AppTheme.primary.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb,
                          color: AppTheme.primary, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tips Diagnosis Akurat',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Periksa tanaman secara menyeluruh sebelum memasukkan data. Semakin detail input, semakin akurat hasil analisis.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData bgIcon;
  final Color color;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgIcon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.transparent, // Initial border
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Icon(
                bgIcon,
                size: 140,
                color: color.withOpacity(0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: color, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
