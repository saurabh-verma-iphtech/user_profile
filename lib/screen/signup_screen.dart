import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/screen/login_screen.dart';

// Auth state notifier to handle signup logic
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  // Created object of TextEditingController() for Email..
  final TextEditingController _emailController = TextEditingController();
  // Created object of TextEditingController() for Password..
  final TextEditingController _passwordController = TextEditingController();

  // SignUp method
  void _signUp() async {

    // Stroing Email and Password in Variable for further operations
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(authProvider.notifier).signUp(email, password);

    final authState = ref.read(authProvider);

    if (authState.user != null) {
      // Show success message after account creation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account created successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(
        context,
        "/login",
      ); // Navigate to Home screen after sign-up
    } else {
      // Show error message if sign-up fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authState.errorMessage ?? "Sign-up failed."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: authState.isLoading ? null : _signUp,
              child:
                  authState.isLoading
                      ? CircularProgressIndicator()
                      : Text("Sign Up"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/login"),
              child: Text("Already have an account? Login"),
            ),
            if (authState.errorMessage != null)
              Text(
                authState.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
