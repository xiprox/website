import 'package:veee/veee.dart';
import 'package:website/data/models/track.dart';
import 'package:website/services/services.dart';

class PlayerViewModel extends ViewModel with BusyViewModel {
  final _api = get<Api>();
  final _player = get<AudioPlayer>();

  List<Track>? tracks;

  Track? currentTrack;

  @override
  void onCreate() {
    super.onCreate();
    _fetch();
  }

  void _fetch() async {
    final resource = await _api.getTracks();
    if (resource.isSuccess()) {
      tracks = resource.data!;
      notifyListeners();
    } else {
      print(resource.error);
    }
  }
}
