import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'cubit/video_cubit.dart';

class ProfessionalVideoPlayer extends StatelessWidget {
  final String videoUrl;
  const ProfessionalVideoPlayer({super.key, required this.videoUrl});

  String _format(Duration d) =>
      "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoCubit(VideoPlayerController.network(videoUrl)),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          final cubit = context.read<VideoCubit>();

          if (!cubit.controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          Widget video = AspectRatio(
            aspectRatio: cubit.controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(cubit.controller),
                if (cubit.controller.value.isBuffering)
                  const Center(child: CircularProgressIndicator()),
                if (state!.showControls) _buildControls(context, state),
              ],
            ),
          );

          return GestureDetector(
            onTap: cubit.toggleControls,
            child: state.isFullscreen
                ? Scaffold(
              backgroundColor: Colors.black,
              body: Center(child: video),
            )
                : video,
          );
        },
      ),
    );
  }

  Widget _buildControls(BuildContext context, VideoState state) {
    final cubit = context.read<VideoCubit>();
    return Container(
      color: Colors.black26,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoProgressIndicator(
            cubit.controller,
            allowScrubbing: true,
          ),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white),
                  onPressed: () => cubit.skip(-10)),
              IconButton(
                icon: Icon(
                  state.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: cubit.togglePlayPause,
              ),
              IconButton(
                  icon: const Icon(Icons.forward_10, color: Colors.white),
                  onPressed: () => cubit.skip(10)),
              IconButton(
                icon: Icon(
                  state.isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                ),
                onPressed: cubit.toggleMute,
              ),
              const Spacer(),
              Text(
                "${_format(state.position)} / ${_format(state.duration)}",
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: Icon(
                  state.isFullscreen
                      ? Icons.fullscreen_exit
                      : Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: cubit.toggleFullscreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
