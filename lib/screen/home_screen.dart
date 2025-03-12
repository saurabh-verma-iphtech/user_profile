import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/provider/user_provider.dart';
import 'package:user_profile/screen/add_user.dart';
import 'package:user_profile/screen/login_screen.dart';
import 'package:user_profile/screen/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          // If want to add Icon Button instead of Text Button
          // IconButton(
          //   icon: Icon(
          //     Icons.logout,
          //     color: const Color.fromARGB(255, 35, 8, 8),
          //   ),
          //   onPressed: () async {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => LoginScreen()),
          //     );
          //   },
          // ),

          // Added Button for Logout
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(221, 127, 171, 248),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            ),
            child: Text('Logout', style: TextStyle(color: Colors.black)),
          ),
        ],
        // ################################

        // #  Added My App Bar Title Here  #
        title: Text(
          'User Profiles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        backgroundColor: const Color.fromARGB(221, 127, 171, 248),
      ),

      // backgroundColor: Color.fromARGB(255, 221, 223, 223),
      body: Flexible(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user =
                users[index]; // user => through which i access the profilePic
            return Container(
              height: 80,
              color:
                  index.isEven
                      ? Colors.blue.shade100
                      : Colors.green.shade100, // Alternate colors
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.profilePic),
                ),

                title: Text(
                  user.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_circle_sharp,
                    color: Color.fromARGB(235, 236, 117, 109),
                  ),
                  onPressed: () => userNotifier.deleteUser(user.id),
                ),

                onTap: () {
                  userNotifier.selectUser(user);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddUser()),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
