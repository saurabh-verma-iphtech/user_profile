import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/provider/user_provider.dart';

class UserBio extends ConsumerWidget {
  const UserBio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUser = ref.read(userProvider.notifier).selectedUser;

    if (selectedUser == null) {
      return Scaffold(body: Center(child: Text('No User Selected')));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedUser.name}'s Bio",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(221, 127, 171, 248),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70),

          child: Column(
            children: [
              Text(
                "Detailed Bio: \n",
                style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                selectedUser.bio,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Job Profile :  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    selectedUser.jobProfile,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.deepPurple,
                      height: 2,
                      decorationThickness: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name:   ",
                    style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(175, 0, 0, 0)),
                  ),
                  Text(
                    selectedUser.name,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Age:   ", style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(175, 0, 0, 0))),
                  Text(
                    selectedUser.age.toString(),
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email:   ",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(175, 0, 0, 0),
                    ),
                  ),
                  Text(
                    selectedUser.email,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Phone:   ",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(175, 0, 0, 0),
                    ),
                  ),
                  Text(
                    selectedUser.phoneNo.toString(),
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Address:   ",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(175, 0, 0, 0),
                    ),
                  ),
                  Text(
                    selectedUser.address,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
