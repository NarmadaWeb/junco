import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/main.dart';
import 'package:junco_app/models/models.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/utils/expert_system.dart';
import 'package:junco_app/widgets/mobile_container.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiagnosisState>();
    final result = ExpertSystem.diagnose(state.selectedSymptoms);

    return MobileContainer(
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_cocoa.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.9),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Header
          Positioned(
            top: 50,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.eco, color: AppTheme.primary, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'JUNCO',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: IconButton(
                    icon: const Icon(Icons.help_outline,
                        size: 20, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Content
          Positioned.fill(
            top: 120,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // Result Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'STATUS',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(height: 4),
                              const Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: AppTheme.primary, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Selesai',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'KEPERCAYAAN',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '${result.confidence}%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: AppTheme.primary),
                                  ),
                                  const SizedBox(width: 2),
                                  const Icon(Icons.trending_up,
                                      color: AppTheme.primary, size: 16),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(height: 32),

                      // Disease Info
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.red.withOpacity(0.2)),
                        ),
                        child: Text(
                          result.disease.riskLevel == 'Rendah'
                              ? 'KONDISI AMAN'
                              : 'PENYAKIT TERDETEKSI',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: result.disease.riskLevel == 'Rendah'
                                  ? Colors.green
                                  : Colors.red,
                              letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        result.disease.name,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            height: 1.1),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        result.disease.scientificName,
                        style: const TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        result.disease.description,
                        style: const TextStyle(height: 1.5, fontSize: 14),
                      ),
                      const SizedBox(height: 24),

                      // Attributes
                      Row(
                        children: [
                          Expanded(
                            child: _AttributeBox(
                              label: 'Penyebab',
                              value: result.disease.cause,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _AttributeBox(
                              label: 'Resiko',
                              value: result.disease.riskLevel,
                              valueColor: result.disease.riskLevel == 'Tinggi'
                                  ? Colors.red
                                  : (result.disease.riskLevel == 'Sedang'
                                      ? Colors.orange
                                      : Colors.green),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Solution Section
                if (result.disease.id != 'healthy') ...[
                  const Text(
                    'Solusi & Pengobatan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.medical_services,
                                color: AppTheme.primary),
                            SizedBox(width: 12),
                            Text('Langkah Penanganan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(result.disease.solution,
                            style: const TextStyle(height: 1.6)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Prevention Section
                  const Text(
                    'Pencegahan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.shield, color: Colors.blue),
                            SizedBox(width: 12),
                            Text('Tips Pencegahan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(result.disease.prevention,
                            style: const TextStyle(height: 1.6)),
                      ],
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.green),
                        SizedBox(width: 16),
                        Expanded(
                            child: Text(
                                'Tanaman Anda terlihat sehat! Lanjutkan perawatan rutin untuk menjaga kondisinya.',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 32),

                // Actions
                ElevatedButton.icon(
                  onPressed: () {
                    // Normally would go to a detailed treatment guide or product list
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: AppTheme.backgroundDark,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.share),
                  label: const Text('Bagikan Laporan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    context.read<DiagnosisState>().clearSymptoms();
                    context.go('/home');
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    side: BorderSide(color: Theme.of(context).dividerColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    foregroundColor:
                        Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Beranda',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AttributeBox extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final Color color;

  const _AttributeBox({
    required this.label,
    required this.value,
    this.valueColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: valueColor),
          ),
        ],
      ),
    );
  }
}
