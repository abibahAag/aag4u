// import 'package:flutter/material.dart';
// import 'package:pusher_client/pusher_client.dart';

// class PusherExample extends StatefulWidget {
//   @override
//   _PusherExampleState createState() => _PusherExampleState();
// }

// class _PusherExampleState extends State<PusherExample> {
//   late PusherClient pusher;
//   late Channel channel;
//   String message = "Waiting for event...";

//   @override
//   void initState() {
//     super.initState();

//     // Pusher initialization
//     pusher = PusherClient(
//       'c2678762ca2958a88888',
//       PusherOptions(
//         cluster: 'ap1',
//       ),
//       enableLogging: true, // Enable logging for debugging
//     );

//     // Subscribe to a channel
//     channel = pusher.subscribe('my-channel');

//     // Bind to an event
//     channel.bind('my-event', (PusherEvent? event) {
//       if (event != null) {
//         // Parse the received event data
//         final eventData = event.data;
//         print('Event received: $eventData');
//         setState(() {
//           message = eventData!;
//         });
//       }
//     });

//     // Connect to Pusher
//     pusher.connect();
//   }

//   @override
//   void dispose() {
//     // Unsubscribe and disconnect from Pusher when the widget is disposed
//     pusher.unsubscribe('my-channel');
//     pusher.disconnect();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pusher Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Pusher Event Data:',
//             ),
//             SizedBox(height: 20),
//             Text(
//               message,
//               style: Theme.of(context).textTheme.headline5,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// extension on TextTheme {
//   get headline5 => null;
// }
