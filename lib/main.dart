import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  File _video;

  VideoPlayerController _videoPlayerController;



  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    // ignore: deprecated_member_use
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    _video = video;
    _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_) {
      setState(() { });
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        title: Text("Social Player"),
      ),
      backgroundColor: Colors.blueGrey[500],
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 15),
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          splashColor: Colors.green,
                          highlightedBorderColor: Colors.black,
                          borderSide: BorderSide(color: Colors.lightGreenAccent),
                          onPressed:  _pickVideo,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 9),
                              child: Row(
                                children: <Widget>[
                                  Text("Select Video ",
                                    style: TextStyle(
                                        color: Colors.lightGreenAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  Icon(
                                    Icons.file_download,color: Colors.lightGreenAccent,
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 15),
                        child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        splashColor: Colors.lightBlueAccent[700],
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.lightBlueAccent[100]),
                        onPressed: (){},
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Text(" Upload ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                                Icon(
                                  Icons.file_upload,color: Colors.blue,
                                )
                              ],
                            )
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                if(_video != null)
                  _videoPlayerController.value.initialized
                      ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child:Card(
                          color: Colors.black,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:  Stack(
                                children: <Widget>[
                                  VideoPlayer(_videoPlayerController),

                                  Positioned(
                                    bottom: 5,
                                    right: 30,
                                    height: 45,
                                    width: 300,
                                    child:  RaisedButton(
                                      highlightColor: Colors.white24,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      color: Colors.black26,
                                      child: Icon(
                                          _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          if(_videoPlayerController.value.isPlaying){
                                            _videoPlayerController.pause();
                                          }
                                          else{
                                            _videoPlayerController.play();
                                          }
                                        });
                                      },
                                    ),
                                  )
                                ],
                              )
                          )
                      )
                  )
                      : Container()
                else
                  Card(
                      color: Colors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child:  Center(
                            child: Text("Click Select Video  to Display\nthe video in this Section. ",textAlign:TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w300
                            ),
                            ),
                          )
                      )
                  ),
                Card(
                    color: Colors.black38,
                    elevation:1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:  Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            color: Colors.red,
                            splashColor: Colors.black26,
                            onPressed: (){},
                            child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 100),
                                child: Row(
                                  children: <Widget>[
                                    Text(" Delete ",
                                      style: TextStyle(
                                        letterSpacing: 2,
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Icon(
                                        Icons.delete_forever,color: Colors.black38,
                                    )
                                  ],
                                )
                            ),
                          ),
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}