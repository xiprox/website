import 'package:just_audio/just_audio.dart' as ja;

enum AudioProcessingState {
  idle,
  loading,
  buffering,
  ready,
  completed,
}

class AudioPlayerState {
  final bool playing;
  final AudioProcessingState processingState;
  AudioPlayerState(this.playing, this.processingState);
}

abstract class AudioPlayer {
  bool get playing;
  Stream<bool> get playingStream;
  Future load(String url);
  Future play();
  Future pause();
  Future stop();
  Stream<AudioPlayerState> get state;
  Stream<Duration> get position;
}

class JustAudioAudioPlayer extends AudioPlayer {
  final _player = ja.AudioPlayer();

  @override
  bool get playing => _player.playerState.playing;

  @override
  Stream<bool> get playingStream => _player.playingStream;

  @override
  Future load(String url) {
    return _player.setUrl(url);
  }

  @override
  Future play() => _player.play();

  @override
  Future pause() => _player.pause();

  @override
  Future stop() => _player.stop();

  @override
  Stream<AudioPlayerState> get state {
    return _player.playerStateStream.map((event) {
      AudioProcessingState state;
      if (event.processingState == ja.ProcessingState.idle) {
        state = AudioProcessingState.idle;
      } else if (event.processingState == ja.ProcessingState.loading) {
        state = AudioProcessingState.loading;
      } else if (event.processingState == ja.ProcessingState.buffering) {
        state = AudioProcessingState.buffering;
      } else if (event.processingState == ja.ProcessingState.ready) {
        state = AudioProcessingState.ready;
      } else {
        state = AudioProcessingState.completed;
      }
      return AudioPlayerState(event.playing, state);
    });
  }

  @override
  Stream<Duration> get position => _player.positionStream;
}
