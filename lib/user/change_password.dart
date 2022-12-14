import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = "";
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password hasbeen changed .Login Again !",
            style: TextStyle(fontSize: 18),
          )));
    } catch (e) {}
  }

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New Password: ',
                      hintText: 'Enter New Password',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: newPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter new Password';
                      }

                      return null;
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = newPasswordController.text;
                      });
                      changePassword();
                    }
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ));
  }
}
