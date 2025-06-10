# 👤 Flutter User Profile App — Manage & Showcase User Data 🛠️

User Profile App is a Flutter project leveraging Riverpod and Firebase to allow users to sign up, log in, add profiles with images, and view detailed user bios.

# 🌟 Project Highlights

# 🔑 Authentication

◉ Login & Sign Up Screens with form validation.

◉ Firebase Auth for email/password authentication.

◉ Secure session flow: redirect to HomeScreen on success.

# 👥 User Management

◉ Add User Screen: create new user profiles with name, email, and profile picture.

◉ Home Screen: list all users fetched via UserProvider.

◉ Tappable list items to view detailed profiles.

◉ Alternate row colors for clarity.

◉ Logout button navigates back to Login.

◉ Profile Screen: display selected user’s details and image.

◉ User Bio Screen: edit and persist user biography.

# 🖼️ Image Handling

◉ Upload and display profile pictures via network URL in CircleAvatar.

# 🔄 State Management with Riverpod

◉ userProvider (StateNotifierProvider): stores list of users, selected user, and CRUD operations.

◉ ImagePickerProvider: manages image picking state.

◉ Widgets rebuild automatically when state changes.

# 🚀 Services & Configuration

◉ AuthService: wraps Firebase Auth calls for sign-in, sign-up, and sign-out.

◉ firebase_options.dart: generated Firebase initialization settings.

# 🧰 Tech Stack

    Category                          Tools & Libraries

    Framework                          Flutter, Dart

    State Management                   Riverpod (flutter_riverpod)

    Authentication                     Firebase Auth

    Image Picker                       image_picker

    Dependency Injection               Riverpod providers

    Networking & Config                firebase_core, firebase_options

    UI Components                      Material Widgets (ListView, Forms, AppBar)


# 🎞️ GIF:

![Workflow GIF](https://i.imgflip.com/9wsvwv.gif)

![Workflow GIF](https://i.imgflip.com/9wswcv.gif)
