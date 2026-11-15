import 'package:flutter/material.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _programStudiController;
  late TextEditingController _kelasController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _teleponController;

  @override
  void initState() {
    super.initState();

    _namaController = TextEditingController(text: widget.profile.nama);
    _nimController = TextEditingController(text: widget.profile.nim);
    _programStudiController = TextEditingController(
      text: widget.profile.programStudi,
    );
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _bioController = TextEditingController(text: widget.profile.bio);
    _emailController = TextEditingController(text: widget.profile.email);
    _teleponController = TextEditingController(text: widget.profile.telepon);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _programStudiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _teleponController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final updatedProfile = Profile(
        nama: _namaController.text,
        nim: _nimController.text,
        programStudi: _programStudiController.text,
        kelas: _kelasController.text,
        bio: _bioController.text,
        email: _emailController.text,
        telepon: _teleponController.text,
        foto: widget.profile.foto,
      );

      Navigator.pop(context, updatedProfile);
    }
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(
                label: 'Nama Lengkap',
                controller: _namaController,
                icon: Icons.person,
              ),
              _buildField(
                label: 'NIM',
                controller: _nimController,
                icon: Icons.badge,
              ),
              _buildField(
                label: 'Program Studi',
                controller: _programStudiController,
                icon: Icons.school,
              ),
              _buildField(
                label: 'Kelas',
                controller: _kelasController,
                icon: Icons.class_,
              ),
              _buildField(
                label: 'Bio',
                controller: _bioController,
                icon: Icons.info,
                maxLines: 3,
              ),
              _buildField(
                label: 'Email',
                controller: _emailController,
                icon: Icons.email,
              ),
              _buildField(
                label: 'Nomor Telepon',
                controller: _teleponController,
                icon: Icons.phone,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Perubahan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
