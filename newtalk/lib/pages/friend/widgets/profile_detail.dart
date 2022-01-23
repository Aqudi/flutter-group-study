import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/pages/chatting/chatting_room_page.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/widgets/profile_avatar.dart';
import 'package:newtalk/services/chatting_room_service.dart';

class ProfileDetail extends HookConsumerWidget {
  final AppUser user;

  const ProfileDetail({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    final chattingRoomService = ref.read(chattingRoomServiceProvider);

    const size = 40.0;
    const textColor = Colors.white;
    const nameStyle = TextStyle(
      fontSize: 20.0,
      color: textColor,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.srcOver,
              ),
              fit: BoxFit.cover,
              image: const NetworkImage(
                "https://images.unsplash.com/photo-1641113994135-a9f230b1f9b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: textColor,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProfileAvatar(size: size, user: user),
                    const SizedBox(height: 3),
                    Text(
                      user.name,
                      style: nameStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Divider(
                color: textColor.withOpacity(0.5),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (authService.user.uid != user.uid)
                    TextButton(
                      onPressed: () async {
                        await chattingRoomService.createRoom(
                            roomName: user.name, userIds: [user.uid]);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChattingRoomPage(name: user.name),
                            ));
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.chat,
                            color: textColor,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '채팅',
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ),
                  if (authService.user.uid == user.uid)
                    TextButton(
                      onPressed: () async {},
                      child: Column(
                        children: const [
                          Icon(
                            Icons.edit,
                            color: textColor,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '프로필 편집',
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
