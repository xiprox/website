import 'package:api_call/resource.dart';
import 'package:veee/veee.dart';
import 'package:supercharged/supercharged.dart';
import 'package:website/data/models/track.dart';
import 'package:website/services/services.dart';

class PlayerViewModel extends ViewModel with BusyViewModel {
  final _api = get<Api>();
  final _player = get<AudioPlayer>();

  Resource<List<Track>>? tracks = Resource.loading();

  int _trackIndex = 0;

  Track? get currentTrack => tracks?.data?.elementAt(_trackIndex);

  bool get isPlaying => _player.playing;

  Stream<Duration> get position => _player.position;

  Duration? get duration => _player.duration;

  @override
  void onCreate() {
    super.onCreate();
    _fetch();
    _setUpPlayerListeners();
  }

  void _fetch() async {
    final resource = await _api.getTracks();
    if (resource.isSuccess()) {
      tracks = resource;
      resource.data?.shuffle();
      if (currentTrack != null) {
        _loadTrack(currentTrack!);
      }
    } else {
      tracks = resource;
    }
    notifyListeners();
  }

  void _setUpPlayerListeners() {
    _player.state.listen((state) {
      if (state.processingState == AudioProcessingState.completed) {
        onCurrentTrackFinishPlaying();
      }
    });
  }

  void _loadTrack(Track track) {
    if (track.previewUrl == null) return;
    _player.load(track.previewUrl!);
    notifyListeners();
  }

  void _playNext() {
    if (_trackIndex == tracks?.data?.lastIndex) {
      _trackIndex = 0;
      tracks?.data?.shuffle();
    } else {
      _trackIndex++;
    }
    _loadTrack(currentTrack!);
    notifyListeners();
  }

  void onCurrentTrackFinishPlaying() {
    _playNext();
  }

  void onPlayPausePress() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    notifyListeners();
  }

  void onNextPress() {
    _playNext();
  }
}
