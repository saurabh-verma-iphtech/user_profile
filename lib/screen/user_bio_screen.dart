import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/provider/user_provider.dart';
import 'package:user_profile/model/user.dart';

class UserBio extends ConsumerWidget {
  const UserBio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUser = ref.read(userProvider.notifier).selectedUser;
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    if (selectedUser == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: primaryColor),
              const SizedBox(height: 20),
              Text(
                'No User Selected',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Return to select a user profile',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About ${selectedUser.name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bio Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.article_outlined,
                          color: primaryColor,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Detailed Bio",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      selectedUser.bio,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Personal Details Section
            Text(
              "Personal Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDetailRow(
                      icon: Icons.person_outline,
                      label: "Name",
                      value: selectedUser.name,
                      color: primaryColor,
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      icon: Icons.work_outline,
                      label: "Job Profile",
                      value: selectedUser.jobProfile,
                      color: primaryColor,
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      icon: Icons.cake_outlined,
                      label: "Age",
                      value: "${selectedUser.age} years",
                      color: primaryColor,
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      icon: Icons.email_outlined,
                      label: "Email",
                      value: selectedUser.email,
                      color: primaryColor,
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      icon: Icons.phone_outlined,
                      label: "Phone",
                      value: selectedUser.phoneNo.toString(),
                      color: primaryColor,
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      icon: Icons.location_on_outlined,
                      label: "Address",
                      value: selectedUser.address,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
