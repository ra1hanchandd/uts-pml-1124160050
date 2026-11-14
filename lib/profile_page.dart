import 'package:flutter/material.dart';
import 'info_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Muhammad Raihan Chandra Pratama',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'NIM: 1124160050',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Program Studi Teknik Informatika',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Contact Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          InfoTile(
                            icon: Icons.email,
                            label: 'Email',
                            value: 'raihanchandra413@gmail.com',
                          ),

                          InfoTile(
                            icon: Icons.phone,
                            label: 'Phone',
                            value: '08891303072',
                          ),

                          InfoTile(
                            icon: Icons.school,
                            label: 'Class',
                            value: 'TI SE-2 P',
                          ),

                          InfoTile(
                            icon: Icons.code,
                            label: 'GitHub',
                            value: 'github.com/ra1hanchandd',
                          ),
                        ],
                      ),
                    ),
                  ),

const SizedBox(height: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Skills & Hobbies',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          InfoTile(
                            icon: Icons.code,
                            label: 'Skill',
                            value: 'Software Development',
                          ),

                          InfoTile(
                            icon: Icons.design_services,
                            label: 'Skill',
                            value: 'UI/UX Design',
                          ),

                          InfoTile(
                            icon: Icons.sports,
                            label: 'Hobby',
                            value: 'Playing Music',
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Halo! Terima kasih sudah mengunjungi profil saya.',
              ),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}
