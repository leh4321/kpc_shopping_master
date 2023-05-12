import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screen_home.dart';
import 'screen_signup.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  static const String routeName = '/signin';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

// SigninScreen with Firebase authentication
class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin Screen'),
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
            if (_isSigningIn) const LinearProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully signed in!'),
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName,
                    (route) => false,
                  );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? 'Failed to sign in.'),
                    ),
                  );
                } finally {
                  setState(() {
                    _isSigningIn = false;
                  });
                }
              },
              child: const Text('Sign in'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignupScreen.routeName);
              },
              child: const Text('Go to Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
