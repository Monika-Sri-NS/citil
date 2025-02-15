import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  final String roomName;

  const RoomPage({Key? key, required this.roomName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Room: $roomName")),
      body: Center(
        child: Text("Welcome to $roomName"),
      ),
    );
  }
}


