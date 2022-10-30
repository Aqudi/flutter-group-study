import 'package:flutter/material.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/widgets/profile_avatar.dart';
import 'package:newtalk/pages/friend/widgets/profile_detail.dart';

class ProfileListTile extends StatelessWidget {
  final AppUser user;

  const ProfileListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 20.0;

    return ListTile(
      contentPadding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15,
      ),
      horizontalTitleGap: 20,
      leading: SizedBox(
        height: double.infinity,
        child: ProfileAvatar(size: size, user: user),
      ),
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return ProfileDetail(user: user);
          },
        );
      },
      title: Text(
        user.name,
        style: const TextStyle(
          fontSize: size,
        ),
      ),
    );
  }
}
