import 'package:flutter/material.dart';
import 'package:newtalk/pages/chatting/chatting_room_page.dart';
import 'package:newtalk/pages/friend/widgets/profile_avatar.dart';

class ProfileDetail extends StatelessWidget {
  final String? name;

  const ProfileDetail({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const ProfileAvatar(size: size),
                    const SizedBox(height: 3),
                    Text(
                      '$name',
                      style: nameStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Divider(
                color: textColor.withOpacity(0.5),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChattingRoomPage(name: name),
                      ));
                },
                icon: const Icon(
                  Icons.chat,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
