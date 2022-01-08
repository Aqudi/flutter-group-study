import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double? size;

  const ProfileAvatar({Key? key, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(Icons.person, size: size),
      radius: size,
    );
  }
}
