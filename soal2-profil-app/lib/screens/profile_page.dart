import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final VoidCallback onToggleTheme;
  
  const ProfilePage({
    super.key,
    required this.profile,
    required this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile currentProfile;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    currentProfile = widget.profile;
  }

  Future<void> _editProfile() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: currentProfile),
      ),
    );

    if (!mounted) return;

    if (updatedProfile != null) {
      setState(() {
        currentProfile = updatedProfile;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui!')),
      );
    }
  }

  // Menampilkan halaman berdasarkan menu yang dipilih
  Widget _buildPage() {
    if (_selectedIndex == 0) {
      return _buildProfileContent();
    } else {
      return const AboutPage();
    }
  }

  // Tampilan halaman profil
  Widget _buildProfileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(radius: 60, child: Icon(Icons.person, size: 65)),

          const SizedBox(height: 16),

          Text(
            currentProfile.nama,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            currentProfile.programStudi,
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          _buildInfoTile(Icons.badge, 'NIM', currentProfile.nim),

          _buildInfoTile(
            Icons.school,
            'Program Studi',
            currentProfile.programStudi,
          ),

          _buildInfoTile(Icons.class_, 'Kelas', currentProfile.kelas),

          _buildInfoTile(Icons.email, 'Email', currentProfile.email),

          _buildInfoTile(Icons.phone, 'Telepon', currentProfile.telepon),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Saya',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(currentProfile.bio),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _editProfile,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Profil Mahasiswa' : 'About Me'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme, 
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Ganti Tema'),
        ],
      ),

      body: _buildPage(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About Me'),
        ],
      ),
    );
  }
}
