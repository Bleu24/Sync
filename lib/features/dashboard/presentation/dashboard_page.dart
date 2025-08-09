import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/glass_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
        actions: const [SizedBox(width: 16)],
      ),
      body: AuroraBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GlassButton(onPressed: () {}, child: const Text('New Sync')),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: MediaQuery.of(context).size.width > 700 ? 4 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    _GlassTile(title: 'Sync Status'),
                    _GlassTile(title: 'Recent Activity'),
                    _GlassTile(title: 'Connections'),
                    _GlassTile(title: 'Settings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassTile extends StatelessWidget {
  final String title;
  const _GlassTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.08,
      blur: 18,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Text(
              'Content goes here',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
