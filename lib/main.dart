import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                  if (newUser != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the home screen'),
      ),
    );
  }
}
