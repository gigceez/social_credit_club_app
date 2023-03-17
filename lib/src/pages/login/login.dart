import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:social_credit_club_app/main.dart';
import 'package:social_credit_club_app/src/pages/guestlist/guestlist.dart';
import 'package:social_credit_club_app/src/services/apihandler.dart';

const loginOptions = LoginOptions(
    emailDecoration: InputDecoration(
      prefixIcon: Icon(Icons.email),
      border: OutlineInputBorder(),
    ),
    passwordDecoration: InputDecoration(
      prefixIcon: Icon(Icons.password),
      border: OutlineInputBorder(),
    ),
    initialEmail: 'club@prodev.nl',
    initialPassword: 'test123',
    title: Text('Login'),
    image: FlutterLogo());

class LoginExample extends StatelessWidget {
  const LoginExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailPasswordLoginForm(
        options: loginOptions,
        onLogin: (email, password) async {
          var a = await login(email, password);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Guestlist(),
            ),
          );
        },
        onRegister: (email, password) => print('Register!'),
        onForgotPassword: (email) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const ForgotPasswordScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ForgotPasswordForm(
        options: loginOptions,
        title: const Text('Forgot password'),
        description: const Text('Hello world'),
        onRequestForgotPassword: (email) {
          print('Forgot password email sent to $email');
        },
      ),
    );
  }
}
