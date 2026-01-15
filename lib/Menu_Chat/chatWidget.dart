// import 'package:flutter/material.dart';

// class Chatwidget extends StatefulWidget {
//   const Chatwidget({super.key});

//   @override
//   State<Chatwidget> createState() => _ChatwidgetState();
// }

// class _ChatwidgetState extends State<Chatwidget> {
//   get loginAndSaveToken => true;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Token Saver',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Token Saver')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: loginAndSaveToken,
//             child: Text('Login and Save Token'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Chatwidget extends StatefulWidget {
  final String otherUserEmail; // Email pengguna lain (admin/klien)
  final bool isAdmin; // Jika true, pengguna adalah admin

  const Chatwidget({
    Key? key,
    required this.otherUserEmail,
    required this.isAdmin,
  }) : super(key: key);

  @override
  State<Chatwidget> createState() => _ChatwidgetState();
}

class _ChatwidgetState extends State<Chatwidget> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late String _userEmail; // Email pengguna yang login
  String get _chatRoomId => widget.isAdmin
      ? "${_userEmail}_${widget.otherUserEmail}"
      : "${widget.otherUserEmail}_${_userEmail}";

  @override
  void initState() {
    super.initState();
    _loadUserEmail(); // Ambil email pengguna yang login dari Hive
  }

  Future<void> _loadUserEmail() async {
    final loginBox = Hive.box('loginBox');
    setState(() {
      _userEmail = loginBox.get('email', defaultValue: 'unknown@example.com');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdmin ? "Chat with Client" : "Chat with Admin"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .doc(_chatRoomId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message['sender'] == _userEmail;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          message['message'],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;

    final message = {
      'sender': _userEmail,
      'message': _messageController.text,
      'timestamp': FieldValue.serverTimestamp(),
    };

    _firestore
        .collection('chats')
        .doc(_chatRoomId)
        .collection('messages')
        .add(message);

    _messageController.clear();

    // Buat dokumen chat jika belum ada
    _firestore.collection('chats').doc(_chatRoomId).set({
      'admin': widget.isAdmin ? _userEmail : widget.otherUserEmail,
      'client': widget.isAdmin ? widget.otherUserEmail : _userEmail,
    }, SetOptions(merge: true));
  }
}
