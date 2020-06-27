import 'package:flutter/material.dart';

//Paquetes
import 'package:animate_do/animate_do.dart';

//Rutas
import 'package:play_music/src/helpers/helpers.dart';
import 'package:play_music/src/models/audioplayer_model.dart';
import 'package:play_music/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class PlayMusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          BackGroundColor(),
          
          Column(
          children: <Widget>[
            CustomAppBar(), 
            ImagenDiscoDuarcion(),
            TextoBoton(),
            Expanded(child: Letra())
          ],
    ),
        ],
      ));
  }
}

class BackGroundColor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaSized = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mediaSized.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
          ])
      ),
      

    );
  }
}

class Letra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final letra = getLyrics();
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: letra.map((e) => Text(e, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6)),)).toList() ,
      ),
    );
  }
}

class TextoBoton extends StatefulWidget {

  @override
  _TextoBotonState createState() => _TextoBotonState();
}

class _TextoBotonState extends State<TextoBoton> with SingleTickerProviderStateMixin {

  bool isPlaying = false;

  AnimationController playAnimation;


  @override
  void initState() {
    playAnimation = AnimationController( vsync: this, duration: Duration( milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final estiloTexto1 = TextStyle( fontSize: 30, color: Colors.white.withOpacity(0.8));
    final estiloTexto2 = TextStyle( fontSize: 15,color: Colors.white.withOpacity(0.5));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Far Away', style: estiloTexto1),
              Text('-Breaking Benjamin-', style: estiloTexto2),
            ],
          ),
          Spacer(),
           FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, 
              progress: playAnimation,
              
            ),
            onPressed: (){
              
              final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
              
              if(this.isPlaying){

                playAnimation.reverse();
                this.isPlaying = false;
                audioPlayerModel.controller.stop();

              }else{

                playAnimation.forward();
                this.isPlaying = true;
                audioPlayerModel.controller.repeat();
                
              }
            })
        ],
      ),
    );
  }
}

class ImagenDiscoDuarcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 30 ),
      margin: EdgeInsets.only( top: 70 ),
      child: Row(
        children: <Widget>[
          ImagenDisco(),
          SizedBox(width: 40,),

          BarraProgreso(),
          SizedBox(width: 20,),
        ],
        
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estiloTexto = TextStyle( color: Colors.white.withOpacity(0.4));
    return Container(
      child: Column(
        children: <Widget>[
          Text('00.00', style: estiloTexto ,),
          SizedBox(height: 10,),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 100,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              
            ],
          ),
          SizedBox(height: 10,),
          Text('00.00', style: estiloTexto ,)
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            SpinPerfect(
              animate: false,
              duration: Duration(seconds:10),
              infinite: true,
              manualTrigger: true,
              controller: ( animationController ) => audioPlayerModel.controller = animationController ,
              child: Image( 
                  image: AssetImage('assets/aurora.jpg')
              ),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ])
      ),
    );
  }
}
