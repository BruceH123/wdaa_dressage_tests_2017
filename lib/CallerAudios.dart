import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/Levels.dart'; // GlobalLevel
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart'; // GlobalTest
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/TestInformation.dart'; // GlobalArena
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';

class CallerAudios extends StatefulWidget {
  @override
  _CallerAudiosState createState() => _CallerAudiosState();
}

class _CallerAudiosState extends State<CallerAudios> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light, // make icons in Status bar black
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              dispose();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestInfo()),
              ); // Navigator.push
            } // onPressed
            ),
        title: Text(
          'Caller Audios',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: stdFontSize),
        ),
      ),
      body: ListView(children: <Widget>[
        Row(
          // "2017 WDAA Introductory Level"
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Expanded(
              child: Container(
                child: Text(
                  '2017 WDAA $longGloballevel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: stdFontSize
                    ,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          // Test 1 Large Arena
          // 2017 WDAA longLevel Information
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Expanded(
              child: Container(
                child: Text(
               '$longGlobalTest  $longGlobalArena',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:  Colors.black,
                    fontSize: stdFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(0.0,
              MediaQuery.of(context).size.height * 0.1, 0.0, 0.0),
          child: Column(children: [
                  ValueListenableBuilder<ProgressBarState>(
                    valueListenable: _pageManager.progressNotifier,
                    builder: (_, value, __) {
                      return ProgressBar(
                        progress: value.current,
                        buffered: value.buffered,
                        total: value.total,
                        onSeek: _pageManager.seek,
                      );
                    },
                  ),

                    ValueListenableBuilder<ButtonState>(
                    valueListenable: _pageManager.buttonNotifier,
                    // ignore: missing_return
                    builder: (_, value, __) {
                      switch (value) {
                        case ButtonState.loading:
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            width: 32.0,
                            height: 32.0,
                            child: CircularProgressIndicator(),
                          );
                        case ButtonState.paused:
                          return IconButton(
                            icon: Icon(Icons.play_arrow),
                            iconSize:  32.0,
                            onPressed: _pageManager.play,
                          );
                        case ButtonState.playing:
                          return IconButton(
                            icon: Icon(Icons.pause),
                            iconSize: 32.0,
                            onPressed: _pageManager.pause,
                          );
                      } // switch (value)
                    }, // builder
                  )
                ] // children
              ),
        ),
        Row(
          // Test Info
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0,
                    MediaQuery.of(context).size.height * 0.05, 5.0, 0.0),
                child: Image.asset('assets/images/WDAudio.jpg',
                fit: BoxFit.fitHeight,
                height: imageHeight),
              ),
            ),

    ], // children
        ),
        ] // children: padding
          ),
    );
  }
}

class PageManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioPlayer;
  final asset =
  // needed because L2T1L.mp3 does not work with this widget, so L is omitted
       shortGlobalLevel != 'L2'
      ?  'resources/$shortGlobalLevel/audios/'
      '$shortGlobalLevel$shortGlobalTest$shortGlobalArena.mp3'
      :  'resources/$shortGlobalLevel/audios/'
          '$shortGlobalLevel$shortGlobalTest.mp3';
  PageManager() {
    _init();
  }

  void _init() async {
    // initialize the song
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAsset(
  // needed because L2T1L.mp3 does not work with this widget, so L is omitted
        shortGlobalLevel != 'L2'
        ?  'resources/$shortGlobalLevel/audios/'
        '$shortGlobalLevel$shortGlobalTest$shortGlobalArena.mp3'
        :  'resources/$shortGlobalLevel/audios/'
        '$shortGlobalLevel$shortGlobalTest.mp3');
    
    // listen for changes in player state
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    // listen for changes in play position
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    // listen for changes in the buffered position
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    // listen for changes in the total audio duration
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
