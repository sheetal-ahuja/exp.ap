import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Youtubeplayback extends StatefulWidget {
  const Youtubeplayback({super.key});

  @override
  State<Youtubeplayback> createState() => _YoutubeplaybackState();
}

class _YoutubeplaybackState extends State<Youtubeplayback> {
  // Change the url of the video from the url of ur choice
  final videoId = "DNYCgsyOAW4";

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: "DNYCgsyOAW4",
    autoPlay: true,
    params: const YoutubePlayerParams(
      // showFullscreenButton: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16/9,
      ),
    );
  }
}