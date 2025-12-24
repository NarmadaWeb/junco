import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/data/data.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/bottom_nav.dart';
import 'package:junco_app/widgets/mobile_container.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String _searchQuery = '';
  String _filter = 'Semua';

  @override
  Widget build(BuildContext context) {
    // Filter diseases based on search and filter chip
    // In a real app, this would be more complex
    final filteredDiseases = diseases.where((d) {
      if (d.id == 'healthy') return false; // Don't show 'Healthy' in library list generally, or maybe separate
      final matchesSearch = d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                            d.scientificName.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesSearch;
    }).toList();

    return MobileContainer(
      bottomNav: const BottomNav(currentRoute: '/library'),
      child: Column(
        children: [
          // AppBar
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
                    onPressed: () => context.go('/home'),
                    style: IconButton.styleFrom(backgroundColor: Theme.of(context).cardColor),
                  ),
                  const Expanded(
                    child: Text(
                      'Pustaka Referensi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance back button
                ],
              ),
            ),
          ),

          // Search
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Cari penyakit atau istilah...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ['Semua', 'Glosarium', 'Budidaya', 'Obat-obatan'].map((label) {
                final isSelected = _filter == label;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(label),
                    selected: isSelected,
                    onSelected: (val) => setState(() => _filter = label),
                    backgroundColor: Theme.of(context).cardColor,
                    selectedColor: AppTheme.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? AppTheme.backgroundDark : Theme.of(context).textTheme.bodyMedium?.color,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: isSelected ? Colors.transparent : Theme.of(context).dividerColor.withOpacity(0.2)),
                    ),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daftar Penyakit',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Offline', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                ...filteredDiseases.map((disease) => _DiseaseExpansionTile(disease: disease)),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DiseaseExpansionTile extends StatelessWidget {
  final Disease disease;

  const _DiseaseExpansionTile({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(16),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.menu_book, color: AppTheme.primary, size: 20),
        ),
        title: Text(
          disease.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          disease.scientificName,
          style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              const SizedBox(height: 8),
              Text(disease.description, style: const TextStyle(fontSize: 13, height: 1.5)),
              const SizedBox(height: 16),

              _SectionTitle('Gejala Utama'),
              Wrap(
                spacing: 8,
                children: disease.symptomIds.map((sid) {
                  // Find symptom name for chip
                   final sName = symptoms.firstWhere((s) => s.id == sid, orElse: () => Symptom(id: '', title: sid, description: '', type: '', icon: '')).title;
                   return Chip(
                     label: Text(sName, style: const TextStyle(fontSize: 10)),
                     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                     padding: EdgeInsets.zero,
                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                   );
                }).toList(),
              ),

              const SizedBox(height: 16),
              _SectionTitle('Pengendalian'),
              Text(disease.solution, style: const TextStyle(fontSize: 13, height: 1.5)),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
