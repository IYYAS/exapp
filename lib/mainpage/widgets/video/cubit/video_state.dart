part of 'video_cubit.dart';

@immutable
class VideoState {
  final bool isPlaying;
  final bool isMuted;
  final bool isFullscreen;
  final Duration position;
  final Duration duration;
  final bool showControls;

  const VideoState({
    required this.isPlaying,
    required this.isMuted,
    required this.isFullscreen,
    required this.position,
    required this.duration,
    required this.showControls,
  });

  VideoState copyWith({
    bool? isPlaying,
    bool? isMuted,
    bool? isFullscreen,
    Duration? position,
    Duration? duration,
    bool? showControls,
  }) {
    return VideoState(
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      showControls: showControls ?? this.showControls,
    );
  }
}
