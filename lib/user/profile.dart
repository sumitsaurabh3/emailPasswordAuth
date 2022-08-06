import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'User ID: fdf121',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Text(
                'Email: sumit@gmail.com',
                style: TextStyle(fontSize: 18.0),
              ),
              TextButton(
                onPressed: () => {},
                child: Text('Verify Email'),
              ),
            ],
          ),
          Text(
            "Created: 10/5/2020",
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
