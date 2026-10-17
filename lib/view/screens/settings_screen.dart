import 'package:expense_tracker/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? titleColor,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: titleColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          : null,
      trailing:
          trailing ??
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2196F3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'user@email.com',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          _sectionHeader('GENERAL'),

          _settingsTile(
            icon: Icons.attach_money,
            iconColor: const Color(0xFF4CAF50),
            title: 'Currency',
            subtitle: '৳ BDT',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.dark_mode,
            iconColor: const Color(0xFF9C27B0),
            title: 'Dark Mode',
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme(value);
              },
            ),
          ),

          _settingsTile(
            icon: Icons.notifications,
            iconColor: const Color(0xFFFF9800),
            title: 'Notifications',
            trailing: Switch(value: true, onChanged: (value) {}),
          ),

          _sectionHeader('DATA'),

          _settingsTile(
            icon: Icons.upload_file,
            iconColor: const Color(0xFF2196F3),
            title: 'Export Data',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.download,
            iconColor: const Color(0xFF2196F3),
            title: 'Import Data',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.delete_outline,
            iconColor: const Color(0xFFEF5350),
            title: 'Clear All Data',
            titleColor: const Color(0xFFEF5350),
            onTap: () {},
          ),

          _sectionHeader('ABOUT'),

          _settingsTile(
            icon: Icons.info_outline,
            iconColor: const Color(0xFF607D8B),
            title: 'About App',
            subtitle: 'v1.0.0',
            trailing: const SizedBox.shrink(),
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.star_outline,
            iconColor: const Color(0xFFFFC107),
            title: 'Rate Us',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.email_outlined,
            iconColor: const Color(0xFF2196F3),
            title: 'Contact',
            onTap: () {},
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
