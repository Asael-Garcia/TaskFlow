import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer= AudioPlayer();
String dindong="lib/audio/dindong.m4a";
String ready="lib/audio/ready.m4a";

void playDingDong(){
  audioPlayer.play(UrlSource(dindong));
}

void playReady(){
  audioPlayer.play(UrlSource(ready));
}