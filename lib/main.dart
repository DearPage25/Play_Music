import 'package:flutter/material.dart';

//paquetes o complementos
import 'package:flutter/services.dart';
import 'package:play_music/src/models/audioplayer_model.dart';
//routes
import 'package:play_music/src/pages/play_music_page.dart';

//themes
import 'package:play_music/src/themes/theme.dart';
import 'package:provider/provider.dart';
 
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  AudioPlayerModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Play Music',
        theme: miTema,
        home: PlayMusicPage()
      ),
    );
  }
}