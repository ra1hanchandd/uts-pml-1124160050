import 'package:flutter/material.dart';

import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 60, child: Icon(Icons.person, size: 65)),

            const SizedBox(height: 16),

            Text(
              profile.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(profile.programStudi, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 24),

            _buildInfoTile(Icons.badge, 'NIM', profile.nim),

            _buildInfoTile(Icons.school, 'Program Studi', profile.programStudi),

            _buildInfoTile(Icons.class_, 'Kelas', profile.kelas),

            _buildInfoTile(Icons.email, 'Email', profile.email),

            _buildInfoTile(Icons.phone, 'Telepon', profile.telepon),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tentang Saya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(profile.bio),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
