import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/data/data.dart';
import 'package:junco_app/main.dart';
import 'package:junco_app/models/models.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/mobile_container.dart';
import 'package:provider/provider.dart';

class SymptomScreen extends StatelessWidget {
  final String type; // 'leaf', 'fruit', 'stem'
  final String nextRoute;

  const SymptomScreen({super.key, required this.type, required this.nextRoute});

  String get _title {
    switch (type) {
      case 'leaf':
        return 'Input Gejala Daun';
      case 'fruit':
        return 'Input Gejala Buah';
      case 'stem':
        return 'Input Gejala Batang';
      default:
        return 'Input Gejala';
    }
  }

  IconData get _icon {
    switch (type) {
      case 'leaf':
        return Icons.spa;
      case 'fruit':
        return Icons.local_dining; // or local_florist
      case 'stem':
        return Icons.forest;
      default:
        return Icons.eco;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter symptoms by type
    final typeSymptoms = symptoms.where((s) => s.type == type).toList();

    return MobileContainer(
      child: Stack(
        children: [
          // Background Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_cocoa.jpg'), // Reuse background
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
                      Colors.black.withOpacity(0.4),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wifi_off, size: 14, color: AppTheme.primary),
                            SizedBox(width: 6),
                            Text('MODE OFFLINE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Identifikasi Visual ${type[0].toUpperCase()}${type.substring(1)}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.help_outline, size: 24),
                       style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            top: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                   // Info Card
                   Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                         Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.checklist, color: AppTheme.primary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pilih Gejala yang Terlihat',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Pilih satu atau lebih gejala yang Anda temukan. Data ini digunakan untuk analisis AI.',
                                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                   ),
                   const SizedBox(height: 16),

                   // List
                   Expanded(
                     child: Consumer<DiagnosisState>(
                       builder: (context, state, child) {
                         return ListView.separated(
                           padding: const EdgeInsets.only(bottom: 100),
                           itemCount: typeSymptoms.length,
                           separatorBuilder: (_, __) => const SizedBox(height: 12),
                           itemBuilder: (context, index) {
                             final symptom = typeSymptoms[index];
                             final isSelected = state.isSelected(symptom.id);

                             return GestureDetector(
                               onTap: () {
                                 if (isSelected) {
                                   state.removeSymptom(symptom.id);
                                 } else {
                                   state.addSymptom(symptom.id);
                                 }
                               },
                               child: AnimatedContainer(
                                 duration: const Duration(milliseconds: 200),
                                 padding: const EdgeInsets.all(16),
                                 decoration: BoxDecoration(
                                   color: isSelected ? AppTheme.primary.withOpacity(0.05) : Theme.of(context).cardColor,
                                   borderRadius: BorderRadius.circular(16),
                                   border: Border.all(
                                     color: isSelected ? AppTheme.primary : Colors.transparent,
                                     width: 2,
                                   ),
                                   boxShadow: [
                                     if (!isSelected)
                                       BoxShadow(
                                          color: Colors.black.withOpacity(0.02),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                       ),
                                   ],
                                 ),
                                 child: Row(
                                   children: [
                                     Container(
                                       width: 48,
                                       height: 48,
                                       decoration: BoxDecoration(
                                         color: isSelected ? AppTheme.primary.withOpacity(0.2) : Theme.of(context).dividerColor.withOpacity(0.1),
                                         shape: BoxShape.circle,
                                       ),
                                       child: Icon(_getIconData(symptom.icon), color: isSelected ? AppTheme.primary : Colors.grey),
                                     ),
                                     const SizedBox(width: 16),
                                     Expanded(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             symptom.title,
                                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                           ),
                                           const SizedBox(height: 2),
                                            Text(
                                             symptom.description,
                                             style: const TextStyle(fontSize: 12, color: Colors.grey),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Checkbox(
                                       value: isSelected,
                                       onChanged: (val) {
                                         if (val == true) {
                                           state.addSymptom(symptom.id);
                                         } else {
                                           state.removeSymptom(symptom.id);
                                         }
                                       },
                                       activeColor: AppTheme.primary,
                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                     ),
                                   ],
                                 ),
                               ),
                             );
                           },
                         );
                       },
                     ),
                   ),
                ],
              ),
            ),
          ),

          // Bottom Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () => context.push(nextRoute),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: AppTheme.backgroundDark,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  shadowColor: AppTheme.primary.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nextRoute.contains('result') ? 'Lihat Hasil' : 'Selanjutnya',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to map string icon names to IconData
  IconData _getIconData(String name) {
    switch (name) {
      case 'format_color_reset': return Icons.format_color_reset;
      case 'grain': return Icons.grain;
      case 'waves': return Icons.waves;
      case 'grass': return Icons.grass;
      case 'grid_goldenratio': return Icons.grid_goldenratio;
      case 'texture': return Icons.texture;
      case 'scatter_plot': return Icons.scatter_plot;
      case 'sentiment_very_dissatisfied': return Icons.sentiment_very_dissatisfied;
      case 'blur_on': return Icons.blur_on;
      case 'compress': return Icons.compress;
      case 'landscape': return Icons.landscape;
      case 'palette': return Icons.palette;
      case 'water_drop': return Icons.water_drop;
      case 'broken_image': return Icons.broken_image;
      case 'block': return Icons.block;
      case 'pest_control': return Icons.pest_control;
      case 'coronavirus': return Icons.coronavirus;
      default: return Icons.help;
    }
  }
}
