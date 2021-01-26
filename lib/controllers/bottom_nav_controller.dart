import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/pages/blog_page.dart';
import 'package:shoplustyle/pages/home_page.dart';
import 'package:shoplustyle/pages/search_page.dart';
import 'package:soundpool/soundpool.dart';


class NavController extends GetxController{

  final pagesInfo = [
    {
      "name": "Blog",
      "object" : BlogPage()
    },
    {
      "name": "Home Page",
      "object" : HomePage()
    },
    {
      "name": "Search",
      "object" : SearchPage()
    },
  ];

  var selected = 1.obs;

  void switchPage (pageNum){
    selected.value = pageNum;
    loadSound();
    update();
  }

  void loadSound () async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle.load("assets/audio/click_sound.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });

    int streamId = await pool.play(soundId);
  }
}