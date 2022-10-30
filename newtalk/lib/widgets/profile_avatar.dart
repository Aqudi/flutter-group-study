import 'package:flutter/material.dart';
import 'package:newtalk/models/app_user.dart';

class ProfileAvatar extends StatelessWidget {
  final AppUser? user;
  final double? size;

  const ProfileAvatar({
    Key? key,
    this.user,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: user?.photoURL != null ? null : Icon(Icons.person, size: size),
      backgroundImage:
          user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
      radius: size,
    );
  }
}
