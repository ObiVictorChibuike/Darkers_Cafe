import 'package:amat_foodies/Screens/SignUppage.dart';
import 'package:amat_foodies/Slide_Models.dart';
import 'package:flutter/material.dart';
import 'Slide_Models.dart';



class SlideItems extends StatelessWidget {
  final int index;
  SlideItems(this.index);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red),
      home: Scaffold(
          body: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget> [
                Container(
                  child: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors:[Colors.black,Colors.transparent]
                    ).createShader(rect),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(slideList[index].imageUrl),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                        ),
                      ),
                    ),
                  ),
                ),

                Align(alignment: Alignment.topCenter, //margin: EdgeInsets.only(top: 115),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Icon(Icons.local_pizza_outlined,color: Colors.red,size: 75,),
                      Text("DASKAR'S",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),),
                      Text("Cafe",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(flex: 3,),
                      Text(slideList[index].title,
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(height: 120,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35,right: 35,),
                        child: SizedBox(height: 45,width: double.maxFinite,
                          child: RaisedButton(onPressed: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                            child:Text("Get Started Here", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            elevation: 5.0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(height: 65,)
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
}
