import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/slider_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/loading.dart';

class SplashPage extends StatelessWidget {

  final SplashPageController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  width: MediaQuery.of(context).size.width * 0.45,
                  image: AssetImage('assets/images/logo.png'),
                ),
                Container(
                  child: Image(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.11,
                    image: AssetImage('assets/images/app_name.png'),
                  ),
                  margin: EdgeInsets.all(20),
                )
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(16),
                  child: loading(which: FADING_CIRCLE_SPIN)),
            )
          ]),
        ));
  }
}
