import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Import your Avatar model
class Avatar {
  Key? key;
  final int id;
  final String avatar;

  Avatar({
    // super.key,
    required this.id,
    required this.avatar,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(id: json['id'], avatar: json['avatar']);
  }
}

class VideoPost {
  final int id;
  final String judul;
  final String link;

  VideoPost({
    required this.id,
    required this.judul,
    required this.link,
  });

  // Factory constructor to create a VideoPost from JSON
  factory VideoPost.fromJson(Map<String, dynamic> json) {
    return VideoPost(
      id: json['id'],
      judul: json['judul'],
      link: json['link'],
    );
  }
}

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  YouTubeVideoPlayer({required this.videoUrl});

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }
}

class TreatmentPageCate extends StatefulWidget {
// class Avatar {
  final int avatarId;

  TreatmentPageCate({
    // super.key,
    required this.avatarId,
  });

  // factory Avatar.fromJson(Map<String, dynamic> json) {
  //   return Avatar(id: json['id'], avatar: json['avatar'], avatarId: json['id']);
  // }
// }
  @override
  _VideoFeedPageState createState() => _VideoFeedPageState();
}

class _VideoFeedPageState extends State<TreatmentPageCate> {
  List<VideoPost> _posts = [];
  List<Avatar> _avatars = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Function to fetch both video posts and avatars
  Future<void> _fetchData() async {
    await Future.wait([_fetchAvatars(), _fetchVideoFeed()]);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchAvatars() async {
    final response =
        await http.get(Uri.parse('https://app.aag4u.co.id/api/getAvatar'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (mounted) {
        setState(() {
          _avatars = data.map((item) => Avatar.fromJson(item)).toList();
        });
      }
    } else {
      throw Exception('Failed to load avatars');
    }
  }

  Future<void> _fetchVideoFeed() async {
    final response = await http.get(Uri.parse(
        'https://app.aag4u.co.id/api/getVideoHamaBy/${widget.avatarId}'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (mounted) {
        setState(() {
          _posts = data.map((item) => VideoPost.fromJson(item)).toList();
        });
      }
    } else {
      throw Exception('Failed to load video feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Video Feed Treatment", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner
          : Column(
              children: [
                _buildAvatarList(),
                Expanded(child: _buildFeedList()),
              ],
            ),
      // bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Avatar list widget
  Widget _buildAvatarList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _avatars.map((avatar) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TreatmentPageCate(avatarId: avatar.id),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(avatar.avatar),
                    ),
                    SizedBox(height: 4),
                    // Text(avatar.name, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Video feed list widget
  Widget _buildFeedList() {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return _buildPostItem(_posts[index]);
      },
    );
  }

  // Post item widget
  Widget _buildPostItem(VideoPost post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(post.avatar),
              // ),
              title: Text(post.judul),
              // subtitle: Text(post.postedAt),
            ),
            // Container(
            //   height: 200,
            //   color: Colors.black12,
            //   child:
            //       Icon(Icons.play_circle_filled, color: Colors.white, size: 64),
            // ),
            _buildVideoPreview(post.link),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  // children: [
                  //   Icon(Icons.favorite_border),
                  //   SizedBox(width: 8),
                  //   Text("${post.views} Views"),
                  // ],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPreview(String videoUrl) {
    return YouTubeVideoPlayer(videoUrl: videoUrl);
  }

  // Bottom navigation bar
  // Widget _buildBottomNavBar() {
  //   return BottomNavigationBar(
  //     items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //       BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  //       BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Add"),
  //     ],
  //     selectedItemColor: Colors.red,
  //     unselectedItemColor: Colors.grey,
  //   );
  // }
}
