import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final List<Map<String, dynamic>> skills = const [
    {'nama': 'Video Editing', 'icon': Icons.video_camera_back},
    {'nama': 'Graphic Design', 'icon': Icons.design_services},
    {'nama': 'Software Development', 'icon': Icons.code},
    {'nama': 'Content Creation', 'icon': Icons.camera_alt},
  ];

  final List<Map<String, String>> pendidikan = const [
    {
      'jenjang': 'Perguruan Tinggi',
      'institusi': 'Global Institute',
      'jurusan': 'Teknik Informatika',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    child: Icon(Icons.person, size: 60),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Muhammad Raihan Chandra Pratama',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Mahasiswa Teknik Informatika'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Skills & Hobbies',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            ...skills.map(
              (skill) => Card(
                child: ListTile(
                  leading: Icon(skill['icon'] as IconData),
                  title: Text(skill['nama'] as String),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Riwayat Pendidikan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            ...pendidikan.map(
              (item) => Card(
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: Text(item['institusi']!),
                  subtitle: Text('${item['jenjang']} - ${item['jurusan']}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
