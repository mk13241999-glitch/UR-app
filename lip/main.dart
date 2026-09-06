import 'package:flutter/material.dart';

void main() {
  runApp(const UrApp());
}

class UrApp extends StatelessWidget {
  const UrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ur Distribution',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نظام أور للتوزيع - UR System'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildRoleCard(context, 'المدير / المحاسب', Icons.admin_panel_settings, Colors.blue),
            _buildRoleCard(context, 'المندوب', Icons.person_pin_circle, Colors.green),
            _buildRoleCard(context, 'المجهز', Icons.inventory, Colors.orange),
            _buildRoleCard(context, 'الناقل', Icons.local_shipping, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم اختيار لوحة: $title')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
