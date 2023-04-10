import 'package:flutter/material.dart';

import '../Models/chat_users.dart';
import '../chat_detail.dart';

class OnlineUser extends StatefulWidget {
  final ChatUsers chatUser;
  const OnlineUser({super.key, required this.chatUser});

  @override
  State<OnlineUser> createState() => _OnlineUserState();
}

class _OnlineUserState extends State<OnlineUser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetail(chatUser: widget.chatUser);
        }));
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Stack(children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 208, 206, 206)),
                  image: DecorationImage(
                    image: AssetImage(widget.chatUser.imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 9.5,
                  left: 46,
                  child: Container(
                    width: 19,
                    height: 19,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.white)),
                  ))
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 60,
            child: Text(
              widget.chatUser.name,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 10, color:  Color.fromRGBO(70, 70, 70, 1), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
