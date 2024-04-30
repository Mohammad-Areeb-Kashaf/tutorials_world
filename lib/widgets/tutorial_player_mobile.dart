// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class TutorialPlayer extends StatefulWidget {
//   final String id;
//   final bool isList;
//   const TutorialPlayer({super.key, required this.id, required this.isList});

//   @override
//   State<TutorialPlayer> createState() => _TutorialPlayerState();
// }

// class _TutorialPlayerState extends State<TutorialPlayer> {
//   late final YoutubePlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     // if (Platform.isAndroid || Platform.isIOS) {
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.id,
//       flags: const YoutubePlayerFlags(
//         enableCaption: false,
//         mute: false,
//         autoPlay: true,
//         forceHD: true,
//       ),
//     );
//     // }
//   }

//   @override
//   void deactivate() {
//     _controller!.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   buildTutorialPlayer() {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: _controller!,
//         showVideoProgressIndicator: true,
//         progressColors: ProgressBarColors(
//           backgroundColor: Colors.grey.shade600,
//           playedColor: Colors.red,
//           handleColor: Colors.red,
//         ),
//         onEnded: (metadata) {},
//       ),
//       builder: (context, player) => Scaffold(
//         body: Column(
//           children: [
//             player,
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return buildTutorialPlayer();
//   }
// }
