import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoPlayerController controller;
  Timer? _hideTimer;
  int _lastSecond = 0;

  VideoCubit(this.controller)
      : super(VideoState(
    isPlaying: false,
    isMuted: false,
    isFullscreen: false,
    position: Duration.zero,
    duration: Duration.zero,
    showControls: true,
  )) {
    controller.addListener(_onVideoChanged);
    controller.initialize().then((_) {
      emit(state.copyWith(duration: controller.value.duration));
      // 👇 Do NOT auto play here anymore
      _startHideTimer();
    });
  }

  // ------------------------
  // Core playback control
  // ------------------------
  void play() {
    if (!controller.value.isPlaying) {
      controller.play();
      emit(state.copyWith(isPlaying: true));
    }
  }

  void pause() {
    if (controller.value.isPlaying) {
      controller.pause();
      emit(state.copyWith(isPlaying: false));
    }
  }

  void togglePlayPause() {
    controller.value.isPlaying ? pause() : play();
  }

  // ------------------------
  // Video features
  // ------------------------
  void skip(int seconds) {
    final newPos = controller.value.position + Duration(seconds: seconds);
    controller.seekTo(newPos);
  }

  void toggleMute() {
    final muted = !state.isMuted;
    controller.setVolume(muted ? 0 : 1);
    emit(state.copyWith(isMuted: muted));
  }

  void toggleFullscreen() {
    emit(state.copyWith(isFullscreen: !state.isFullscreen));
  }

  // ------------------------
  // UI Controls visibility
  // ------------------------
  void toggleControls() {
    emit(state.copyWith(showControls: !state.showControls));
    if (state.showControls) {
      _startHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      emit(state.copyWith(showControls: false));
    });
  }

  // ------------------------
  // Listener for position
  // ------------------------
  void _onVideoChanged() {
    if (!controller.value.isInitialized) return;

    final sec = controller.value.position.inSeconds;
    if (sec != _lastSecond) {
      _lastSecond = sec;
      emit(state.copyWith(
        isPlaying: controller.value.isPlaying,
        position: controller.value.position,
      ));
    }
  }

  // ------------------------
  // Dispose
  // ------------------------
  @override
  Future<void> close() {
    controller.removeListener(_onVideoChanged);
    controller.dispose();
    _hideTimer?.cancel();
    return super.close();
  }
}
