import 'dart:async';

import 'package:amat_foodies/SlideDots.dart';
import 'package:amat_foodies/SlideImages.dart';
import 'package:amat_foodies/Slide_Models.dart';
import 'package:flutter/material.dart';


class SliderScreen extends StatefulWidget {

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  int _currentPage = 0;
  final PageController _pageController = PageController(
      initialPage: 0
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage < 2){
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300 ),
          curve: Curves.easeIn);
    }
    );
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red),
      home: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: slideList.length,
              itemBuilder: (ctx, i) => SlideItems(i),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child:
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    for(int i = 0; i < slideList.length; i++)
                      if(i == _currentPage)
                        SlideDots(isActive: true,)
                      else
                        SlideDots(isActive: false,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
