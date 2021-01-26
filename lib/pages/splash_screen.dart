import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/slider_controller.dart';
import 'package:shoplustyle/network/api_requests.dart';

class SplashScreen extends StatelessWidget {

  bool loading = true;
  ApiRequests apiRequests = ApiRequests();
  final bannerController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    bannerController.getBanners();
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SafeArea(
          child:
          Stack(
              children:[
                Center(
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          width: MediaQuery.of(context).size.width * 0.45,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        Container(
                          child:
                          Image(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.11,
                            image: AssetImage('assets/images/app_name.png'),
                          ),
                          margin: EdgeInsets.all(20),
                        )
                      ],
                    )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(16),
                      child:
                      Visibility(
                        child:
                        SpinKitFadingCircle(
                          color: Color.fromRGBO(49,72,250,100),
                        ),
                        visible: loading,
                      )
                  ),
                )
              ]
          ),
        )
    );

  }
}
