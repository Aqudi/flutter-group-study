import 'package:flutter/material.dart';
import 'package:newtalk/pages/friend/widgets/profile_avatar.dart';
import 'package:newtalk/pages/friend/widgets/profile_detail.dart';

class ProfileListTile extends StatelessWidget {
  final String name;

  const ProfileListTile({
    Key? key,
    required this.name,
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
      leading: const SizedBox(
        height: double.infinity,
        child: ProfileAvatar(size: size),
      ),
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return ProfileDetail(name: name);
          },
        );
      },
      title: Text(
        name,
        style: const TextStyle(
          fontSize: size,
        ),
      ),
    );
  }
}
