import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/VideoPlayer.dart';
// import 'package:flutter_aag4u/pages/VideoPlayerPage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Import your Avatar model

class VideoPost {
  final int id;
  final String judul;
  final String link;
  final List<Map<String, dynamic>>
      avatar_group; // Misalnya, jika avatar_group adalah daftar String

  VideoPost({
    required this.id,
    required this.judul,
    required this.link,
    required this.avatar_group,
  });

  // Factory constructor to create a VideoPost from JSON
  factory VideoPost.fromJson(Map<String, dynamic> json) {
    return VideoPost(
      id: json['id'],
      judul: json['judul'],
      link: json['link'],
      avatar_group: List<Map<String, dynamic>>.from(
          json['avatar_group']), // Cast to List<String>
    );
  }
}

class Avatar {
  final int id;
  final String avatar;
  final String name;

  Avatar({
    required this.id,
    required this.avatar,
    required this.name,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      id: json['id'],
      avatar: json['avatar'],
      name: json['name'],
    );
  }
}

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

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
        forceHD: true, // Ensure HD quality if available
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String?> fetchThumbnail() async {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    return YoutubePlayer.getThumbnail(videoId: videoId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigate to the VideoPlayerPage
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => VideoPlayerPage(videoUrl: widget.videoUrl),
        //   ),
        // );
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) =>
                VideoPlayerPage(videoUrl: widget.videoUrl),
          ),
        );
      },
      child: Center(
        child: Column(
          children: [
            // Display the thumbnail as the preview
            FutureBuilder<String?>(
              future: fetchThumbnail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return LayoutBuilder(builder: (context, constraints) {
                      // Jika lebar lebih dari 600, anggap sebagai tablet
                      double screenWidth = constraints.maxWidth > 600
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.9;
                      return Container(
                        width: screenWidth,
                        height: screenHeight * 0.19,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Thumbnail Image
                            CachedNetworkImage
                                // Image.network
                                (
                              imageUrl:
                                  snapshot.data!, // Adjust height as needed

                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: screenHeight,
                            ),
                            // Play Icon Overlay
                            Icon(
                              Icons.play_circle_filled,
                              color: Colors.white.withOpacity(0.8),
                              size: 60,
                            ),
                          ],
                        ),
                      );
                    });
                  } else {
                    return Container(
                      height: 200,
                      color: Colors.grey[300], // Placeholder color
                      child: Center(
                          child: Text('Thumbnail not available',
                              style: TextStyle(fontSize: fontSize * 0.04))),
                    );
                  }
                }
                return Container(
                  height: 200,
                  color: Colors.grey[300], // Placeholder color
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            // Optionally, you can show the Youtube player in a minimized form
            // YoutubePlayer(
            //   controller: _controller,
            //   showVideoProgressIndicator: true,
            //   progressIndicatorColor: Colors.red,
            // ),
          ],
        ),
      ),
    );
  }
}

class TreatmentPage extends StatefulWidget {
  @override
  _VideoFeedPageState createState() => _VideoFeedPageState();
}

