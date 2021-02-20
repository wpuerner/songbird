import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundController {

  static final SoundController _instance = SoundController._internal();

  factory SoundController() {
    return _instance;
  }

  SoundController._internal();

  static AudioCache _cache = AudioCache(prefix: "assets/sfx/");

  static AudioPlayer _player;

  void initialize() {
    _cache.loadAll(["ticking_clock.wav", "quack.mp3", "ding.wav"]);
  }

  void startTicking() async {
    if (_player == null) {
      _player = await _cache.loop("ticking_clock.wav");
    } else {
      _player.resume();
    }
  }

  void stopTicking() {
    _player.stop();
  }

  void ding() {
    _cache.play("ding.wav");
  }

  void quack() {
    _cache.play("quack.mp3");
  }

}