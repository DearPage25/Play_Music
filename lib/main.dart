import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_music/src/pages/play_music_page.dart';
import 'package:play_music/src/themes/theme.dart';
 
void main() {

  SystemChrome.setSystemUIOverlayStyle(
    
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: Brightness.light
    )
  );
  
  
  runApp(MyApp());
   
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Music',
      theme: miTema,
      home: PlayMusicPage()
    );
  }
}