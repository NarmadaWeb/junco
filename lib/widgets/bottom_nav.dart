import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/theme.dart';

class BottomNav extends StatelessWidget {
  final String currentRoute;

  const BottomNav({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(0.05)
                : Colors.grey.shade200,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Beranda',
            isActive: currentRoute == '/home',
            onTap: () => context.go('/home'),
          ),
          _NavItem(
            icon: Icons.center_focus_weak,
            activeIcon: Icons.center_focus_strong,
            label: 'Analisa',
            isActive: currentRoute.startsWith('/diagnosis'),
            onTap: () => context.go('/diagnosis-start'),
          ),
          _NavItem(
            icon: Icons.library_books_outlined,
            activeIcon: Icons.library_books,
            label: 'Pustaka',
            isActive: currentRoute == '/library',
            onTap: () => context.go('/library'),
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: 'Pengaturan',
            isActive: currentRoute == '/settings',
            onTap: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? AppTheme.primary
        : (Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade400
            : Colors.grey.shade400);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isActive ? activeIcon : icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
