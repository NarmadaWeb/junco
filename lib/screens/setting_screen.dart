import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/main.dart'; // Import ThemeState
import 'package:junco_app/theme.dart';
import 'package:junco_app/widgets/bottom_nav.dart';
import 'package:junco_app/widgets/mobile_container.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileContainer(
      bottomNav: const BottomNav(currentRoute: '/settings'),
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
                    onPressed: () => context.go('/home'),
                    style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Pengaturan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                _SettingsSection(
                  title: 'Manajemen Data',
                  children: [
                    _SettingsTile(
                      icon: Icons.data_object_sharp,
                      title: 'Kelola Database Offline',
                      subtitle: 'Update data penyakit & hama',
                      onTap: () {},
                    ),
                    _SettingsTile(
                      icon: Icons.delete_outline,
                      iconColor: Colors.red,
                      title: 'Hapus Semua Riwayat',
                      textColor: Colors.red,
                      onTap: () {},
                    ),
                  ],
                ),
                _SettingsSection(
                  title: 'Tampilan',
                  children: [
                    _SettingsTile(
                      icon: Icons.dark_mode,
                      title: 'Mode Gelap',
                      trailing: Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (val) {
                          context.read<ThemeState>().toggleTheme(val);
                        },
                        activeColor: AppTheme.primary,
                      ),
                      onTap: () {
                        context.read<ThemeState>().toggleTheme(
                            Theme.of(context).brightness != Brightness.dark);
                      },
                    ),
                  ],
                ),
                _SettingsSection(
                  title: 'Tentang Aplikasi',
                  children: [
                    _SettingsTile(
                      icon: Icons.info_outline,
                      title: 'Tentang JunCo',
                      onTap: () => context.push('/about'),
                    ),
                    _SettingsTile(
                      icon: Icons.policy,
                      title: 'Kebijakan Privasi',
                      onTap: () => context.push('/privacy'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppTheme.primary, Color(0xFF1e8a4a)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.forest, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'JunCo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Versi 1.0.0 (Build 24) - Offline Mode',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '© 2025 JunCo Cocoa Analytics',
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(0.1)),
          ),
          child: Column(
            children: children,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.iconColor,
    this.textColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iColor = iconColor ??
        (theme.brightness == Brightness.dark
            ? AppTheme.primary
            : AppTheme.primary); // Default primary

    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: textColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!,
              style: const TextStyle(fontSize: 12, color: Colors.grey))
          : null,
      trailing: trailing ??
          const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
