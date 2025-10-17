import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'parent_screen.dart';
import 'child_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '', password = '';
  bool isParent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(isParent ? "Login as Parent" : "Login as Child"),
              value: isParent,
              onChanged: (val) => setState(() => isParent = val),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (val) => email = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (val) => password = val,
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                UserCredential user = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(email: email, password: password);
                if (isParent)
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ParentScreen()));
                else
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChildScreen()));
              },
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () async {
                UserCredential user = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(email: email, password: password);
                // Optionally register extra details here
              },
            ),
          ],
        ),
      ),
    );
  }
}