class _VideoFeedPageState extends State<TreatmentPage> {
  List<VideoPost> _posts = [];
  List<dynamic> _avatars = [];
  List<dynamic> _avatarsname = [];
  bool _isLoading = true;
  bool _isLoadingdata = true;
  int? _selectedAvatarIds;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _loadData();
  }

  // Function to fetch both video posts and avatars
  Future<void> _fetchData() async {
    // await Future.wait([_fetchAvatars(), _fetchVideoFeed(String avatarId)]);
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      // await Future.wait([
      //   _fetchAvatars(),
      // ]);
      // setState(() {
      //   // _isLoading = false;
      // });
      await _fetchAvatars();
      await _fetchVideoFeed();
      // setState(() {
      //   _isLoading = false;
      // });
    } else {
      await Nointernet();
    }
  }

  Future<void> _fetchAvatars() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    final response =
        await http.get(Uri.parse('https://app.aag4u.co.id/api/getAvatar'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (mounted) {
        setState(() {
          _avatars = [
            Avatar(
                id: 0,
                avatar: 'https://app.aag4u.co.id/public/image/all-pest.png',
                name: 'All'),
            ...data.map((item) => Avatar.fromJson(item)).toList(),
          ];
          // _avatarsname = data.map((item) => Avatar.fromJson(item)).toList();

          print("data avatar : $_avatars ");
          _isLoading = false;
        });
      }
    } else {
      throw Exception('Failed to load avatars');
    }
  }

  // Future<void> _fetchVideoFeed(String avatarId) async {
  //   final response =
  //       await http.get(Uri.parse('https://app.aag4u.co.id/api/getVideoHama'));
  Future<void> _fetchVideoFeed([String? avatarId]) async {
    if (mounted) {
      setState(() {
        _isLoadingdata = true;
      });
    }
    String urel = 'https://app.aag4u.co.id/api/getVideoHama';
    if (avatarId != null && avatarId != '0') {
      urel += 'By/$avatarId';
    }

    final response = await http.get(
      Uri.parse(urel),
    );

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = json.decode(response.body);
        if (mounted) {
          setState(() {
            _posts = data.map((item) => VideoPost.fromJson(item)).toList();
            _isLoadingdata = false;
          });
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Response body: ${response.body}');
        throw Exception('Invalid JSON format');
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load video feed');
    }
  }

  Future<void> _loadData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {
        _isLoading = false; // Selesai memuat data
      });
    }
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {
        _isLoadingdata = true; // Selesai memuat data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width * 0.05;
    double screenHeight = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenHeight,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: screenWidth,
            ),
          ),
        ),
        title: Text(
          "Video Feed Treatment",
          style: TextStyle(color: Colors.black, fontSize: fontSize),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: InternetConnectionChecker().hasConnection,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == false) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/assets/No_internet.png',
                      width: screenWidth * 8.0),
                  SizedBox(height: 20),
                  Text(
                    'No Internet Connection',
                    style: TextStyle(
                        fontSize: fontSize * 1.0, color: Colors.black54),
                  ),
                  // SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {});
                  //   },
                  //   child: Text('Retry'),
                  // )
                ],
              ),
            );
          } else {
            return _isLoading
                ? buildShimmer()
                //  Center(
                //     child: LoadingAnimationWidget.inkDrop(
                //         color: const Color.fromARGB(255, 34, 20, 227),
                //         size: 50)) // Show loading spinner

                : Column(
                    children: [
                      _buildAvatarList(),
                      Expanded(child: _buildFeedList()),
                    ],
                  );
          }
        },
      ),

      //  _isLoading
      //     ? buildShimmer()
      //     //  Center(
      //     //     child: LoadingAnimationWidget.inkDrop(
      //     //         color: const Color.fromARGB(255, 34, 20, 227),
      //     //         size: 50)) // Show loading spinner

      //     : Column(
      //         children: [
      //           _buildAvatarList(),
      //           Expanded(child: _buildFeedList()),
      //         ],
      //       )

      // bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Avatar list widget
  Widget _buildAvatarList() {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidthavatar = MediaQuery.of(context).size.width;
    double screenHeightavatar = MediaQuery.of(context).size.height;

    return Padding(
      // padding: const EdgeInsets.only(left: 5, right: 5),
      padding: MediaQuery.of(context).size.width > 600
          ? EdgeInsets.symmetric(
              horizontal: screenWidth * 0.09) // Tablet: Padding kiri-kanan
          : EdgeInsets.zero, // HP: Tidak ada padding
      child: Container(
        width: screenWidthavatar * 1.0,
        height: screenHeightavatar * 0.19,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: _avatars.map((avatar) {
                  bool isSelected = _selectedAvatarIds == avatar.id;

                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        _selectedAvatarIds =
                            avatar.id; // Update the selected avatar
                      });

                      // Fetch videos for the clicked avatar
                      await _fetchVideoFeed(
                          avatar.id == 0 ? null : avatar.id.toString());

                      // Optionally navigate to another page or perform other actions
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TreatmentPageCate(avatarId: avatar.id),
                      //   ),
                      // );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width > 600
                                            ? screenWidthavatar * 0.20 // Tablet
                                            : screenWidthavatar * 0.24, // HP
                                    height: screenHeightavatar * 0.12,
                                    // color: Colors.amber,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? const Color.fromARGB(
                                                  255, 0, 47, 255)
                                              .withOpacity(0.3)
                                          : const Color.fromARGB(
                                              0, 4, 211, 49), // Highlight color
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: screenWidthavatar * 0.19,
                                              height: screenHeightavatar * 0.10,
                                              // color: Colors.amber,
                                              child: CircleAvatar(
                                                // radius: screenWidth * 0.08,
                                                radius: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        850
                                                    ? screenWidth *
                                                        0.08 // Tablet: Ukuran lebih besar
                                                    : screenWidth *
                                                        0.09, // HP: Ukuran standar
                                                backgroundImage:
                                                    NetworkImage(avatar.avatar),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              // SizedBox(height: 10),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        avatar.name,
                                        style: TextStyle(fontSize: fontSize),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Video feed list widget
  Widget _buildFeedList() {
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;

    if (_isLoadingdata) {
      return Center(
        child: LoadingAnimationWidget.inkDrop(
          color: const Color.fromARGB(255, 34, 20, 227),
          size: 50,
        ),
      );
    }

    if (_posts.isEmpty) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_outlined,
                size: iconSize * 0.04,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Belum tersedia",
                style: TextStyle(
                    fontSize: fontSize * 0.04, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ));
    }

    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return _buildPostItem(_posts[index]);
      },
    );
  }

  // Post item widget
  Widget _buildPostItem(VideoPost post) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height * 0.40;
    double screenWidthcart = MediaQuery.of(context).size.width;
    double screenHeightcart = MediaQuery.of(context).size.height;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    final hama = post.avatar_group;
    final hamaNames = hama
        .map((hama) =>
            (hama as Map<String, dynamic>)['avatar_hama']['name'] ?? 'No name')
        .join(' #');
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: screenWidth * 0.02,
        // width: 10,
        // height: screenHeight,
        // height: 400,
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: MediaQuery.of(context).size.width > 600
            ? EdgeInsets.symmetric(
                horizontal: screenWidth * 0.09) // Tablet: Padding kiri-kanan
            : EdgeInsets.zero, // HP: Tidak ada padding
        child: Card(
          color: Colors.white,
          elevation: 2,
          // margin: EdgeInsets.only(
          //     left: screenWidthcart * 0.07,
          //     right: screenHeightcart * 0.05), // Jarak dengan elemen lain

          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(post.avatar),
                    // ),
                    title: Text(
                      post.judul,
                      style: TextStyle(
                        fontSize: fontSize,
                        overflow: TextOverflow.visible,
                      ),
                    ),
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
                      children: [
                        //   Icon(Icons.favorite_border),
                        //   SizedBox(width: 8),
                        Text(
                          "#${hamaNames} ",
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              height: 150.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget Nointernet() {
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/assets/No_internet.png', width: screenWidth),
          SizedBox(height: 20),
          Text(
            'No Internet Connection',
            style: TextStyle(fontSize: fontSize * 1.0, color: Colors.black54),
          ),
          // SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   child: Text('Retry'),
          // )
        ],
      ),
    );
  }
}
