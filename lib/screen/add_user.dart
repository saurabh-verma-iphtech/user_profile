import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_profile/model/user.dart';
import 'package:user_profile/provider/image_picker_provider.dart';
import 'package:user_profile/provider/user_provider.dart';

class AddUser extends ConsumerStatefulWidget {
  const AddUser({super.key});

  @override
  ConsumerState<AddUser> createState() => _AddUserState();
}

class _AddUserState extends ConsumerState<AddUser> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController bioController;
  late TextEditingController profilePicController;
  late TextEditingController jobProfileController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    bioController = TextEditingController();
    profilePicController = TextEditingController();
    jobProfileController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    bioController.dispose();
    profilePicController.dispose();
    jobProfileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.read(userProvider.notifier);
    final String? imagePath = ref.watch(imagePickerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New User',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: theme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Picture Section
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              imagePath != null
                                  ? FileImage(File(imagePath))
                                  : (profilePicController.text.isNotEmpty
                                          ? NetworkImage(
                                            profilePicController.text,
                                          )
                                          : null)
                                      as ImageProvider<Object>?,
                          child:
                              imagePath == null &&
                                      profilePicController.text.isEmpty
                                  ? const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.grey,
                                  )
                                  : null,
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: theme.primaryColor,
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: IconButton(
                        //       icon: const Icon(
                        //         Icons.camera_alt,
                        //         color: Colors.white,
                        //       ),
                        //       onPressed:
                        //           () =>
                        //               ref
                        //                   .read(imagePickerProvider.notifier)
                        //                   .pickImage(),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // const SizedBox(height: 8),
                    // TextButton(
                    //   onPressed: () {
                    //     // clear provider state and text field
                    //     ref.read(imagePickerProvider.notifier).state = null;
                    //     profilePicController.clear();
                    //     setState(() {});
                    //   },
                    //   child: const Text(
                    //     'Clear Image',
                    //     style: TextStyle(color: Colors.grey),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Name Field
              _buildTextField(
                controller: nameController,
                label: 'Full Name',
                icon: Icons.person,
                validator:
                    (value) => value!.isEmpty ? 'Please enter name' : null,
              ),
              const SizedBox(height: 16),

              // Age and Email Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: ageController,
                      label: 'Age',
                      icon: Icons.cake,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter age';
                        if (int.tryParse(value) == null)
                          return 'Invalid number';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter email';
                        if (!value.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Phone and Address Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: phoneController,
                      label: 'Phone',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter phone';
                        if (int.tryParse(value) == null)
                          return 'Invalid number';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: addressController,
                      label: 'Address',
                      icon: Icons.location_on,
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Please enter address' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Job Profile
              _buildTextField(
                controller: jobProfileController,
                label: 'Job Profile',
                icon: Icons.work,
              ),
              const SizedBox(height: 16),

              // Bio
              _buildTextField(
                controller: bioController,
                label: 'Bio',
                icon: Icons.info,
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Profile URL
              _buildTextField(
                controller: profilePicController,
                label: 'Profile Picture URL (Optional)',
                icon: Icons.link,
                onChanged: (_) {
                  if (profilePicController.text.isNotEmpty) {
                    ref.read(imagePickerProvider.notifier).state = null;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newUser = User(
                      id: DateTime.now().toString(),
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      email: emailController.text,
                      phoneNo: int.parse(phoneController.text),
                      address: addressController.text,
                      profilePic: imagePath ?? profilePicController.text,
                      jobProfile: jobProfileController.text,
                      bio: bioController.text,
                    );
                    userNotifier.addUser(newUser);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'ADD USER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}
