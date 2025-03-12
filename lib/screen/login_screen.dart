import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart'; // Add email_validator package

// Auth state notifier to handle login logic
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(FirebaseAuth.instance);
});

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  AuthState({this.isLoading = false, this.errorMessage, this.user});

  AuthState copyWith({bool? isLoading, String? errorMessage, User? user}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthNotifier(this._firebaseAuth) : super(AuthState());

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(isLoading: false, user: userCredential.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    state = state.copyWith(user: null);
  }

  Future<void> signUp(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(isLoading: false, user: userCredential.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Login method
  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validate the email format before signing in
    if (!EmailValidator.validate(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a valid email address."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await ref.read(authProvider.notifier).signIn(email, password);

    final authState = ref.read(authProvider);

    if (authState.user != null) {
      // Navigate to Home screen on successful login
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
              onPressed: authState.isLoading ? null : _login,
              child:
                  authState.isLoading
                      ? CircularProgressIndicator()
                      : Text("Login"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/signup"),
              child: Text("Don't have an account? Sign Up"),
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
