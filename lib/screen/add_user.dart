import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:user_profile/model/user.dart';
import 'package:user_profile/provider/image_picker_provider.dart';
import 'package:user_profile/provider/user_provider.dart';

class AddUser extends ConsumerWidget {
  const AddUser({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    final imagePath = ref.watch(imagePickerProvider);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController profilePicController = TextEditingController();
    final TextEditingController jobProfileController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(221, 127, 171, 248),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age"),
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Phone"),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(labelText: "Bio"),
            ),
            TextFormField(
              controller: jobProfileController,
              decoration: InputDecoration(labelText: "Job Profile"),
            ),
            TextFormField(
              controller: profilePicController,
              decoration: InputDecoration(labelText: "Profile Picture Url"),
            ),
            // ElevatedButton(
            //   onPressed:
            //       () => ref.read(imagePickerProvider.notifier).pickImage(),
            //   child: Text('Pick Image from the Gallary'),
            // ),
            if (imagePath != null)
              Padding(
                padding: EdgeInsets.only(top: 20),
                // child: Image.file((File(imagePath)),height: 100,),),
                child: Text("Image Picked"),
              ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newUser = User(
                  id: DateTime.now().toString(),
                  name: nameController.text,
                  age: int.tryParse(ageController.text)!,
                  email: emailController.text,
                  phoneNo: int.tryParse(phoneController.text)!,
                  address: addressController.text,
                  profilePic: imagePath ?? profilePicController.text,

                  jobProfile: jobProfileController.text,
                  bio: bioController.text,
                );
                userNotifier.addUser(newUser);

                Navigator.pop(context);
              },

              //Styling a ElevatedButton....
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(221, 127, 171, 248),
                ),
              ),

              child: Text('Add User', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
