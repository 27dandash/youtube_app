import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoListScreen(),
    );
  }
}

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  YoutubePlayerController? _controller;
  final List<String> _videoIds = [
    'nPt8bK2gbaU',
    'dQw4w9WgXcQ',
    '3fumBcKC6RE',
    'lTTajzrSkCw',
    'E7wJTI-1dvQ',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoIds[0],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onVideoSelected(String videoId) {
    _controller?.load(videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player Demo'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _videoIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Video ${index + 1}'),
                  subtitle: Text('Video ID: ${_videoIds[index]}'),
                  onTap: () => _onVideoSelected(_videoIds[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
