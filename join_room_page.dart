import 'package:flutter/material.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({Key? key}) : super(key: key);

  @override
  _JoinRoomPageState createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  final TextEditingController _roomCodeController = TextEditingController();
  String? errorMessage;

  void _submitCode() {
    String code = _roomCodeController.text.trim();
    if (code.isEmpty) {
      setState(() {
        errorMessage = "Room code cannot be empty";
      });
      return;
    }
    Navigator.pop(context, code); // Send the joined room name back
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Join a Room")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _roomCodeController,
              decoration: InputDecoration(
                labelText: "Enter Room Code",
                errorText: errorMessage,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitCode,
              child: const Text("Join Room"),
            ),
          ],
        ),
      ),
    );
  }
}


