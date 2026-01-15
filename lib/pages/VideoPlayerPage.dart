// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoPlayerPage extends StatefulWidget {
//   final String videoUrl;

//   const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           DraggableScrollableSheet(
//             initialChildSize: 1.0,
//             minChildSize: 0.3,
//             maxChildSize: 1.0,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Container(
//                 color: Colors.black.withOpacity(0.7),
//                 child: YoutubePlayerBuilder(
//                   player: YoutubePlayer(
//                     controller: _controller,
//                     showVideoProgressIndicator: true,
//                     progressIndicatorColor: Colors.red,
//                   ),
//                   builder: (context, player) {
//                     return SingleChildScrollView(
//                       controller: scrollController,
//                       child: Column(
//                         children: [
//                           player,
//                           const SizedBox(height: 20),
//                           // Add any additional content below the player here
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
