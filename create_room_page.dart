import 'package:flutter/material.dart';
import 'dart:math';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  String _generateRoomCode() {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random random = Random();
    return List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    String roomCode = _generateRoomCode();

    return Scaffold(
      appBar: AppBar(title: const Text("Create New Room")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Room Created!"),
            const SizedBox(height: 10),
            Text("Room Code: $roomCode", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, roomCode);
              },
              child: const Text("Enter Room"),
            ),
          ],
        ),
      ),
    );
  }
}
