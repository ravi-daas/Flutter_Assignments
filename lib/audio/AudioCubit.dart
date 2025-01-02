import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

// States
abstract class AudioState {}

class AudioInitial extends AudioState {}
class AudioPlaying extends AudioState {}
class AudioPaused extends AudioState {}
class AudioStopped extends AudioState {}

// Cubit
class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioInitial());

  Future<void> playAudio(String assetPath) async {
    await _audioPlayer.play(AssetSource(assetPath));
    emit(AudioPlaying());
  }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    emit(AudioPaused());
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    emit(AudioStopped());
  }
}
