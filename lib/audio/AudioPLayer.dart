import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_internshala/audio/AudioCubit.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'audio_cubit.dart'; // Import your AudioCubit

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: BlocProvider(
        create: (context) => AudioCubit(),
        child: BlocBuilder<AudioCubit, AudioState>(
          builder: (context, state) {
            if (state is AudioInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Start playing the audio
                    context.read<AudioCubit>().playAudio('audio/reel.mp3');
                  },
                  child: Text('Play'),
                ),
              );
            } else if (state is AudioPlaying) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Now Playing'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AudioCubit>().pauseAudio();
                      },
                      child: Text('Pause'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AudioCubit>().stopAudio();
                      },
                      child: Text('Stop'),
                    ),
                  ],
                ),
              );
            } else if (state is AudioPaused) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Paused'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AudioCubit>().playAudio('audio/reel.mp3');
                      },
                      child: Text('Resume'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AudioCubit>().stopAudio();
                      },
                      child: Text('Stop'),
                    ),
                  ],
                ),
              );
            } else if (state is AudioStopped) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AudioCubit>().playAudio('audio/reel.mp3');
                  },
                  child: Text('Play Again'),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
