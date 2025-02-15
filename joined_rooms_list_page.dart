import 'package:flutter/material.dart';
import 'join_room_page.dart';
import 'room_page.dart';

class JoinedRoomsListPage extends StatefulWidget {
  final List<String> joinedRooms;

  const JoinedRoomsListPage({Key? key, required this.joinedRooms}) : super(key: key);

  @override
  _JoinedRoomsListPageState createState() => _JoinedRoomsListPageState();
}

class _JoinedRoomsListPageState extends State<JoinedRoomsListPage> {
  late List<String> joinedRooms;

  @override
  void initState() {
    super.initState();
    joinedRooms = List.from(widget.joinedRooms);
  }

  void _joinNewRoom() async {
    final newRoom = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JoinRoomPage()),
    );

    if (newRoom != null && newRoom is String) {
      setState(() {
        joinedRooms.add(newRoom);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, joinedRooms); // Pass updated list back
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Joined Rooms")),
        body: joinedRooms.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No rooms joined yet"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _joinNewRoom,
                      child: const Text("Join New Room"),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: joinedRooms.length + 1,
                itemBuilder: (context, index) {
                  if (index == joinedRooms.length) {
                    return ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text("Join New Room"),
                      onTap: _joinNewRoom,
                    );
                  }
                  return ListTile(
                    title: Text(joinedRooms[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoomPage(roomName: joinedRooms[index]),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}




