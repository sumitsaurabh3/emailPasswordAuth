import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gmail_auth/pages/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationtime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && user!.emailVerified) {
      await user!.sendEmailVerification();
      print("Verification Email has been sent ");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Verification Email has been sent ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: 100,
          ),
          Text(
            'User ID: $uid',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 18.0),
              ),
              TextButton(
                onPressed: () => {
                  verifyEmail(),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  )
                },
                child: Text('Verify Email'),
              ),
            ],
          ),
          Text(
            "Created: $creationtime",
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
