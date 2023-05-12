import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screen_signin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

// SignupScreen with Firebase authentication
class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            if (_isSigningUp) const LinearProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isSigningUp = true;
                });
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully signed up!'),
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    SigninScreen.routeName,
                    (route) => false,
                  );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? 'An error occurred!'),
                    ),
                  );
                } finally {
                  setState(() {
                    _isSigningUp = false;
                  });
                }
              },
              child: const Text('Signup'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SigninScreen.routeName,
                  (route) => false,
                );
              },
              child: const Text('Already have an account? Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
